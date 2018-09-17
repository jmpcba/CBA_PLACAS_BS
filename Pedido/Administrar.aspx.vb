Public Class Administrar
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        lblSubtitulo.Text = ""
        HFCrystal.Value = ""
    End Sub

    Protected Sub grNvos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grPedidos.SelectedIndexChanged
        Dim idPedido As Integer

        Try
            pnlPedidos.Visible = False
            pnlDetalle.Visible = True

            idPedido = Convert.ToInt32(grPedidos.SelectedDataKey.Value)
            gp = New GestorPedidos(idPedido)
            HFIDPedido.Value = gp.pedido.id.ToString
            Session("gp") = gp

            validar(gp)
            llenarGrillasDetalle(idPedido)

            For Each r As GridViewRow In grEnviarProd.Rows
                'Dim numUpDown As AjaxControlToolkit.NumericUpDownExtender
                Dim val As RangeValidator

                'numUpDown = r.FindControl("txtStockRow_NumericUpDownExtender")
                val = r.FindControl("rvStockNvo")
                val.MinimumValue = 0

                If Convert.ToInt32(r.Cells(8).Text) > Convert.ToInt32(r.Cells(7).Text) Then
                    'numUpDown.Maximum = r.Cells(7).Text
                    val.MaximumValue = r.Cells(7).Text
                    val.ErrorMessage = "Ingrese un numero mayor que cero y menor a CANT"
                Else
                    'numUpDown.Maximum = r.Cells(8).Text
                    val.MaximumValue = r.Cells(8).Text
                    val.ErrorMessage = "Ingrese un numero mayor que cero y menor a STOCK DISP"
                End If
            Next

            grPedidos.SelectedIndex = -1
            lblSubtitulo.Text = "Detalles Pedido: " & gp.pedido.id
            sb.write(String.Format("Carga de datos Pedido {0} - EXITOSA", gp.pedido.id.ToString))

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub validar(_gp As GestorPedidos)

        If _gp.pedido.estado.id > Estado.estados.entregado Then
            HFBtnDepo.Value = "disabled"
        Else
            HFBtnDepo.Value = ""
        End If

        If _gp.pedido.estado.id >= Estado.estados.deposito Then
            HFBtnProd.Value = "disabled"
        Else
            HFBtnProd.Value = ""
        End If

        If _gp.pedido.estado.id > Estado.estados.recibido Then
            HFBtnOrden.Value = "disabled"
        Else
            HFBtnOrden.Value = ""
        End If
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        pnlDetalle.Visible = False
        pnlPedidos.Visible = True
        grPedidos.DataBind()
    End Sub

    Protected Sub btnEnviarProd_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try

            gp = Session("gp")
            gp.EnviarProduccion(grEnviarProd)
            sb.write(String.Format("Pedido {0} enviado a produccion", gp.pedido.id))
            HFCrystal.Value = "orden"

            llenarGrillasDetalle(gp.pedido.id)
            validar(gp)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Public Sub llenarGrillasDetalle(_idPedido)
        Dim items As DataTable
        Dim materiales As Boolean
        items = gd.getItems(_idPedido)

        grDetalle.DataSource = Items
        grStock.DataSource = Items
        grDeposito.DataSource = Items
        grEnviarProd.DataSource = Items

        grDetalle.DataBind()
        grStock.DataBind()
        grDeposito.DataBind()
        grEnviarProd.DataBind()

        materiales = gd.calcularMateriales(gp.pedido, grMateriales)
        If materiales Then
            HFMat.Value = "True"
            lblMatModalOrden.Text = "Dispone de Materiales Suficientes"
            btnImprimirCompra.Visible = False
            btnEnviar.Visible = True
        Else
            HFMat.Value = "False"
            lblMatModalOrden.Text = "NO Dispone de Materiales Suficientes"
            btnEnviar.Visible = False
        End If
    End Sub
End Class