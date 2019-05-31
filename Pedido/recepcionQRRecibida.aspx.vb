Public Class recepcionQRRecibida
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idPedido As Integer
        idPedido = Request.QueryString("idPedido")
        lblPedido.Text = idPedido
    End Sub

End Class