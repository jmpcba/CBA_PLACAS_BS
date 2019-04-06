Imports System.Data
Public Class Producto
    Private _idProd As Integer
    Private _cod As Integer
    Private _hoja As Hoja
    Private _marco As Marco
    Private _madera As Madera
    Private _chapa As Chapa
    Private _precioUnitario As Decimal
    Private _mano As Mano
    Private _linea As Linea
    Private _stock As Integer
    Private _despiece As DataTable
    Private db As DbHelper
    Private _modificado As Boolean = False
    Private _modificaStock As Boolean = False
    Private _regCambios As New list(Of String)

    Public Sub New(ByVal _hoja As Hoja, ByVal _marco As Marco, ByVal _madera As Madera, ByVal _chapa As Chapa, ByVal _mano As Mano, ByVal _linea As Linea, _precio As Decimal)
        Try
            'Crear objecto desde cero
            db = New DbHelper("PRODUCTOS")
            Dim dt = New DataTable
            Me._linea = _linea
            Me._hoja = _hoja
            Me._marco = _marco
            Me._madera = _madera
            Me._chapa = _chapa
            Me._mano = _mano
            Me._precioUnitario = _precio
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub New(ByVal _hoja As Hoja, ByVal _marco As Marco, ByVal _madera As Madera, ByVal _chapa As Chapa, ByVal _mano As Mano, ByVal _linea As Linea)
        Try
            'Crear objecto desde cero
            db = New DbHelper("PRODUCTOS")
            Dim dt = New DataTable
            Me._linea = _linea
            Me._hoja = _hoja
            Me._marco = _marco
            Me._madera = _madera
            Me._chapa = _chapa
            Me._mano = _mano
            dt = db.buscar(Me)
            If dt.Rows.Count > 0 Then
                Me._idProd = dt(0)("id")
                Me.precioUnitario = dt(0)("precio")
                Me._stock = dt(0)("stock")
                Me._cod = dt(0)("COD")
                Me._precioUnitario = Math.Round(precioUnitario, 2)
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub New(_id As Integer)
        Dim dt = New DataTable()
        Dim idHoja As Integer
        Dim idMarco As Integer
        Dim idMadera As Integer
        Dim idChapa As Integer
        Dim idMano As Integer
        Dim idLinea As Integer

        db = New DbHelper("PRODUCTOS")
        dt = db.getProducto(_id)

        _idProd = dt(0)("id")
        _precioUnitario = dt(0)("precio")
        _stock = dt(0)("stock")

        idHoja = dt(0)("idHoja")
        idMarco = dt(0)("idMarco")
        idMadera = dt(0)("idMadera")
        idChapa = dt(0)("idChapa")
        idMano = dt(0)("idMano")
        idLinea = dt(0)("idLinea")
        _cod = dt(0)("COD")

        _hoja = New Hoja(idHoja)
        _marco = New Marco(idMarco)
        _madera = New Madera(idMadera)
        _chapa = New Chapa(idChapa)
        _mano = New Mano(idMano)
        _linea = New Linea(idLinea)
        _despiece = db.getDespiece(_idProd)

    End Sub

    Public ReadOnly Property modificado As Boolean
        Get
            Return _modificado
        End Get
    End Property

    Public ReadOnly Property id As Integer
        Get
            Return _idProd
        End Get
    End Property
    Public Property hoja As Hoja
        Set(value As Hoja)
            _regCambios.Add(String.Format("HOJA ANTERIOR: {0}, NUEVA {1}", hoja.nombre, value.nombre))
            _hoja = value
            _modificado = True
        End Set
        Get
            Return _hoja
        End Get
    End Property
    Public Property marco As Marco
        Set(value As Marco)
            _regCambios.Add(String.Format("MARCO ANTERIOR: {0}, NUEVO {1}", marco.nombre, value.nombre))
            _marco = value
            _modificado = True
        End Set
        Get
            Return _marco
        End Get
    End Property
    Public Property madera As Madera
        Set(value As Madera)
            _regCambios.Add(String.Format("MADERA ANTERIOR: {0}, NUEVA {1}", madera.nombre, value.nombre))
            _madera = value
            _modificado = True
        End Set
        Get
            Return _madera
        End Get
    End Property
    Public Property chapa As Chapa
        Set(value As Chapa)
            _regCambios.Add(String.Format("CHAPA ANTERIOR: {0}, NUEVA {1}", chapa.nombre, value.nombre))
            _chapa = value
            _modificado = True
        End Set
        Get
            Return _chapa
        End Get
    End Property
    Public Property precioUnitario As Decimal
        Set(value As Decimal)
            _regCambios.Add(String.Format("PRECIO ANTERIOR: {0}, NUEVO {1}", precioUnitario.ToString, value.ToString))
            _precioUnitario = value
            _modificado = True
        End Set
        Get
            Return Math.Round(_precioUnitario, 2)
        End Get
    End Property
    Public Property mano As Mano
        Set(value As Mano)
            _regCambios.Add(String.Format("MANO ANTERIOR: {0}, NUEVA {1}", mano.nombre, value.nombre))
            _mano = value
            _modificado = True
        End Set
        Get
            Return _mano
        End Get
    End Property
    Public Property linea As Linea
        Set(value As Linea)
            _regCambios.Add(String.Format("LINEA ANTERIOR: {0}, NUEVA {1}", linea.nombre, value.nombre))
            _linea = value
            _modificado = True
        End Set
        Get
            Return _linea
        End Get
    End Property
    Public Property stock As Integer
        Set(value As Integer)
            _regCambios.Add(String.Format("STOCK ANTERIOR: {0}, NUEVO {1}", stock.ToString, value.ToString))
            _stock = value
            updateStock = True
        End Set
        Get
            Return _stock
        End Get
    End Property
    Public Property despiece As DataTable
        Set(value As DataTable)
            _regCambios.Add("CAMBIOS EN DESPIECE")
            _despiece = value
            _modificado = True
        End Set
        Get
            Return _despiece
        End Get
    End Property

    Friend Sub actualizarDespiece()
        Try
            Dim db As New DbHelper
            _idProd = db.actualizarDespiece(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Property codigo As Integer
        Set(value As Integer)
            _cod = value
        End Set
        Get
            Return _cod
        End Get
    End Property

    Public Property updateStock As Boolean
        Set(value As Boolean)
            _modificaStock = value
        End Set
        Get
            Return _modificaStock
        End Get
    End Property

    Public ReadOnly Property registro As List(Of String)
        Get
            Return _regCambios
        End Get
    End Property

    Friend Sub actualizar()
        Try
            If _modificado Or _modificaStock Then
                db = New DbHelper()
                db.registrar(Me)
                _idProd = db.actualizar(Me)
            Else
                Throw New Exception("No se hicieron modificaciones")
            End If
        Catch ex As Exception
            Throw
        End Try

    End Sub

    Friend Sub insertar()
        Try
            db = New DbHelper

            Dim res = db.insertar(Me)
            _idProd = res(0)
            _cod = res(1)
            _regCambios.Clear()
            _regCambios.Add("Nuevo producto ingresado")

            If Not IsNothing(despiece) Then
                db.insertDespiece(id, despiece)
            End If
            db.registrar(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub
End Class
