Imports CBA_PLACAS_BS

Public Class clientesDetalle
    Inherits System.Web.UI.Page
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        sb = New StatusBar(HFMsg, lblMessage)
        Dim idCliente = Request.QueryString("idCliente")
        ViewState("idCliente") = idCliente

        If IsPostBack Then

        Else
            Try
                Dim cliente As New Cliente(idCliente)
                iniciarControles(cliente)
                Dim msg = String.Format("Datos del cliente {0} - CARGADOS", cliente.nombre)

                sb.write(msg)

            Catch ex As Exception
                sb.writeError(ex.Message)
            End Try
        End If

    End Sub

    Private Sub iniciarControles(_cliente As Cliente)
        Dim gd As New GestorDatos()

        Dim provincias = My.Settings.provincias

        dpProv.DataSource = provincias
        dpProv.DataBind()

        grHistorialPedidos.DataSource = gd.getPedidos(_cliente)
        grHistorialPedidos.DataBind()

        lblIDCliente.Text = _cliente.id
        lblCuitCliente.Text = _cliente.CUIT
        lblNombreCliente.Text = _cliente.nombre
        lblTelCliente.Text = _cliente.tel
        lblMailcliente.Text = _cliente.mail
        lblDirCliente.Text = _cliente.direccion
        lblCiudadCliente.Text = _cliente.ciudad
        lblProvCliente.Text = _cliente.provincia
        lblNombreTitulo.Text = _cliente.nombre

        txtCuit.Text = _cliente.CUIT
        txtCuit.Enabled = False
        txtNombre.Text = _cliente.nombre
        txtTel.Text = _cliente.tel
        txtMail.Text = _cliente.mail
        txtDir.Text = _cliente.direccion
        txtCiudad.Text = _cliente.ciudad
        dpProv.SelectedValue = _cliente.provincia
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim cambio As Boolean

        Try
            Dim cliente As New Cliente(ViewState("idCliente"))

            If cliente.nombre <> txtNombre.Text.Trim() Then
                cliente.nombre = txtNombre.Text.Trim()
                cambio = True
            End If

            If cliente.tel <> txtTel.Text.Trim() Then
                cliente.tel = txtTel.Text.Trim()
                cambio = True
            End If

            If cliente.mail <> txtMail.Text.Trim() Then
                cliente.mail = txtMail.Text.Trim()
                cambio = True
            End If

            If cliente.direccion <> txtDir.Text.Trim() Then
                cliente.direccion = txtDir.Text.Trim()
                cambio = True
            End If

            If cliente.ciudad <> txtCiudad.Text.Trim() Then
                cliente.ciudad = txtCiudad.Text.Trim()
                cambio = True
            End If

            If cliente.provincia <> dpProv.SelectedItem.Value Then
                cliente.provincia = dpProv.SelectedItem.Value
                cambio = True
            End If

            If cambio Then
                cliente.actualizar()
                iniciarControles(cliente)
            End If

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub grHistorialPedidos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grHistorialPedidos.SelectedIndexChanged
        Try
            Dim row = grHistorialPedidos.SelectedRow
            Dim idPedido = Convert.ToInt32(grHistorialPedidos.SelectedDataKey.Value)

            Response.Redirect("../Pedido/modificarDetalle.aspx?idPedido=" & idPedido)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("clientes.aspx")
    End Sub

    Protected Sub btnRefrescarDetalle_Click(sender As Object, e As EventArgs) Handles btnRefrescarDetalle.Click
        Response.Redirect(Request.RawUrl)
    End Sub
End Class