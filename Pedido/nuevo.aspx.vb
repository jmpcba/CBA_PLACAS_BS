Public Class nuevo
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar
    Dim cliente As Cliente
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos
        sb = New StatusBar(HFMsg, lblMessage)

        Try
            If IsPostBack Then
                HFPanelActual.Value = Request.Form(HFPanelActual.UniqueID)
                HFPanelAnterior.Value = Request.Form(HFPanelAnterior.UniqueID)
            Else
                gd.getComboLineas(cbLinea)
                HFPanelActual.Value = ""
                HFPanelAnterior.Value = ""
            End If

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try

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

    Protected Sub cbLinea_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbLinea.SelectedIndexChanged
        Try
            pnlCombos.Visible = True
            gd.fillCombos(cbLinea, cbChapa, cbMarco, cbMadera, cbHoja, cbMano)
            sb.write(String.Format("Datos para linea {0} - CARGADOS", cbLinea.SelectedItem.Text))
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class