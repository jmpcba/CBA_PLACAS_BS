Public Class Administrar
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idPedido = Request.QueryString("idPedido")
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)

        HFStock.Value = ""

        If Not IsPostBack Then
            If idPedido = "" Then
                Response.Redirect("panelPedidos")
            Else
                lblSubtitulo.Text = ""
                HFCrystal.Value = ""
                HFIDPedido.Value = idPedido

                ViewState("idPedido") = idPedido
                llenarGrillasDetalle()

                lblSubtitulo.Text = String.Format("Detalles Pedido: {0}", idPedido)
                sb.write(String.Format("Carga de datos Pedido {0} - EXITOSA", idPedido))
            End If
        End If
    End Sub

    Private Sub calcularRangeValidatorsGrillasStock(_gp As GestorPedidos)


        For Each r As GridViewRow In grEnviarProd.Rows

            Dim val As RangeValidator
            Dim txt As TextBox
            Dim stock = Convert.ToInt32(r.Cells(8).Text)
            Dim cant = Convert.ToInt32(r.Cells(7).Text)
            Dim numeroLinea = r.RowIndex + 1

            txt = r.FindControl("txtStockRow")
            val = r.FindControl("rvStockNvo")
            val.MinimumValue = 0

            If _gp.pedido.cliente.id = 0 Then
                txt.Enabled = False
            End If

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
            Dim index = _gp.pedido.itemIndex(idItem)
            Dim val As RangeValidator
            Dim txt As TextBox
            Dim stock = Convert.ToInt32(r.Cells(8).Text)
            Dim cant = Convert.ToInt32(r.Cells(7).Text)
            Dim ensamblados = _gp.pedido.items(index).getEnsamblados
            Dim numeroLinea = r.RowIndex + 1

            val = r.FindControl("rvStockNvo")
            val.MinimumValue = 0

            txt = r.FindControl("txtStockRow")

            If _gp.pedido.cliente.id = 0 Then
                txt.Enabled = False
            End If

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

    Private Sub validar()
        Dim idPedido As Integer
        idPedido = ViewState("idPedido")

        Dim gp As New GestorPedidos(idPedido)

        If gp.pedido.estado.id >= Estado.estados.deposito Then
            HFBtnProd.Value = "disabled"

            If gp.pedido.cliente.id = 0 Then
                lblModalDepo.Text = "Enviar Pedido a STOCK"

            ElseIf gp.pedido.estado.id = Estado.estados.deposito Then
                lblModalDepo.Text = "El Pedido esta listo para ser enviado"

            ElseIf gp.pedido.estado.id = Estado.estados.enviado Then
                lblModalDepo.Text = "Pedido en camino. confirmar recepcion con el cliente"

            ElseIf gp.pedido.estado.id = Estado.estados.entregado Then
                lblModalDepo.Text = "Pedido entregado al cliente"
            End If
        Else
            HFBtnProd.Value = ""
            lblModalDepo.Text = "El Pedido NO esta listo para ser enviado"
        End If

        If gp.pedido.estado.id = Estado.estados.entregado Or gp.pedido.estado.id = Estado.estados.stock Then
            HFBtnDepo.Value = "disabled"
            HFBtnProd.Value = "disabled"
        Else
            HFBtnDepo.Value = ""
        End If

        If gp.pedido.estado.id > Estado.estados.recibido Then
            HFBtnOrden.Value = "disabled"
        Else
            HFBtnOrden.Value = ""
            HFBtnProd.Value = "disabled"
            HFBtnDepo.Value = "disabled"
        End If

        If gp.pedido.estado.id = Estado.estados.enCola Then
            HFBtnDepo.Value = "disabled"
        End If

        If gp.pedido.estado.id = Estado.estados.enProduccion And gp.pedido.getPAlmacenar = 0 Then
            HFBtnDepo.Value = "disabled"
        End If

        HFEstado.Value = gp.pedido.estado.id

    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("panelPedidos.aspx")
    End Sub

    Protected Sub btnEnviarProd_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            Dim gp As GestorPedidos

            Dim idPedido As Integer
            idPedido = ViewState("idPedido")
            gp = New GestorPedidos(idPedido)
            gp.EnviarProduccion(grEnviarProd)
            sb.write(String.Format("Pedido {0} enviado a produccion", gp.pedido.id))
            HFCrystal.Value = "orden"
            If gp.pedido.usaStock Then
                HFStock.Value = "y"
            End If

            llenarGrillasDetalle()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Public Sub llenarGrillasDetalle()
        Dim items As DataTable
        Dim materiales As GestorDatos.resultadoMateriales
        Dim _gp As GestorPedidos
        Dim idPedido As Integer

        Try
            idPedido = ViewState("idPedido")

            'refrescar el objeto pedidos desde la DB
            _gp = New GestorPedidos(idPedido)
            items = gd.getItems(_gp.pedido.id)

            grDetalle.DataSource = items
            grStock.DataSource = items
            grCambiarStock.DataSource = items
            grDeposito.DataSource = gd.getItems(_gp.pedido.id, DbHelper.tipoItem.detalle)
            grEnviarProd.DataSource = gd.getItems(_gp.pedido.id, DbHelper.tipoItem.enviarProd)
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

            If _gp.pedido.estado.id = Estado.estados.recibido Then
                If materiales = GestorDatos.resultadoMateriales.ok Then
                    HFMat.Value = "True"
                    lblMatModalOrden.Text = "Dispone de Materiales Suficientes"
                    btnImprimirCompra.Visible = False
                    btnEnviar.Visible = True
                ElseIf materiales = GestorDatos.resultadoMateriales.critico Then
                    HFMat.Value = "False"
                    lblMatModalOrden.Text = "Algunos materiales estan por agotarse"
                    btnEnviar.Visible = True
                    btnImprimirCompra.Visible = True
                ElseIf materiales = GestorDatos.resultadoMateriales.faltante Then
                    HFMat.Value = "False"
                    lblMatModalOrden.Text = "NO Dispone de Materiales Suficientes"
                    btnEnviar.Visible = False
                    btnImprimirCompra.Visible = True
                End If
            End If

            gd.getRegistro(_gp.pedido, grLog)
            lblnroPedidoDet.Text = _gp.pedido.id.ToString
            lblEstadoDet.Text = _gp.pedido.estado.nombre
            lblCantDet.Text = _gp.pedido.cantTotal.ToString
            lblRecibidoDet.Text = _gp.pedido.recibido.ToShortDateString
            lblClienteDet.Text = _gp.pedido.cliente.nombre.ToUpper

            'BOTON MODAL DEPOSITO
            If _gp.pedido.getPAlmacenar > 0 Then
                btnAccionDepo.Text = "Almacenar"
                HFDepo.Value = "almc"

            ElseIf _gp.pedido.estado.id = Estado.estados.deposito Then

                If _gp.pedido.cliente.id = 0 Then
                    btnAccionDepo.Text = "Enviar a Stock"
                    HFDepo.Value = "remito"
                Else
                    btnAccionDepo.Text = "Enviar a Cliente"
                    HFDepo.Value = "remito"
                End If
            ElseIf _gp.pedido.estado.id = Estado.estados.enviado Then
                btnAccionDepo.Text = "Confirmar Recepcion"
                HFDepo.Value = "recepcion"
            End If


            'PEDIENTES
            bltPendientes.Items.Clear()

            For Each msg As String In _gp.pendientes(HFExIcon)
                bltPendientes.Items.Add(msg)
            Next

            If _gp.pedido.modificado <> DateTime.MinValue Then
                lblModificadoDet.Text = _gp.pedido.modificado.ToShortDateString
            Else
                lblModificadoDet.Text = ""
            End If
            'range validators de enviar a prod y cambiar stock
            calcularRangeValidatorsGrillasStock(_gp)

            For Each r As GridViewRow In grDeposito.Rows
                Dim idEstado = grDeposito.DataKeys(r.RowIndex).Values(1)
                If idEstado = Estado.estados.cancelado Then
                    r.ForeColor = Drawing.Color.Gray
                End If
            Next
            validar()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnActualizarProd_Click(sender As Object, e As EventArgs) Handles btnActualizarProd.Click
        Try
            Dim gp As GestorPedidos

            Dim idPedido As Integer
            HFCrystal.Value = ""
            HFStock.Value = ""

            idPedido = ViewState("idPedido")

            gp = New GestorPedidos(idPedido)

            gp.actualizarEnCurso(grEnCurso)

            llenarGrillasDetalle()

            sb.write(String.Format("Pedido {0} - ACTUALIZADO", gp.pedido.id))
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnRefrescar_Click(sender As Object, e As EventArgs) Handles btnRefrescar.Click
        Dim idPedido As Integer
        idPedido = ViewState("idPedido")

        llenarGrillasDetalle()

    End Sub

    Protected Sub btnImprimirCompra_Click(sender As Object, e As EventArgs) Handles btnImprimirCompra.Click
        HFCrystal.Value = "compra"
    End Sub

    Protected Sub btnAccionDepo_Click(sender As Object, e As EventArgs) Handles btnAccionDepo.Click
        Dim gp As GestorPedidos

        Try
            Dim idPedido As Integer
            idPedido = ViewState("idPedido")
            gp = New GestorPedidos(idPedido)

            If gp.pedido.getPAlmacenar > 0 Then
                gp.enviarDeposito()
                sb.write(String.Format("Pedido {0} - ACTUALIZADO", gp.pedido.id))

            ElseIf gp.pedido.estado.id = Estado.estados.deposito Then

                If gp.pedido.cliente.id = 0 Then
                    gp.actualizarEstado(New Estado(Estado.estados.stock))
                    HFCrystal.Value = "remito"
                    sb.write(String.Format("Pedido {0} - GUARDADO EN STOCK STOCK", gp.pedido.id))
                Else
                    gp.actualizarEstado(New Estado(Estado.estados.enviado))
                    HFCrystal.Value = "remito"
                    sb.write(String.Format("Pedido {0} - ENVIADO A CLIENTE: {1}", gp.pedido.id, gp.pedido.cliente.nombre))
                End If

            ElseIf gp.pedido.estado.id = Estado.estados.enviado Then
                HFCrystal.Value = ""
                gp.actualizarEstado(New Estado(Estado.estados.entregado))
                sb.write(String.Format("Pedido {0} - ENTREGADO", gp.pedido.id))
            End If


            llenarGrillasDetalle()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnCambiarStock_Click(sender As Object, e As EventArgs) Handles btnCambiarStock.Click
        Dim gp As GestorPedidos

        Try
            Dim idPedido As Integer
            idPedido = ViewState("idPedido")
            gp = New GestorPedidos(idPedido)

            gp.EnviarProduccion(grCambiarStock, True)

            sb.write(String.Format("Pedido {0} Actualizado", gp.pedido.id))

            If gp.pedido.usaStock Then
                HFStock.Value = "r"
            End If

            llenarGrillasDetalle()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class