Public Class modificar
    Inherits System.Web.UI.Page

    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        'pnlDetalle.Visible = False
        'pnlAgregar.Visible = False
        'btnAgregar.Visible = True

        If Not IsPostBack Then
            'gd.getComboLineas(cbLinea)
            llenarGrillaPedido()
        End If

        gp = Session("gp")

        If Not IsNothing(gp) Then
            HFEstado.Value = gp.pedido.estado.id
        End If
    End Sub

    Private Sub llenarGrillaPedido()
        grPedidos.DataSource = gd.getGrilla(GestorDatos.grillas.pedidosModificar)
        grPedidos.DataBind()
    End Sub

    Protected Sub grPedidos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grPedidos.SelectedIndexChanged
        Try
            Dim row = grPedidos.SelectedRow
            Dim idItem = row.Cells(1).Text

            pnlPedidos.Visible = False
            pnlDetalle.Visible = True

            gp = New GestorPedidos(idItem)

            Session("gp") = gp

            llenarGrillaDetalle()

            lblSubtitulo.Text = String.Format("Detalles Pedido: {0}", gp.pedido.id)
            HFEstado.Value = gp.pedido.estado.id
            sb.write(String.Format("Carga de datos Pedido {0} - EXITOSA", gp.pedido.id))

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub llenarGrillaDetalle()
        Dim items As DataTable

        gp = Session("gp")
        items = gd.getItems(gp.pedido.id)
        grProduccion.DataSource = items
        grDetalle.DataSource = items
        grEliminarItems.DataSource = items
        grModificarItems.DataSource = gd.getItemsModificar(gp.pedido.id)

        grDetalle.DataBind()
        grProduccion.DataBind()
        grEliminarItems.DataBind()
        grModificarItems.DataBind()

        gd.obtenerRegistro(gp.pedido, grLog)
        lblnroPedidoDet.Text = gp.pedido.id.ToString
        lblEstadoDet.Text = gp.pedido.estado.nombre
        lblCantDet.Text = gp.pedido.cantTotal.ToString
        lblRecibidoDet.Text = gp.pedido.recibido.ToShortDateString
        lblClienteDet.Text = gp.pedido.cliente.nombre.ToUpper

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

            If r.Cells(15).Text.Contains("CANCELADO") Then
                r.ForeColor = Drawing.Color.DarkGray
                cbMadera.Enabled = False
                cbHoja.Enabled = False
                cbMarco.Enabled = False
                cbChapa.Enabled = False
                cbMano.Enabled = False
                txtCant.Enabled = False
            End If
        Next
    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        gp = Session("gp")

        Try
            gp.cancelarPedido()
            sb.write(String.Format("Pedido {0} - CANCELADO", gp.pedido.id))
            HFEstado.Value = gp.pedido.estado.id
            llenarGrillaDetalle()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        pnlDetalle.Visible = False
        pnlPedidos.Visible = True
        grPedidos.SelectedIndex = -1
        lblSubtitulo.Text = ""
    End Sub

    Protected Sub btnEliminarItems_Click(sender As Object, e As EventArgs) Handles btnEliminarItems.Click
        Try
            gp = Session("gp")
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
            Session("gp") = gp
            llenarGrillaDetalle()
        End Try

    End Sub

    Protected Sub btnModificarItems_Click(sender As Object, e As EventArgs) Handles btnModificarItems.Click
        gp = Session("gp")

        Try
            gp.modificar(grModificarItems)
            sb.write("Pedido Actualizado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        Finally
            llenarGrillaDetalle()
        End Try

    End Sub
End Class