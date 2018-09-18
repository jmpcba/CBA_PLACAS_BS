﻿Imports System.Data

Public Class GestorPedidos
    Public pedido As Pedido
    Private db As DbHelper
    Private mail As mail

    Public Sub New(ByVal _idPedido As Integer)
        pedido = New Pedido(_idPedido)
        db = New DbHelper("pedidos")
        mail = New mail()
    End Sub

    Public Sub New(ByVal _cliente As Cliente)
        pedido = New Pedido(_cliente)
        db = New DbHelper("pedidos")
        mail = New mail()
    End Sub

    Public Sub addItem(ByVal _item As Item, Optional _existente As Boolean = False)
        Try
            If _existente Then
                _item.idPedido = pedido.id
                _item.insertar()
                pedido.agregarItem(_item)
                pedido.actualizar()
            Else
                pedido.agregarItem(_item)
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub enviarPedido()
        Dim mail = New Mail
        Try
            pedido.enviar()
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
            Dim txtHojasGridView As TextBox
            Dim txtMarcosGridView As TextBox
            Dim txtEnsamGridView As TextBox
            Dim hojas As Integer = 0
            Dim marcos As Integer = 0
            Dim ensamblados As Integer = 0

            txtHojasGridView = r.FindControl("txtHojasTerminadas")
            txtMarcosGridView = r.FindControl("txtMarcosTerminados")
            txtEnsamGridView = r.FindControl("txtEnsambladas")

            If txtHojasGridView.Text.Trim <> "" Then
                hojas = txtHojasGridView.Text.Trim
            End If

            If txtMarcosGridView.Text.Trim <> "" Then
                marcos = txtMarcosGridView.Text.Trim
            End If

            If txtEnsamGridView.Text.Trim <> "" Then
                ensamblados = txtEnsamGridView.Text.Trim
            End If

            If hojas <> pedido.items(index).hojasTerminadas Then
                pedido.items(index).hojasTerminadas = hojas
                cambio = True
            End If

            If marcos <> pedido.items(index).marcosTerminados Then
                pedido.items(index).marcosTerminados = marcos
                cambio = True
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
                pedido.actualizar()
            End If
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
                If i.getEnsamblados > i.getEnDeposito Then
                    i.setEnDeposito(i.getEnsamblados)
                    i.actualizar()
                End If

                If i.getEstado.id <> Estado.estados.deposito Then
                    flag = False
                End If
            Next

            If flag Then
                pedido.estado = New Estado(Estado.estados.deposito)
                pedido.actualizar()
            End If
            mail.send(String.Format("Su pedido {0} se encuentra en Deposito", pedido.id))
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub EnviarProduccion(_gr As GridView)
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
                stock = 0
            End If
            pedido.items(index).setStock(stock)


            'SI SE CUBRE 100% DEL PEDIDO CON STOCK CAMBIAR EL ESTADO
            If pedido.items(index).stock = pedido.items(index).getCant() Then
                pedido.items(index).setEstado(New Estado(Estado.estados.deposito))
            Else
                pedido.items(index).setEstado(New Estado(Estado.estados.enCola))
            End If
            pedido.items(index).actualizar()
        Next

        'SI ALGUN ITEM NO ESTA EN ESTADO PEDIDO MARCA LA FLAG EN FALSE
        For Each i As Item In pedido.items
            If i.getEstado().id <> Estado.estados.deposito Then
                flag = False
                Exit For
            End If
        Next

        'SI TODOS LOS ITEMS ESTAN EN ESTADO DEPOSITO MARCA EL PEDIDO COMO DEPOSITO. SI NO, EN COLA
        If flag Then
            pedido.estado = New Estado(Estado.estados.deposito)
        Else
            pedido.estado = New Estado(Estado.estados.enCola)
        End If
        pedido.actualizar()

        'mail.send(String.Format("Su pedido {0} ingreso a la cola de produccion", pedido.id))
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
                mail.send(String.Format("Su pedido {0} fue modificado", pedido.id))
            End If
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
            mail.send(String.Format("Su pedido {0} fue modificado", pedido.id))
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub actualizarEstado(_estado As Estado)
        Try
            For Each i As Item In pedido.items
                i.setEstado(_estado)
                i.actualizar()
            Next

            pedido.estado = _estado
            pedido.actualizar()
            mail.send(String.Format("Su pedido {0} se encuenbtra en estado: {1}", pedido.id, pedido.estado.nombre))
        Catch ex As Exception
            Throw
        End Try
    End Sub
End Class
