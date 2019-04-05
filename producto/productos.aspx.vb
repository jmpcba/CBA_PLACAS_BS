Public Class productos1
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos
    Dim sb As StatusBar
    Dim gp As New GestorProductos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)

        Try
            If Not IsPostBack Then
                llenarGrilla()
            End If

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub llenarGrilla()
        grProductos.DataSource = gd.getProductos()
        grProductos.DataBind()
    End Sub

    Protected Sub grProductos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grProductos.SelectedIndexChanged
        Try
            Dim row = grProductos.SelectedRow
            Dim idProducto = Convert.ToInt32(grProductos.SelectedDataKey.Value)

            Response.Redirect("modificarProducto.aspx?idProducto=" & idProducto)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnActualizarPrecio_Click(sender As Object, e As EventArgs) Handles btnActualizarPrecio.Click
        Dim prods As New List(Of Integer)
        Dim TIPO As GestorProductos.tipoAumento
        Try
            For Each r As GridViewRow In grProductos.Rows
                Dim chk As New CheckBox
                chk = r.FindControl("check")

                If chk.Checked Then
                    prods.Add(grProductos.DataKeys(r.RowIndex).Value)
                End If
            Next

            If prods.Count = 0 Then
                Throw New Exception("No se selecciono ningun producto")
            End If
            Dim precio As Decimal
            precio = txtPrecio.Text.Trim

            If rbOpcionPrecio.SelectedValue = "PRECIO" Then
                TIPO = GestorProductos.tipoAumento.precio
            Else
                TIPO = GestorProductos.tipoAumento.porcentaje
            End If

            Dim errores = gp.actualizarPreciosGrupo(prods, TIPO, precio)

            If errores.Count > 0 Then
                Dim msg As String = ""

                For Each err As ExcepcionProducto In errores
                    msg += String.Format("ERROR ACTUALIZANDO PRODUCTO {0}: {1}" & vbCrLf, err.codProd, err.Message)
                Next
                Throw New Exception(msg)
            Else
                sb.write("Productos actualizados")
                llenarGrilla()
            End If
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class