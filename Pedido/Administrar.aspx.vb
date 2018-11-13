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
        HFStock.Value = "n"

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
            llenarGrillasDetalle(gp)

            grPedidos.SelectedIndex = -1
            lblSubtitulo.Text = "Detalles Pedido: " & gp.pedido.id
            sb.write(String.Format("Carga de datos Pedido {0} - EXITOSA", gp.pedido.id.ToString))

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub calcularRangeValidatorsGrillasStock()
        gp = Session("gp")

        For Each r As GridViewRow In grEnviarProd.Rows

            Dim val As RangeValidator
            Dim stock = Convert.ToInt32(r.Cells(8).Text)
            Dim cant = Convert.ToInt32(r.Cells(7).Text)
            Dim numeroLinea = r.RowIndex + 1

            val = r.FindControl("rvStockNvo")
            val.MinimumValue = 0

            If stock > cant Then
                val.MaximumValue = cant
                val.ErrorMessage = "ITEM " & numeroLinea & ": Ingrese un numero mayor que 0 y menor a " & cant
            Else
                val.MaximumValue = stock
                val.ErrorMessage = "ITEM " & numeroLinea & ": Ingrese un numero mayor que 0 y menor a " & stock
            End If
        Next

        For Each r As GridViewRow In grCambiarStock.Rows
            Dim idItem = r.Cells(12).Text
            Dim index = gp.pedido.itemIndex(idItem)
            Dim val As RangeValidator
            Dim stock = Convert.ToInt32(r.Cells(8).Text)
            Dim cant = Convert.ToInt32(r.Cells(7).Text)
            Dim ensamblados = gp.pedido.items(index).getEnsamblados
            Dim numeroLinea = r.RowIndex + 1
            val = r.FindControl("rvStockNvo")
            val.MinimumValue = 0

            If ensamblados > 0 Then
                If stock > cant - ensamblados Then
                    val.MaximumValue = cant - ensamblados
                    val.ErrorMessage = "ITEM " & numeroLinea & ": Ingrese un numero mayor que 0 y menor " & cant - ensamblados
                ElseIf stock = 0 Then
                    val.MaximumValue = stock
                    val.ErrorMessage = "ITEM " & numeroLinea & ": No dispone de stock disponible para este producto"
                Else
                    val.MaximumValue = stock
                    val.ErrorMessage = "ITEM " & numeroLinea & ": Ingrese un numero mayor que 0 y menor " & stock
                End If
            Else
                If stock > cant Then
                    val.MaximumValue = cant
                    val.ErrorMessage = "ITEM " & numeroLinea & ": Ingrese un numero mayor que 0 y menor " & cant
                Else
                    val.MaximumValue = stock
                    val.ErrorMessage = "ITEM " & numeroLinea & ": Ingrese un numero mayor que 0 y menor " & stock
                End If
            End If
        Next
    End Sub

    Private Sub validar(_gp As GestorPedidos)

        If _gp.pedido.estado.id >= Estado.estados.deposito Then
            HFBtnProd.Value = "disabled"

            If _gp.pedido.estado.id = Estado.estados.deposito Then
                lblModalDepo.Text = "El Pedido esta listo para ser enviado"

            ElseIf _gp.pedido.estado.id = Estado.estados.enviado Then
                lblModalDepo.Text = "Pedido en camino. confirmar recepcion con el cliente"

            ElseIf _gp.pedido.estado.id = Estado.estados.entregado Then
                lblModalDepo.Text = "Pedido entregado al cliente"
            End If
        Else
            HFBtnProd.Value = ""
            lblModalDepo.Text = "El Pedido NO esta listo para ser enviado"
        End If

        If _gp.pedido.estado.id = Estado.estados.entregado Then
            HFBtnDepo.Value = "disabled"
            HFBtnProd.Value = "disabled"
        Else
            HFBtnDepo.Value = ""
        End If

        If _gp.pedido.estado.id > Estado.estados.recibido Then
            HFBtnOrden.Value = "disabled"
        Else
            HFBtnOrden.Value = ""
            HFBtnProd.Value = "disabled"
            HFBtnDepo.Value = "disabled"
        End If

        If _gp.pedido.estado.id = Estado.estados.enCola Then
            HFBtnDepo.Value = "disabled"
        End If

        If _gp.pedido.estado.id = Estado.estados.enProduccion And _gp.pedido.getPAlmacenar = 0 Then
            HFBtnDepo.Value = "disabled"
        End If

        HFEstado.Value = _gp.pedido.estado.id

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
            If gp.pedido.usaStock Then
                HFStock.Value = "y"
            End If

            llenarGrillasDetalle(gp)
            validar(gp)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Public Sub llenarGrillasDetalle(_gp As GestorPedidos)
        Dim items As DataTable
        Dim materiales As Boolean
        items = gd.getItems(_gp.pedido.id)

        grDetalle.DataSource = items
        grStock.DataSource = items
        grCambiarStock.DataSource = items
        grDeposito.DataSource = items
        grEnviarProd.DataSource = items
        grAlmc.DataSource = items
        grEnCurso.DataSource = gd.getItems(_gp.pedido.id, _enCurso:=True)
        grImprimir.DataSource = items
        grEtiquetasStock.DataSource = items

        grDetalle.DataBind()
        grStock.DataBind()
        grDeposito.DataBind()
        grEnviarProd.DataBind()
        grEnCurso.DataBind()
        grAlmc.DataBind()
        grImprimir.DataBind()
        materiales = gd.calcularMateriales(_gp.pedido, grMateriales)
        grEtiquetasStock.DataBind()
        grCambiarStock.DataBind()

        If gp.pedido.estado.id = Estado.estados.recibido Then
            If materiales Then
                HFMat.Value = "True"
                lblMatModalOrden.Text = "Dispone de Materiales Suficientes"
                btnImprimirCompra.Visible = False
                btnEnviar.Visible = True
            Else
                HFMat.Value = "False"
                lblMatModalOrden.Text = "NO Dispone de Materiales Suficientes"
                btnEnviar.Visible = False
                btnImprimirCompra.Visible = True
            End If
        End If

        gd.obtenerRegistro(_gp.pedido, grLog)
        lblnroPedidoDet.Text = _gp.pedido.id.ToString
        lblEstadoDet.Text = _gp.pedido.estado.nombre
        lblCantDet.Text = _gp.pedido.cantTotal.ToString
        lblRecibidoDet.Text = _gp.pedido.recibido.ToShortDateString
        lblClienteDet.Text = _gp.pedido.cliente.nombre.ToUpper

        'BOTON MODAL DEPOSITO
        If gp.pedido.getPAlmacenar > 0 Then
            btnAccionDepo.Text = "Almacenar"
            HFDepo.Value = "almc"

        ElseIf gp.pedido.estado.id = Estado.estados.deposito Then
            btnAccionDepo.Text = "Enviar a Cliente"
            HFDepo.Value = "remito"

        ElseIf gp.pedido.estado.id = Estado.estados.enviado Then
            btnAccionDepo.Text = "Confirmar Recepcion"
            HFDepo.Value = "recepcion"
        End If


        'PEDIENTES
        bltPendientes.Items.Clear()

        For Each msg As String In gp.pendientes(HFExIcon)
            bltPendientes.Items.Add(msg)
        Next

        If _gp.pedido.modificado <> DateTime.MinValue Then
            lblModificadoDet.Text = _gp.pedido.modificado.ToShortDateString
        Else
            lblModificadoDet.Text = ""
        End If
        'range validators de enviar a prod y cambiar stock
        calcularRangeValidatorsGrillasStock()
    End Sub

    Protected Sub btnActualizarProd_Click(sender As Object, e As EventArgs) Handles btnActualizarProd.Click
        Try
            gp = Session("gp")
            gp.actualizarEnCurso(grEnCurso)
            validar(gp)
            llenarGrillasDetalle(gp)
            Session("gp") = gp

            sb.write(String.Format("Pedido {0} - ACTUALIZADO", gp.pedido.id))
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnRefrescar_Click(sender As Object, e As EventArgs) Handles btnRefrescar.Click
        gp = Session("gp")
        llenarGrillasDetalle(gp)
        validar(gp)
    End Sub

    Protected Sub btnImprimirCompra_Click(sender As Object, e As EventArgs) Handles btnImprimirCompra.Click
        HFCrystal.Value = "compra"
    End Sub

    Protected Sub btnAccionDepo_Click(sender As Object, e As EventArgs) Handles btnAccionDepo.Click

        Try
            gp = Session("gp")

            If gp.pedido.getPAlmacenar > 0 Then
                gp.enviarDeposito()
                sb.write(String.Format("Pedido {0} - ACTUALIZADO", gp.pedido.id))

            ElseIf gp.pedido.estado.id = Estado.estados.deposito Then
                gp.actualizarEstado(New Estado(Estado.estados.enviado))
                HFCrystal.Value = "remito"
                sb.write(String.Format("Pedido {0} - ENVIADO A CLIENTE: {1}", gp.pedido.id, gp.pedido.cliente.nombre))

            ElseIf gp.pedido.estado.id = Estado.estados.enviado Then
                gp.actualizarEstado(New Estado(Estado.estados.entregado))
                sb.write(String.Format("Pedido {0} - ENTREGADO", gp.pedido.id))
            End If

            validar(gp)
            llenarGrillasDetalle(gp)
            Session("gp") = gp

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try

    End Sub

    Protected Sub btnCambiarStock_Click(sender As Object, e As EventArgs) Handles btnCambiarStock.Click
        Try

            gp = Session("gp")
            gp.EnviarProduccion(grCambiarStock, True)

            sb.write(String.Format("Pedido {0} Actualizado", gp.pedido.id))

            If gp.pedido.usaStock Then
                HFStock.Value = "r"
            End If

            llenarGrillasDetalle(gp)
            validar(gp)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class