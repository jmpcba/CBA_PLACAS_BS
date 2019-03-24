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
    Private _modificaDespiece As Boolean = False

    Public Sub New(ByVal _hoja As Hoja, ByVal _marco As Marco, ByVal _madera As Madera, ByVal _chapa As Chapa, ByVal _mano As Mano, ByVal _linea As Linea)
        Try
            'Crear objecto desde cero
            db = New DbHelper("PRODUCTOS")
            Dim dt = New DataTable
            _linea = _linea
            _hoja = _hoja
            _marco = _marco
            _madera = _madera
            _chapa = _chapa
            _mano = _mano

            dt = db.buscar(Me)
            If dt.Rows.Count > 0 Then
                _idProd = dt(0)("id")
                precioUnitario = dt(0)("precio")
                _stock = dt(0)("stock")
                _cod = dt(0)("COD")
                _precioUnitario = Math.Round(precioUnitario, 2)
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
            _hoja = value
            _modificado = True
        End Set
        Get
            Return _hoja
        End Get
    End Property
    Public Property marco As Marco
        Set(value As Marco)
            _marco = value
            _modificado = True
        End Set
        Get
            Return _marco
        End Get
    End Property
    Public Property madera As Madera
        Set(value As Madera)
            _madera = value
            _modificado = True
        End Set
        Get
            Return _madera
        End Get
    End Property
    Public Property chapa As Chapa
        Set(value As Chapa)
            _chapa = value
            _modificado = True
        End Set
        Get
            Return _chapa
        End Get
    End Property
    Public Property precioUnitario As Decimal
        Set(value As Decimal)
            _precioUnitario = value
            _modificado = True
        End Set
        Get
            Return Math.Round(_precioUnitario, 2)
        End Get
    End Property
    Public Property mano As Mano
        Set(value As Mano)
            _mano = value
            _modificado = True
        End Set
        Get
            Return _mano
        End Get
    End Property
    Public Property linea As Linea
        Set(value As Linea)
            _linea = value
            _modificado = True
        End Set
        Get
            Return _linea
        End Get
    End Property
    Public Property stock As Integer
        Set(value As Integer)
            _stock = value
            updateStock = True
        End Set
        Get
            Return _stock
        End Get
    End Property
    Public Property despiece As DataTable
        Set(value As DataTable)
            _despiece = value
            _modificaDespiece = True
        End Set
        Get
            _despiece = db.getDespiece(_idProd)
            Return _despiece
        End Get
    End Property

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

    Public ReadOnly Property modificaDespiece As Boolean
        Get
            Return _modificaDespiece
        End Get
    End Property

    Friend Sub actualizar()
        Try
            If _modificado Or _modificaStock Then
                db = New DbHelper()
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

            _idProd = db.insertar(Me)
            If Not IsNothing(despiece) Then
                db.insertDespiece(id, despiece)
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub
End Class
