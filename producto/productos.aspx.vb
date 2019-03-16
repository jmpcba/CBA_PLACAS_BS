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
End Class