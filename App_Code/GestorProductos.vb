Imports System.Data
Public Class GestorProductos
    Public producto As Producto
    Dim despiece As DataTable
    Dim gd As GestorDatos
    Dim db As DbHelper

    Public Sub New(_idProducto As Integer)
        gd = New GestorDatos
        producto = New Producto(_idProducto)
        despiece = gd.getDespieceProducto(_idProducto)
    End Sub

    Public Sub New(hoja As Hoja, marco As Marco, madera As Madera, chapa As Chapa, mano As Mano, linea As Linea, precio As Decimal)
        despiece = New DataTable
        producto = New Producto(hoja, marco, madera, chapa, mano, linea, precio)
        db = New DbHelper("productos")
        despiece.Columns.Add("ID_PIEZA", GetType(Integer))
        despiece.Columns.Add("CONSUMO", GetType(Decimal))
    End Sub

    Public Sub eliminarPieza(_idPieza As Integer)
        Try
            db = New DbHelper()
            db.eliminarPieza(producto.id, _idPieza)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub agregarPieza(_idPieza As Integer, _consumo As Decimal)
        db = New DbHelper()

        For Each r As DataRow In despiece.Rows
            If r("ID_PIEZA") = _idPieza Then
                Throw New Exception("La pieza ya existe en el despiece de este producto")
            End If
        Next

        Try
            db.insertarPiezaProducto(producto.id, _idPieza, _consumo)
        Catch ex As Exception
            Throw
        End Try

    End Sub

    Friend Sub insertar()
        Try
            Dim db As New DbHelper
            db = New DbHelper("PRODUCTOS")
            Dim existe = db.existeProducto(producto, False)

            If existe <> 0 Then
                Throw New Exception("Ya existe un producto con estas caracteristicas con el codigo: " & existe)
            Else
                producto.insertar()
                db.registrar(producto)
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub setDespiece(_gr As GridView)

        For Each r As GridViewRow In _gr.Rows
            Dim txtconsumo As TextBox
            txtconsumo = r.FindControl("txtConsumo")
            Dim consumo = txtconsumo.Text.Trim()



            If consumo > 0 Then
                Dim idPieza = Convert.ToInt32(_gr.DataKeys(r.RowIndex).Value.ToString)
                Dim resultado = despiece.Select(String.Format("ID_PIEZA ={0}", idPieza))

                Dim d As DataRow
                d = despiece.NewRow

                d("ID_PIEZA") = idPieza
                d("CONSUMO") = consumo

                despiece.Rows.Add(d)

            End If
        Next
        producto.despiece = despiece
    End Sub

    Friend Sub modificar()
        Try
            db = New DbHelper("PRODUCTOS")
            Dim existe = db.existeProducto(producto)

            If existe <> 0 Then
                Throw New Exception("Ya existe un producto con estas caracteristicas con el codigo: " & existe)
            Else
                producto.actualizar()
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Friend Sub eliminarProducto()
        Try
            db = New DbHelper("PRODUCTOS")
            db.eliminar(producto)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Friend Sub reActivarProducto()
        Try
            db = New DbHelper("PRODUCTOS")
            db.activarProducto(producto.id)
        Catch ex As Exception

        End Try
    End Sub

    Friend Sub actualizarDespiece(_ListaPiezas As DataTable)
        Dim despInterno As New DataTable
        Dim des = producto.despiece
        Dim modi As Boolean = False

        For Each r As DataRow In _ListaPiezas.Rows
            Dim f = des.Select("ID_PIEZA=" & r("ID_PIEZA"))
            If f.Length = 1 Then
                If f(0)("CONSUMO") <> r("CONSUMO") Then
                    f(0)("CONSUMO") = r("CONSUMO")
                    modi = True
                End If
            Else
                If r("CONSUMO") <> 0 Then
                    Dim newR = des.NewRow
                    newR("CONSUMO") = r("CONSUMO")
                    newR("ID_PIEZA") = r("ID_PIEZA")
                    des.Rows.Add(newR)
                    modi = True
                End If
            End If
        Next

        If modi Then
            Try
                producto.despiece = des
                producto.actualizarDespiece()
            Catch ex As Exception
                Throw
            End Try
        Else
            Throw New Exception("No se realizaron cambios")
        End If
    End Sub
End Class
