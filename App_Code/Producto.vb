Imports System.Data
Public Class Producto
    Public id As Integer
    Public hoja As Hoja
    Public marco As Marco
    Public madera As Madera
    Public chapa As Chapa
    Public precioUnitario As Decimal
    Public mano As Mano
    Public linea As Linea
    Public stock As Integer
    Public despiece As DataTable
    Dim db As DbHelper

    Public Sub New(ByVal _hoja As Hoja, ByVal _marco As Marco, ByVal _madera As Madera, ByVal _chapa As Chapa, ByVal _mano As Mano, ByVal _linea As Linea)
        Try
            'Crear objecto desde cero
            db = New DbHelper("PRODUCTOS")
            Dim dt = New DataTable
            linea = _linea
            hoja = _hoja
            marco = _marco
            madera = _madera
            chapa = _chapa
            mano = _mano

            'dt = db.getProducto(_linea.id, _chapa.id, _hoja.id, _marco.id, _madera.id, _mano.id)
            dt = db.buscar(Me)
            If dt.Rows.Count > 0 Then
                id = dt(0)("id")
                precioUnitario = dt(0)("precio")
                stock = dt(0)("stock")
                precioUnitario = Math.Round(precioUnitario, 2)
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

        id = dt(0)("id")
        precioUnitario = dt(0)("precio")
        stock = dt(0)("stock")

        idHoja = dt(0)("idHoja")
        idMarco = dt(0)("idMarco")
        idMadera = dt(0)("idMadera")
        idChapa = dt(0)("idChapa")
        idMano = dt(0)("idMano")
        idLinea = dt(0)("idLinea")

        hoja = New Hoja(idHoja)
        marco = New Marco(idMarco)
        madera = New Madera(idMadera)
        chapa = New Chapa(idChapa)
        mano = New Mano(idMano)
        linea = New Linea(idLinea)

    End Sub

    Friend Sub actualizar()
        Try
            db = New DbHelper()
            db.actualizar(Me)
        Catch ex As Exception
            Throw
        End Try

    End Sub

    Friend Sub insertar()
        Try
            db = New DbHelper

            id = db.insertar(Me)
            If Not IsNothing(despiece) Then
                db.insertDespiece(id, despiece)
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub
End Class
