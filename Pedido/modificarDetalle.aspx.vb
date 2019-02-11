Public Class modificarDetalle
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idPedido = Request.QueryString("idPedido")

        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)

        ViewState("idPedido") = idPedido
        llenarGrillaDetalle()

        lblSubtitulo.Text = String.Format("Detalles Pedido: {0}", gp.pedido.id)

        sb.write(String.Format("Carga de datos Pedido {0} - EXITOSA", gp.pedido.id))

        If IsPostBack Then
            HFAgregar.Value = 0
            HFIsPostBack.Value = 1
        Else
            gd.getCombos(cbLinea, GestorDatos.combos.lineas)
            HFIsPostBack.Value = 0
        End If
    End Sub

    Private Sub llenarGrillaDetalle()
        Dim items As DataTable
        Dim idPedido As Integer

        idPedido = ViewState("idPedido")

        'refrescar el objeto pedidos desde la DB
        gp = New GestorPedidos(idPedido)
        HFEstado.Value = gp.pedido.estado.id

        items = gd.getItems(gp.pedido.id)
        grProduccion.DataSource = gd.getItems(gp.pedido.id, DbHelper.tipoItem.detalle)
        grDetalle.DataSource = items
        grEliminarItems.DataSource = items
        grModificarItems.DataSource = gd.getItemsModificar(gp.pedido.id)

        grDetalle.DataBind()
        grProduccion.DataBind()
        grEliminarItems.DataBind()
        grModificarItems.DataBind()

        gd.getRegistro(gp.pedido, grLog)
        lblnroPedidoDet.Text = gp.pedido.id.ToString
        lblEstadoDet.Text = gp.pedido.estado.nombre
        lblCantDet.Text = gp.pedido.cantTotal.ToString
        lblRecibidoDet.Text = gp.pedido.recibido.ToShortDateString
        lblClienteDet.Text = gp.pedido.cliente.nombre.ToUpper
        lblModificadoDet.Text = gp.pedido.modificado.ToShortDateString

        For Each r As GridViewRow In grDetalle.Rows
            If r.Cells(7).Text.Contains("CANCELADO") Then
                r.ForeColor = Drawing.Color.DarkGray

            End If
        Next

        For Each r As GridViewRow In grModificarItems.Rows
            If r.Cells(7).Text.Contains("CANCELADO") Then
                r.ForeColor = Drawing.Color.DarkGray

            End If
        Next

        For Each r As GridViewRow In grEliminarItems.Rows
            If r.Cells(9).Text.Contains("CANCELADO") Then
                Dim chk As CheckBox
                r.ForeColor = Drawing.Color.DarkGray
                chk = r.FindControl("chkEliminar")
                chk.Enabled = False
                chk.Checked = False
            End If
        Next

        For Each r As GridViewRow In grProduccion.Rows
            If r.Cells(7).Text.Contains("CANCELADO") Then
                r.ForeColor = Drawing.Color.DarkGray
            End If
        Next

        For Each r As GridViewRow In grModificarItems.Rows
            Dim cbMadera As DropDownList
            Dim cbHoja As DropDownList
            Dim cbMarco As DropDownList
            Dim cbChapa As DropDownList
            Dim cbMano As DropDownList
            Dim txtCant As TextBox
            Dim idItem = grModificarItems.DataKeys(r.RowIndex).Values(0)
            Dim itemIndex = gp.pedido.itemIndex(idItem)

            Dim idLinea = grModificarItems.DataKeys(r.RowIndex).Values(1)

            cbMadera = r.FindControl("cbMadera")
            cbHoja = r.FindControl("cbHoja")
            cbMarco = r.FindControl("cbMarco")
            cbChapa = r.FindControl("cbChapa")
            cbMano = r.FindControl("cbMano")
            txtCant = r.FindControl("txtCant")

            gd.fillCombos(idLinea, cbChapa, cbMarco, cbMadera, cbHoja, cbMano)

            cbChapa.SelectedValue = gp.pedido.items(itemIndex).getProducto.chapa.id
            cbMarco.SelectedValue = gp.pedido.items(itemIndex).getProducto.marco.id
            cbMadera.SelectedValue = gp.pedido.items(itemIndex).getProducto.madera.id
            cbHoja.SelectedValue = gp.pedido.items(itemIndex).getProducto.hoja.id
            cbMano.SelectedValue = gp.pedido.items(itemIndex).getProducto.mano.id

            If grModificarItems.DataKeys(r.RowIndex).Values(2) > 1 Then

                cbMadera.Enabled = False
                cbHoja.Enabled = False
                cbMarco.Enabled = False
                cbChapa.Enabled = False
                cbMano.Enabled = False
                txtCant.Enabled = False

                If grModificarItems.DataKeys(r.RowIndex).Values(2) > 6 Then
                    r.ForeColor = Drawing.Color.DarkGray
                End If
            End If
        Next
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        Dim idPedido As Integer
        idPedido = ViewState("idPedido")
        gp = New GestorPedidos(idPedido)

        Try
            gp.cancelarPedido()
            sb.write(String.Format("Pedido {0} - CANCELADO", gp.pedido.id))
            llenarGrillaDetalle()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("panelPedidos.aspx")
    End Sub

    Protected Sub btnEliminarItems_Click(sender As Object, e As EventArgs) Handles btnEliminarItems.Click
        Try
            Dim idPedido As Integer
            idPedido = ViewState("idPedido")
            gp = New GestorPedidos(idPedido)

            For Each r As GridViewRow In grEliminarItems.Rows
                Dim chk As CheckBox
                chk = r.FindControl("chkEliminar")

                If chk.Checked Then
                    Dim idItem = Convert.ToInt32(grEliminarItems.DataKeys(r.RowIndex).Value.ToString())

                    gp.cancelarItem(idItem)
                End If
            Next
        Catch ex As Exception
            sb.writeError(ex.Message)
        Finally
            llenarGrillaDetalle()
        End Try

    End Sub

    Protected Sub btnModificarItems_Click(sender As Object, e As EventArgs) Handles btnModificarItems.Click
        Dim idPedido As Integer
        idPedido = ViewState("idPedido")
        gp = New GestorPedidos(idPedido)

        Try
            gp.modificar(grModificarItems)
            sb.write("Pedido Actualizado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        Finally
            llenarGrillaDetalle()
        End Try

    End Sub

    Protected Sub cbLinea_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbLinea.SelectedIndexChanged
        Try
            pnlCombos.Visible = True
            gd.fillCombos(cbLinea, cbChapa, cbMarco, cbMadera, cbHoja, cbMano)
            HFAgregar.Value = 1
            sb.write(String.Format("Datos para linea {0} - CARGADOS", cbLinea.SelectedItem.Text))
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Try
            Dim idPedido As Integer
            idPedido = ViewState("idPedido")
            gp = New GestorPedidos(idPedido)

            Dim chapa = New Chapa(cbChapa.SelectedItem.Value, cbChapa.SelectedItem.Text)
            Dim marco = New Marco(cbMarco.SelectedItem.Value, cbMarco.SelectedItem.Text)
            Dim madera = New Madera(cbMadera.SelectedItem.Value, cbMadera.SelectedItem.Text)
            Dim hoja = New Hoja(cbHoja.SelectedItem.Value, cbHoja.SelectedItem.Text)
            Dim mano = New Mano(cbMano.SelectedItem.Value, cbMano.SelectedItem.Text)
            Dim cant = txtCant.Text.Trim()
            Dim linea = New Linea(cbLinea.SelectedItem.Value, cbLinea.SelectedItem.Text)
            Dim producto = New Producto(hoja, marco, madera, chapa, mano, linea)

            Dim item = New Item(producto, cant)
            gp.addItem(item, True)
            sb.write("Nuevo Item Agregado")

        Catch ex As Exception
            sb.writeError(ex.Message)
        Finally
            llenarGrillaDetalle()
        End Try
    End Sub

    Protected Sub btnRefrescar_Click(sender As Object, e As EventArgs) Handles btnRefrescar.Click
        Response.Redirect(Request.RawUrl)
    End Sub
End Class