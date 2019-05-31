Public Class recepcionQR
    Inherits System.Web.UI.Page
    Dim sb As StatusBar
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idPedido As Integer
        sb = New StatusBar(HFMsg, lblMessage)

        idPedido = Request.QueryString("idPedido")
        lblPedido.Text = idPedido
    End Sub

    Protected Sub btnConfirmar_Click(sender As Object, e As EventArgs) Handles btnConfirmar.Click
        Try
            Dim idPedido As Integer
            Dim gp As GestorPedidos

            idPedido = Request.QueryString("idPedido")
            gp = New GestorPedidos(idPedido)

            If gp.pedido.estado.id = Estado.estados.enviado Then
                gp.actualizarEstado(New Estado(Estado.estados.entregado))
                Response.Redirect("recepcionQRRecibida.aspx?idPedido=" & idPedido)
            Else
                sb.writeError("No se puede marcar el pedido como recibido. No esta en el estado correcto")
            End If
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class