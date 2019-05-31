Public Class redireccionQR
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idPedido As Integer
        idPedido = Request.QueryString("idPedido")
        Response.Redirect(redireccion.redireccionarPedido(idPedido))
    End Sub
End Class