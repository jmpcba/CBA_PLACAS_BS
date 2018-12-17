Public Class nuevo
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar
    Dim cliente As Cliente
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos
        sb = New StatusBar(HFMsg, lblMessage)

        If IsPostBack Then
            Try
                gd.getComboLineas(cbLinea)
                paneName.Value = Request.Form(paneName.UniqueID)
            Catch ex As Exception
                sb.writeError(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub dpCliente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpCliente.SelectedIndexChanged
        cliente = New Cliente(dpCliente.SelectedValue)
        pnlDatosCliente.Visible = True

        Try
            lblIDCliente.Text = cliente.id
            lblCuitCliente.Text = cliente.CUIT
            lblNombreCliente.Text = cliente.nombre
            lblTelCliente.Text = cliente.tel
            lblMailcliente.Text = cliente.mail
            lblDirCliente.Text = cliente.direccion
            lblCiudadCliente.Text = cliente.ciudad
            lblProvCliente.Text = cliente.provincia
            hfCliente.Value = cliente.id

            Dim msg = String.Format("Datos del cliente {0} - CARGADOS", dpCliente.SelectedItem.Text)

            sb.write(msg)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class