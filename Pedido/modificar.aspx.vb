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

            Session("gestorPedidos") = gp

            llenarGrillaDetalle()

            lblSubtitulo.Text = String.Format("Detalles Pedido: {0}", gp.pedido.id)

            sb.write(String.Format("Carga de datos Pedido {0} - EXITOSA", gp.pedido.id))

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub llenarGrillaDetalle()

        gp = Session("gestorPedidos")
        grDetalle.DataSource = gd.getItemsModificar(gp.pedido.id)
        grDetalle.DataBind()

        gd.obtenerRegistro(gp.pedido, grLog)
        lblnroPedidoDet.Text = gp.pedido.id.ToString
        lblEstadoDet.Text = gp.pedido.estado.nombre
        lblCantDet.Text = gp.pedido.cantTotal.ToString
        lblRecibidoDet.Text = gp.pedido.recibido.ToShortDateString
        lblClienteDet.Text = gp.pedido.cliente.nombre.ToUpper

    End Sub

End Class