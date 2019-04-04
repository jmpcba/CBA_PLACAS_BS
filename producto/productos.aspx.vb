Public Class productos1
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            sb = New StatusBar(HFMsg, lblMessage)
            grProductos.DataSource = gd.getProductos()
            grProductos.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
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
        For Each r As GridViewRow In grProductos.Rows
            Dim chk As New CheckBox
            Dim prods As New List(Of Integer)
            chk = r.FindControl("check")

            If chk.Checked Then
                prods.Add(grProductos.DataKeys(r.RowIndex).Value)
            End If
        Next
    End Sub
End Class