Public Class buscarPedido
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)

        If IsPostBack Then
            HFPostback.Value = 0
        Else
            HFPostback.Value = 1
        End If
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        Try
            Dim idPedido = Nothing
            Dim fecRecDesde = Nothing
            Dim fecRecHasta = Nothing
            Dim fecModDesde = Nothing
            Dim fecModHasta = Nothing
            Dim idCliente = Nothing
            Dim idEstado = Nothing
            Dim table As DataTable

            If txtNroPedido.Text <> "" Then
                idPedido = txtNroPedido.Text
            End If

            If txtFecRecDesde.Text <> "" Then
                fecRecDesde = txtFecRecDesde.Text
            End If

            If txtFecRecHasta.Text <> "" Then
                fecRecHasta = txtFecRecHasta.Text
            End If

            If txtFecModDesde.Text <> "" Then
                fecModDesde = txtFecModDesde.Text
            End If

            If txtFecModHasta.Text <> "" Then
                fecModHasta = txtFecModHasta.Text
            End If

            If dpCliente.SelectedValue <> "TODOS" Then
                idCliente = dpCliente.SelectedValue
            End If

            If dpEstado.SelectedValue <> "ACTIVOS" Then
                idEstado = dpEstado.SelectedValue
            End If

            grResultadoBusqueda.DataSource = Nothing
            grResultadoBusqueda.DataBind()

            table = gd.buscarPedidos(idPedido, fecRecDesde, fecRecHasta, fecModDesde, fecModHasta, idCliente, idEstado)
            grResultadoBusqueda.DataSource = table
            grResultadoBusqueda.DataBind()
            grResultadoBusqueda.SelectedIndex = -1
            pnlResultado.Visible = True
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub dpCliente_DataBound(sender As Object, e As EventArgs) Handles dpCliente.DataBound
        dpCliente.Items.Add("TODOS")
        dpCliente.SelectedIndex = dpCliente.Items.Count - 1
    End Sub

    Protected Sub dpEstado_DataBound(sender As Object, e As EventArgs) Handles dpEstado.DataBound
        dpEstado.Items.Add("ACTIVOS")
        dpEstado.SelectedIndex = dpEstado.Items.Count - 1
    End Sub

    Protected Sub grResultadoBusqueda_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grResultadoBusqueda.SelectedIndexChanged
        Try
            Dim idPedido As Integer
            idPedido = grResultadoBusqueda.SelectedDataKey.Value
            Response.Redirect(redireccion.redireccionarPedido(idPedido))
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class