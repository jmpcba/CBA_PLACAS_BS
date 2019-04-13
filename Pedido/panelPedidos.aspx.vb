Public Class panelPedidos
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos
    Dim sb As StatusBar


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)
        llenarGrillas()
    End Sub

    Private Sub llenarGrillas()
        Try
            Dim dt As New DataTable
            dt = gd.getPedidos()
            Dim dvNuevos As New DataView
            dvNuevos = dt.DefaultView

            dvNuevos.RowFilter = "ID_ESTADO=0"
            dvNuevos.Sort = "FECHA_RECIBIDO DESC"
            grNuevos.DataSource = dvNuevos
            grNuevos.DataBind()

            dvNuevos.RowFilter = "ID_ESTADO IN (1,2)"
            grEnCurso.DataSource = dvNuevos
            grEnCurso.DataBind()

            dvNuevos.RowFilter = "ID_ESTADO >=3"
            grDeposito.DataSource = dvNuevos
            grDeposito.DataBind()

            lblNuevos.Text = grNuevos.Rows.Count
            lblEnCurso.Text = grEnCurso.Rows.Count
            lblDeposito.Text = grDeposito.Rows.Count

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub redirigir(_idPedido As Integer)
        Dim url As String = ""

        If HttpContext.Current.User.IsInRole("ADMINISTRACION") Or HttpContext.Current.User.IsInRole("GERENCIA") Then
            url = "modificarDetalle.aspx?idPedido="
        ElseIf HttpContext.Current.User.IsInRole("ENCARGADO") Then
            url = "administrar.aspx?idPedido="
        End If

        If url <> "" Then
            url += _idPedido.ToString
            Response.Redirect(url)
        Else
            Throw New Exception("El usuario no tiene un rol asignado")
        End If

    End Sub

    Protected Sub grNuevos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grNuevos.SelectedIndexChanged
        Dim idPedido = Convert.ToInt32(grNuevos.SelectedDataKey.Value)

        Try
            redirigir(idPedido)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try

    End Sub


    Protected Sub grDeposito_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grDeposito.SelectedIndexChanged

        Dim idPedido = Convert.ToInt32(grDeposito.SelectedDataKey.Value)

        Try
            redirigir(idPedido)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub grEnCurso_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grEnCurso.SelectedIndexChanged
        Dim idPedido = Convert.ToInt32(grEnCurso.SelectedDataKey.Value)

        Try
            redirigir(idPedido)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class