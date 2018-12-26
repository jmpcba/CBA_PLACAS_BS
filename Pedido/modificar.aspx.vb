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
        grProduccion.DataBind()

        grDetalle.DataSource = items
        grDetalle.DataBind()

        gd.obtenerRegistro(gp.pedido, grLog)
        lblnroPedidoDet.Text = gp.pedido.id.ToString
        lblEstadoDet.Text = gp.pedido.estado.nombre
        lblCantDet.Text = gp.pedido.cantTotal.ToString
        lblRecibidoDet.Text = gp.pedido.recibido.ToShortDateString
        lblClienteDet.Text = gp.pedido.cliente.nombre.ToUpper

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
        'grPedidos.DataBind()
    End Sub
End Class