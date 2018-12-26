Public Class confirmacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblPedido.Text = Request.QueryString("idPedido")
    End Sub

End Class