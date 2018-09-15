Public Class Administrar
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim gp As GestorPedidos


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
    End Sub

    Protected Sub grNvos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grPedidos.SelectedIndexChanged
        Dim idPedido As Integer
        Dim estado As Estado

        pnlPedidos.Visible = False
        pnlDetalle.Visible = True

        idPedido = Convert.ToInt32(grPedidos.SelectedDataKey.Value)
        gp = New GestorPedidos(idPedido)
        Session("gestorPedidos") = gp

        Estado = New Estado(Estado.estados.recibido)

        grDetalle.DataSource = gd.getItems(idPedido)
        grDetalle.DataBind()

        grPedidos.SelectedIndex = -1
    End Sub
End Class