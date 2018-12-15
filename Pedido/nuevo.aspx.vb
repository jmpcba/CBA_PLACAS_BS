Public Class nuevo
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar
    Dim cliente As Cliente
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos
        sb = New StatusBar(HFMsg, lblMessage)
    End Sub

    Protected Sub dpCliente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpCliente.SelectedIndexChanged
        cliente = New Cliente(dpCliente.SelectedValue)
        pnlDatosCliente.Visible = True

        Try
            Session("cliente") = cliente
            lblIDCliente.Text = cliente.id
            lblCuitCliente.Text = cliente.CUIT
            lblNombreCliente.Text = cliente.nombre
            lblTelCliente.Text = cliente.tel
            lblMailcliente.Text = cliente.mail
            lblDirCliente.Text = cliente.direccion
            lblCiudadCliente.Text = cliente.ciudad
            lblProvCliente.Text = cliente.provincia

            Dim msg = String.Format("Datos del cliente {0} - CARGADOS", dpCliente.SelectedItem.Text)

            sb.write(msg)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class