Public Class clientes
    Inherits System.Web.UI.Page
    Dim sb As StatusBar
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)

        If IsPostBack Then

        Else
            Dim provincias = My.Settings.provincias

            dpProv.DataSource = provincias
            dpFiltroProv.DataSource = provincias
            dpProv.DataBind()
            dpFiltroProv.DataBind()
        End If
    End Sub

    Private Sub llenarGrillaClientes()

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Try
            Dim cliente = New Cliente(txtCuit.Text.Trim, txtNombre.Text.Trim, txtTel.Text.Trim, txtMail.Text.Trim, txtDir.Text.Trim, txtCiudad.Text.Trim, dpProv.SelectedValue)
            grClientes.DataBind()
            cliente.insertar()
            sb.write("Nuevo Cliente ingresado")
            grClientes.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        Finally

        End Try
    End Sub

    Protected Sub grClientes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grClientes.SelectedIndexChanged
        Try
            ViewState("detalle") = True
            pnlClientes.Visible = False

            Dim idCliente = Convert.ToInt32(grClientes.SelectedDataKey.Value)
            Dim cliente As New Cliente(idCliente)

            Response.Redirect("clientesDetalle?idCliente=" & cliente.id)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class