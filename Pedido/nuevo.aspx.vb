Imports CBA_PLACAS_BS

Public Class nuevo
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar
    Dim cliente As Cliente
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos
        sb = New StatusBar(HFMsg, lblMessage)

        Try
            If IsPostBack Then
                HFPanelActual.Value = Request.Form(HFPanelActual.UniqueID)
                HFPanelAnterior.Value = Request.Form(HFPanelAnterior.UniqueID)
                HFPos.Value = Request.Form(HFPos.UniqueID)
            Else
                gd.getCombos(cbLinea, GestorDatos.combos.lineas)
                gd.getCombos(dpCliente, GestorDatos.combos.clientes)
                HFPanelActual.Value = ""
                HFPanelAnterior.Value = ""
                HFPos.Value = ""
                hfPedido.Value = "0"
                gp = Nothing
            End If

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub dpCliente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpCliente.SelectedIndexChanged
        cliente = New Cliente(dpCliente.SelectedValue)
        pnlDatosCliente.Visible = True

        Try
            gp = Session("gp")

            If IsNothing(gp) Then
                gp = New GestorPedidos(cliente)
            Else
                gp.pedido.cliente = cliente
            End If

            lblIDCliente.Text = cliente.id
            lblCuitCliente.Text = cliente.CUIT
            lblNombreCliente.Text = cliente.nombre
            lblTelCliente.Text = cliente.tel
            lblMailcliente.Text = cliente.mail
            lblDirCliente.Text = cliente.direccion
            lblCiudadCliente.Text = cliente.ciudad
            lblProvCliente.Text = cliente.provincia
            hfCliente.Value = cliente.id
            lblCliente.Text = cliente.nombre

            Dim msg = String.Format("Datos del cliente {0} - CARGADOS", dpCliente.SelectedItem.Text)

            sb.write(msg)
            Session("gp") = gp
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

    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Try
            Dim chapa = New Chapa(cbChapa.SelectedItem.Value, cbChapa.SelectedItem.Text)
            Dim marco = New Marco(cbMarco.SelectedItem.Value, cbMarco.SelectedItem.Text)
            Dim madera = New Madera(cbMadera.SelectedItem.Value, cbMadera.SelectedItem.Text)
            Dim hoja = New Hoja(cbHoja.SelectedItem.Value, cbHoja.SelectedItem.Text)
            Dim mano = New Mano(cbMano.SelectedItem.Value, cbMano.SelectedItem.Text)
            Dim cant = txtCant.Text.Trim()
            Dim linea = New Linea(cbLinea.SelectedItem.Value, cbLinea.SelectedItem.Text)
            Dim producto = New Producto(hoja, marco, madera, chapa, mano, linea)

            Dim item = New Item(producto, cant)
            gp = Session("gp")
            gp.addItem(item)
            pnlDetalle.Visible = True
            gd.mostrarGrillaItems(grPedido, gp.pedido)
            lblCantTotal.Text = gp.pedido.cantTotal
            lblMontoTotal.Text = gp.pedido.precioTotal

            Session("gp") = gp
            hfPedido.Value = gp.pedido.items.Count

            grillaStock(gp)

            sb.write(String.Format("Nuevo Item Agregado"))

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub grillaStock(_gp As GestorPedidos)
        gd.mostrarGrillaItems(grPepedidoConfirmar, _gp.pedido, True)
        'lblCantidadNvo.Text = gp.pedido.cantTotal
        'lblPrecioNvo.Text = gp.pedido.precioTotal
        'lblDetalleNvo.Text = gp.pedido.cliente.nombre

        Dim flag = True

        For Each row As GridViewRow In grPepedidoConfirmar.Rows
            If Convert.ToInt32(row.Cells(6).Text) >= Convert.ToInt32(row.Cells(7).Text) Then
                row.ForeColor = Drawing.Color.Red
                flag = False
            End If
        Next

        If flag Then
            lblStock.Text = "Dispone de Stock para cubrir este pedido"
            HFStock.Value = 1

        Else
            lblStock.Text = "Este pedido debe ser fabricado"
            HFStock.Value = 0
        End If
    End Sub

    Protected Sub grPedido_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles grPedido.RowDeleting
        Try
            Dim r = e.RowIndex
            gp = Session("gp")
            gp.eliminarItem(r)
            gd.mostrarGrillaItems(grPedido, gp.pedido)
            grillaStock(gp)

            If gp.pedido.items.Count = 0 Then
                pnlDetalle.Visible = False
            End If

            hfPedido.Value = gp.pedido.items.Count
            lblCantTotal.Text = gp.pedido.cantTotal
            lblMontoTotal.Text = gp.pedido.precioTotal

            sb.write(String.Format("Item en fila {0} -ELIMINADO", r + 1))

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try

    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            gp = Session("gp")
            gp.enviarPedido()

            Session.Remove("gp")

            Response.Redirect("confirmacion.aspx?idPedido=" & gp.pedido.id)

        Catch ex As Exception
            sb.write(ex.Message)
        Finally
            gp = Nothing
        End Try

    End Sub
End Class