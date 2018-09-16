Public Class Administrar
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        lblSubtitulo.Text = ""
    End Sub

    Protected Sub grNvos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grPedidos.SelectedIndexChanged
        Dim idPedido As Integer
        Dim items As DataTable
        Dim materiales As Boolean

        Try
            pnlPedidos.Visible = False
            pnlDetalle.Visible = True

            idPedido = Convert.ToInt32(grPedidos.SelectedDataKey.Value)
            gp = New GestorPedidos(idPedido)
            Session("gestorPedidos") = gp

            items = gd.getItems(idPedido)

            grDetalle.DataSource = items
            grStock.DataSource = items
            grDeposito.DataSource = items
            grEnviarProd.DataSource = items

            materiales = gd.calcularMateriales(gp.pedido, grMateriales)
            If materiales Then
                HFMat.Value = "True"
            Else
                HFMat.Value = "False"
            End If

            grDetalle.DataBind()
            grStock.DataBind()
            grDeposito.DataBind()
            grEnviarProd.DataBind()

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

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        pnlDetalle.Visible = False
        pnlPedidos.Visible = True
        grPedidos.DataBind()
    End Sub
End Class