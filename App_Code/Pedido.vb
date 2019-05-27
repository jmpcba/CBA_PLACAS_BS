Imports System.Data
Public Class Pedido
    Public id As Integer
    Public items As List(Of Item)
    Public cliente As Cliente
    Public recibido As Date
    Public modificado As Date
    Public entregado As Date
    Public precioTotal As Decimal
    Public cantTotal As Integer
    Public estado As Estado
    Public despiece As DataTable
    Private db As DbHelper
    Friend usaStock As Boolean = False

    Sub New()
        Dim today = Date.Today
        recibido = CDate(today.ToShortDateString)
        items = New List(Of Item)
        db = New DbHelper("pedidos")
        precioTotal = 0
        cantTotal = 0
        cliente = New Cliente()
    End Sub

    Sub New(_cliente As Cliente)
        Dim today = Date.Today
        recibido = CDate(today.ToShortDateString)
        items = New List(Of Item)
        db = New DbHelper("pedidos")
        precioTotal = 0
        cantTotal = 0
        cliente = _cliente
    End Sub

    Public Sub New(ByVal _id As Integer)
        Try
            Dim dbPedidos = New DbHelper("pedidos")
            Dim dbItems = New DbHelper("items")
            Dim tPedido = dbPedidos.getRow(_id)
            Dim tItems As DataTable
            Dim row = tPedido.Rows(0)
            Dim today = Date.Today
            items = New List(Of Item)
            precioTotal = 0
            cantTotal = 0

            id = row("id")
            'cliente.id = row("ID_CLIENTE")
            recibido = row("fecha_recibido")
            cliente = New Cliente(row("ID_CLIENTE"))

            If Not IsDBNull(row("fecha_entregado")) Then
                entregado = row("fecha_entregado")
            End If

            If Not IsDBNull(row("fecha_modificado")) Then
                modificado = row("fecha_modificado")
            End If

            estado = New Estado(row("ID_ESTADO"))

            tItems = dbItems.getRange("ID_PEDIDO", id)
            For Each r As DataRow In tItems.Rows
                Dim item = New Item(r("id"))
                items.Add(item)
            Next

            calcularTotales()

        Catch ex As Exception
            Throw
        End Try

    End Sub

    Public Sub agregarItem(ByVal _item As Item)
        Dim encontro = False

        For Each i As Item In items
            If i.getProducto.id = _item.getProducto.id And i.getEstado.id <> Estado.estados.cancelado Then
                Dim cantActual = i.getCant()
                i.setCant(cantActual + _item.getCant())
                i.monto += _item.monto
                encontro = True
                Exit For
            End If
        Next

        If Not encontro Then
            items.Add(_item)
        End If

        precioTotal += _item.monto
        cantTotal += _item.getCant()

    End Sub

    Public Sub enviar()
        db = New DbHelper()
        Try
            id = db.insertar(Me)

            For Each item As Item In items
                item.idPedido = id
                item.insertar()
            Next
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Friend Sub actualizar(Optional _updateItems As Boolean = False)
        Dim db = New DbHelper("pedidos")
        Dim idEstado = Estado.estados.cancelado

        'BUSCAR EL ITEM CON ESTADO MENOR Y SETEAR ESE ESTADO PARA EL PEDIDO
        For Each i As Item In items
            If i.getEstado().id <> Estado.estados.cancelado Then
                If i.getEstado.id < idEstado Then
                    idEstado = i.getEstado.id
                End If
            End If
        Next

        If estado.id <> idEstado Then
            estado = New Estado(idEstado)
        End If

        If _updateItems Then
            For Each i As Item In items
                i.actualizar()
            Next
        End If

        db.actualizar(Me)
    End Sub

    Public Function getItemById(_ItemId As Integer) As Item
        Dim retItem As Item

        For Each item As Item In items
            If item.id = _ItemId Then
                retItem = item
                Exit For
            End If
        Next

        Return retItem

    End Function

    Public Function calcularMateriales(_recalc As Boolean) As DataTable
        Dim dts = New List(Of DataTable)
        Dim db = New DbHelper

        despiece = db.getDespiece(Me, _recalc)

        For Each i As Item In items
            i.getDespiece()
        Next
        Return despiece
    End Function

    Friend Sub eliminarItem(_index As Integer)
        Dim i As Item
        i = items(_index)
        items.Remove(i)
        calcularTotales()
    End Sub

    Public Function itemIndex(_id As Integer) As Integer
        Dim result = -1
        Dim j = 0
        For Each i As Item In items
            If i.id = _id Then
                result = j
                Exit For
            End If
            j += 1
        Next

        Return result
    End Function

    Public Sub calcularTotales()

        cantTotal = 0
        precioTotal = 0

        For Each i As Item In items
            If i.getEstado().id <> 7 Then
                cantTotal += i.getCant()
                precioTotal += i.monto
            End If
        Next
    End Sub

    Public Function getPAlmacenar() As Integer
        Dim cont As Integer

        For Each i As Item In items
            If i.getEstado.id <> Estado.estados.cancelado Then
                cont += i.getEnsamblados - i.getEnDeposito
            End If
        Next
        Return cont

    End Function
End Class
