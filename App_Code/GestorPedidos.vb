Imports System.Data

Public Class GestorPedidos
    Public pedido As Pedido
    Private db As DbHelper
    Private mail As mail

    Public Sub New(ByVal _idPedido As Integer)
        pedido = New Pedido(_idPedido)
        db = New DbHelper("pedidos")
        mail = New mail(pedido)
    End Sub

    Public Sub New(ByVal _cliente As Cliente)
        pedido = New Pedido(_cliente)
        db = New DbHelper("pedidos")
        mail = New mail(pedido)
    End Sub

    Public Sub addItem(ByVal _item As Item, Optional _existente As Boolean = False)
        Dim encontro As Boolean
        Try
            If _existente Then
                For Each i As Item In pedido.items
                    If i.getProducto.id = _item.getProducto.id And i.getEstado.id <> Estado.estados.cancelado Then
                        Dim cantActual = i.getCant()
                        i.setCant(cantActual + _item.getCant())
                        i.monto += _item.monto
                        i.actualizar()
                        encontro = True
                        Exit For
                    End If
                Next

                If Not encontro Then
                    pedido.items.Add(_item)
                    _item.idPedido = pedido.id
                    _item.insertar()
                End If

                pedido.calcularTotales()
                pedido.actualizar()
            Else
                pedido.agregarItem(_item)
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub enviarPedido()
        Try
            pedido.enviar()
            Dim mail = New mail(pedido)
            mail.send("su pedido fue recibido y sera procesado a la brevedad")
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub actualizarEnCurso(_gr As GridView)
        Dim cambio = False

        For Each r As GridViewRow In _gr.Rows
            Dim idItem = Convert.ToInt32(_gr.DataKeys(r.RowIndex).Value)
            Dim index = pedido.itemIndex(idItem)
            Dim txtEnsamGridView As TextBox
            Dim hojas As Integer = 0
            Dim marcos As Integer = 0
            Dim ensamblados As Integer = 0

            txtEnsamGridView = r.FindControl("txtEnsambladas")

            If txtEnsamGridView.Text.Trim <> "" Then
                ensamblados = txtEnsamGridView.Text.Trim
            End If

            If ensamblados <> pedido.items(index).getEnsamblados() Then
                pedido.items(index).setEnsamblados(ensamblados)
                cambio = True
            End If

            If cambio Then
                pedido.items(index).actualizar()
            End If
        Next

        If cambio Then
            If pedido.estado.id < Estado.estados.enProduccion Then
                pedido.estado = New Estado(Estado.estados.enProduccion)
            End If

            pedido.actualizar()

        End If
    End Sub

    Friend Sub eliminarItem(_index As Integer)
        pedido.eliminarItem(_index)
    End Sub


    Public Sub enviarDeposito()
        'EL ITEM PASA A ESTADO DEPOSITO SI TODOS DEPOSITO = CANT - STOCK POR TRIGGER DE LA DB
        Dim flag = True
        Try
            For Each i As Item In pedido.items
                If i.getEstado.id <> Estado.estados.cancelado Then
                    If i.getEnsamblados > i.getEnDeposito Then
                        i.setEnDeposito(i.getEnsamblados)
                        i.actualizar()
                    End If
                End If

                If i.getEstado.id <> Estado.estados.deposito And i.getEstado.id <> Estado.estados.cancelado Then
                    flag = False
                End If
            Next

            If flag Then
                pedido.estado = New Estado(Estado.estados.deposito)
                pedido.actualizar()
            End If
            mail.send(String.Format("Su pedido {0} se encuentra en deposito y sera enviado a la brevedad", pedido.id))
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub EnviarProduccion(_gr As GridView, Optional _cambiarStock As Boolean = False)
        Dim flag = True
        'ACTUALIZAR STOCK EN CADA ITEM DEL PEDIDO
        For Each r As GridViewRow In _gr.Rows
            Dim idItem = Convert.ToInt32(_gr.DataKeys(r.RowIndex).Value)
            Dim index = pedido.itemIndex(idItem)
            Dim txstockGridView As TextBox
            Dim stock As Integer

            txstockGridView = r.FindControl("txtStockRow")
            Dim txtVal = txstockGridView.Text.Trim

            If txtVal <> "" Then
                stock = txtVal
            Else
                If _cambiarStock Then
                    Continue For
                Else
                    stock = 0
                End If
            End If

            pedido.items(index).setStock(stock)

            If stock > 0 Then
                pedido.usaStock = True
            End If

            If _cambiarStock Then
                'SI EL NUEVO STOCK CUBRE LA TOTALIDAD DEL PEDIDO
                If pedido.items(index).stock + pedido.items(index).getEnDeposito = pedido.items(index).getCant() Then
                    pedido.items(index).setEstado(New Estado(Estado.estados.deposito))
                End If
            Else
                'SI SE CUBRE 100% DEL PEDIDO CON STOCK CAMBIAR EL ESTADO
                If pedido.items(index).stock = pedido.items(index).getCant() Then
                    pedido.items(index).setEstado(New Estado(Estado.estados.deposito))

                ElseIf pedido.items(index).getEstado.id = Estado.estados.recibido Then
                    pedido.items(index).setEstado(New Estado(Estado.estados.enCola))
                End If
            End If
            pedido.items(index).actualizar()
        Next

        'SI ALGUN ITEM NO ESTA EN ESTADO DEPOSITO MARCA LA FLAG EN FALSE
        For Each i As Item In pedido.items
            If i.getEstado().id <> Estado.estados.deposito Then
                flag = False
                Exit For
            End If
        Next

        'SI TODOS LOS ITEMS ESTAN EN ESTADO DEPOSITO MARCA EL PEDIDO COMO DEPOSITO. SI NO, EN COLA
        If flag Then
            pedido.estado = New Estado(Estado.estados.deposito)
        ElseIf Not _cambiarStock Then
            pedido.estado = New Estado(Estado.estados.enCola)
        End If
        pedido.actualizar()
    End Sub

    Friend Sub cancelarItem(_idItem As Integer)
        Dim itemIndex = pedido.itemIndex(_idItem)
        Dim estadoCancelado = New Estado(Estado.estados.cancelado)
        Dim flag = True
        'LOS PRODUCTOS ENSAMBLADOS SE ENVIAN A STOCK CON UN TRIGGER EN LA TABLA ITEMS
        Try
            pedido.items(itemIndex).setEstado(estadoCancelado)
            pedido.items(itemIndex).actualizar()

            'REVISA SI TODOS LOS ITEMS ESTAN CANCELADOS
            For Each i As Item In pedido.items
                If i.getEstado().id <> Estado.estados.cancelado Then
                    flag = False
                    Exit For
                End If
            Next

            If flag Then
                pedido.estado = estadoCancelado
                pedido.actualizar()
                mail.send(String.Format("Su pedido {0} fue CANCELADO", pedido.id))
            End If

            pedido.calcularTotales()
            pedido.actualizar()

        Catch ex As Exception
            Throw
        End Try
    End Sub

    Friend Sub cancelarPedido()
        Dim estadoCancelado = New Estado(Estado.estados.cancelado)
        Try
            For Each i As Item In pedido.items
                i.setEstado(estadoCancelado)
            Next

            pedido.estado = estadoCancelado
            pedido.actualizar(True)
            mail.send(String.Format("Su pedido {0} fue CANCELADO", pedido.id))
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub actualizarEstado(_estado As Estado)
        Try
            For Each i As Item In pedido.items
                If i.getEstado.id <> Estado.estados.cancelado Then
                    i.setEstado(_estado)
                    i.actualizar()
                End If
            Next

            pedido.estado = _estado
            pedido.actualizar()
            mail.send(String.Format("Su pedido {0} se encuentra en estado: {1}", pedido.id, pedido.estado.nombre))
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Function pendientes(_hf As HiddenField) As List(Of String)
        Dim ret = New List(Of String)
        Dim enviarAProdMsg = "Enviar a Produccion e imprimir ordenes de trabajo"
        Dim fabPendMsg = "Fabricar los productos faltantes"
        Dim recDepoMsg = "Hay productos pendientes de ser recibidos en el deposito"
        Dim enviarMsg = "Enviar productos al cliente"
        Dim confMsg = "Confirmar recepcion con el cliente"
        Dim entregadoMsg = "Sin Pendientes"
        Dim fabPendFlag As Boolean = True
        Dim recDepoFlag As Boolean = True

        If pedido.estado.id = Estado.estados.recibido Then
            ret.Add(enviarAProdMsg)
            _hf.Value = "enviarProd"
        ElseIf pedido.estado.id = Estado.estados.deposito Then
            ret.Add(enviarMsg)
            _hf.Value = "depo"
        ElseIf pedido.estado.id = Estado.estados.enviado Then
            ret.Add(confMsg)
            _hf.Value = "depo"
        ElseIf pedido.estado.id = Estado.estados.entregado Then
            ret.Add(entregadoMsg)
            _hf.Value = "entregado"
        Else
            For Each i As Item In pedido.items
                If i.getEstado.id <> Estado.estados.cancelado Then
                    If fabPendFlag Then
                        If i.getCant - i.stock - i.getEnsamblados > 0 Then
                            ret.Add(fabPendMsg)
                            fabPendFlag = False
                            _hf.Value = "prod"
                        End If
                    End If

                    If recDepoFlag Then
                        If i.getEnsamblados - i.getEnDeposito > 0 Then
                            ret.Add(recDepoMsg)
                            recDepoFlag = False
                            _hf.Value = "depo"
                        End If
                    End If
                End If
            Next

            If fabPendFlag = False And recDepoFlag = False Then
                _hf.Value = "prod-depo"
            End If
        End If
        Return ret
    End Function

    Public Sub modificar(_gr As GridView)
        Dim update = False
        For Each r As GridViewRow In _gr.Rows
            Dim cbMadera As DropDownList
            Dim cbHoja As DropDownList
            Dim cbMarco As DropDownList
            Dim cbChapa As DropDownList
            Dim cbMano As DropDownList
            Dim txtCant As TextBox
            Dim idItem = _gr.DataKeys(r.RowIndex).Values(0)
            Dim itemIndex = pedido.itemIndex(idItem)

            cbMadera = r.FindControl("cbMadera")
            cbHoja = r.FindControl("cbHoja")
            cbMarco = r.FindControl("cbMarco")
            cbChapa = r.FindControl("cbChapa")
            cbMano = r.FindControl("cbMano")
            txtCant = r.FindControl("txtCant")

            If pedido.items(itemIndex).getProducto.madera.id <> cbMadera.SelectedValue Or
                pedido.items(itemIndex).getProducto.hoja.id <> cbHoja.SelectedValue Or
                pedido.items(itemIndex).getProducto.marco.id <> cbMarco.SelectedValue Or
                pedido.items(itemIndex).getProducto.chapa.id <> cbChapa.SelectedValue Or
                pedido.items(itemIndex).getProducto.mano.id <> cbMano.SelectedValue Or
                pedido.items(itemIndex).getCant <> txtCant.Text.Trim Then
                update = True
            End If

            Try
                'ACTUALIZAR ITEM MODIFICADO
                If update Then
                    Dim cant = txtCant.Text.Trim
                    Dim chapa = New Chapa(cbChapa.SelectedItem.Value, cbChapa.SelectedItem.Text)
                    Dim marco = New Marco(cbMarco.SelectedItem.Value, cbMarco.SelectedItem.Text)
                    Dim madera = New Madera(cbMadera.SelectedItem.Value, cbMadera.SelectedItem.Text)
                    Dim hoja = New Hoja(cbHoja.SelectedItem.Value, cbHoja.SelectedItem.Text)
                    Dim mano = New Mano(cbMano.SelectedItem.Value, cbMano.SelectedItem.Text)
                    Dim linea = pedido.items(pedido.itemIndex(idItem)).getProducto().linea
                    Dim producto = New Producto(hoja, marco, madera, chapa, mano, linea)


                    pedido.items(itemIndex).setProducto(producto)
                    pedido.items(itemIndex).setCant(cant)
                    pedido.items(itemIndex).actualizar()
                End If
            Catch ex As Exception
                Throw
            End Try
        Next

        'ACTUALIZAR PEDIDO
        If update Then
            Try
                pedido.calcularTotales()
                pedido.actualizar()
            Catch ex As Exception
                Throw
            End Try
        End If
    End Sub
End Class
