Public Class modificar
    Inherits System.Web.UI.Page

    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        Dim idPedido As Integer

        If IsPostBack Then

        Else
            llenarGrillaPedido()
        End If

        idPedido = ViewState("idPedido")

    End Sub

    Private Sub llenarGrillaPedido()
        grPedidos.SelectedIndex = -1
    End Sub

    Protected Sub grPedidos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grPedidos.SelectedIndexChanged
        Try
            Dim row = grPedidos.SelectedRow
            Dim idPedido = Convert.ToInt32(grPedidos.SelectedDataKey.Value)

            Response.Redirect("modificarDetalle.aspx?idPedido=" & idPedido)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class