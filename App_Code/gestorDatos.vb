Imports System.Data
Imports System.Data.SqlClient
Imports CBA_PLACAS_BS

Public Class GestorDatos
    Public chapa As Chapa
    Public marco As Marco
    Public madera As Madera
    Public hoja As Hoja
    Public linea As Linea
    Public mano As Mano
    Private db As DbHelper

    Public Enum combos
        estados
        clientes
        unidadMateriales
        lineas
    End Enum

    Public Enum reportes
        ordenTrabajo
        remito
        remitoInterno
        compras
        etiquetaDeposito
        etiquetaDepositoUnica
        etiquetaDepositoInterna
        etiquetaDepositoStock
    End Enum

    Public Enum grillas
        productos
        pedidosModificar
    End Enum
    Public Enum tipoItems
        busqueda
        enCurso
        Ensamblados
        modificar
    End Enum

    Public Enum resultadoMateriales
        ok
        critico
        faltante
    End Enum

    Public Sub New()
        chapa = New Chapa()
        marco = New Marco()
        madera = New Madera()
        hoja = New Hoja()
        linea = New Linea()
        mano = New Mano
    End Sub

    Friend Function getPedidos(_cliente As Cliente) As DataTable
        Try
            Dim db As New DbHelper()
            Return db.getPedidos(_cliente)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Sub fillCombos(ByVal _cbLinea As DropDownList, ByVal _cbChapa As DropDownList, ByVal _cbMarco As DropDownList, ByVal _cbMadera As DropDownList, ByVal _cbHoja As DropDownList, ByVal _cbMano As DropDownList)
        Dim db = New DbHelper()

        _cbMarco.DataSource = db.fillCombo("SP_COMBO_MARCO", _cbLinea.SelectedValue)
        _cbMadera.DataSource = db.fillCombo("SP_COMBO_MADERA", _cbLinea.SelectedValue)
        _cbChapa.DataSource = db.fillCombo("SP_COMBO_CHAPA", _cbLinea.SelectedValue)
        _cbHoja.DataSource = db.fillCombo("SP_COMBO_HOJA", _cbLinea.SelectedValue)
        _cbMano.DataSource = db.fillCombo("SP_COMBO_MANO", _cbLinea.SelectedValue)

        _cbMano.DataTextField = "nombre"
        _cbMano.DataValueField = "id"

        _cbChapa.DataTextField = "nombre"
        _cbChapa.DataValueField = "id"

        _cbMarco.DataTextField = "nombre"
        _cbMarco.DataValueField = "id"

        _cbMadera.DataTextField = "nombre"
        _cbMadera.DataValueField = "id"

        _cbHoja.DataTextField = "nombre"
        _cbHoja.DataValueField = "id"

        _cbChapa.DataSourceID = Nothing
        _cbMarco.DataSourceID = Nothing
        _cbMadera.DataSourceID = Nothing
        _cbHoja.DataSourceID = Nothing
        _cbMano.DataSourceID = Nothing

        _cbChapa.DataBind()
        _cbMarco.DataBind()
        _cbMadera.DataBind()
        _cbHoja.DataBind()
        _cbMano.DataBind()

    End Sub

    Public Sub fillCombos(ByVal _idLinea As Integer, ByVal _cbChapa As DropDownList, ByVal _cbMarco As DropDownList, ByVal _cbMadera As DropDownList, ByVal _cbHoja As DropDownList, ByVal _cbMano As DropDownList)
        Dim db = New DbHelper()

        _cbMarco.DataSource = db.fillCombo("SP_COMBO_MARCO", _idLinea)
        _cbMadera.DataSource = db.fillCombo("SP_COMBO_MADERA", _idLinea)
        _cbChapa.DataSource = db.fillCombo("SP_COMBO_CHAPA", _idLinea)
        _cbHoja.DataSource = db.fillCombo("SP_COMBO_HOJA", _idLinea)
        _cbMano.DataSource = db.fillCombo("SP_COMBO_MANO", _idLinea)

        _cbMano.DataTextField = "nombre"
        _cbMano.DataValueField = "id"

        _cbChapa.DataTextField = "nombre"
        _cbChapa.DataValueField = "id"

        _cbMarco.DataTextField = "nombre"
        _cbMarco.DataValueField = "id"

        _cbMadera.DataTextField = "nombre"
        _cbMadera.DataValueField = "id"

        _cbHoja.DataTextField = "nombre"
        _cbHoja.DataValueField = "id"

        _cbChapa.DataSourceID = Nothing
        _cbMarco.DataSourceID = Nothing
        _cbMadera.DataSourceID = Nothing
        _cbHoja.DataSourceID = Nothing
        _cbMano.DataSourceID = Nothing

        _cbChapa.DataBind()
        _cbMarco.DataBind()
        _cbMadera.DataBind()
        _cbHoja.DataBind()
        _cbMano.DataBind()

    End Sub

    Public Sub getCombos(ByVal _cb As DropDownList, ByVal _comboName As combos)
        Try
            If _comboName = combos.estados Then

                Dim estado As New Estado()
                _cb.DataSource = estado.getEstados()
                _cb.DataTextField = "nombre"
                _cb.DataValueField = "id"
                _cb.DataBind()

            ElseIf _comboName = combos.clientes Then

                Dim cliente As New Cliente()
                _cb.DataSource = cliente.getClientes()
                _cb.DataTextField = "nombre"
                _cb.DataValueField = "id"
                _cb.DataBind()
            ElseIf _comboName = combos.lineas Then

                _cb.DataSource = linea.getLineas()
                _cb.DataTextField = "nombre"
                _cb.DataValueField = "id"
                _cb.DataBind()
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub mostrarGrillaItems(ByVal _grilla As GridView, ByVal _pedido As Pedido, Optional _withStock As Boolean = False)
        'definicion de tabla
        Dim dt = New DataTable()
        dt.Columns.Add("LINEA", GetType(String))
        dt.Columns.Add("HOJA", GetType(String))
        dt.Columns.Add("MARCO", GetType(String))
        dt.Columns.Add("MADERA", GetType(String))
        dt.Columns.Add("CHAPA", GetType(String))
        dt.Columns.Add("MANO", GetType(String))
        dt.Columns.Add("CANTIDAD", GetType(Integer))
        dt.Columns.Add("MONTO", GetType(Decimal))

        If _withStock Then
            dt.Columns.Add("STOCK", GetType(Decimal))
        End If

        'llenado de tabla
        For Each item As Item In _pedido.items
            Dim row = dt.NewRow()
            row("linea") = item.getProducto.linea.nombre
            row("hoja") = item.getProducto.hoja.nombre
            row("marco") = item.getProducto.marco.nombre
            row("madera") = item.getProducto.madera.nombre
            row("chapa") = item.getProducto.chapa.nombre
            row("cantidad") = item.getCant
            row("MONTO") = item.monto
            row("mano") = item.getProducto.mano.nombre

            If _withStock Then
                row("stock") = item.getProducto.stock
            End If

            dt.Rows.Add(row)
        Next
        'actualizacion de grilla
        _grilla.DataSource = dt
        _grilla.DataBind()
    End Sub

    Public Function getItemsModificar(ByVal _pedido As Integer) As DataTable
        Try
            Dim db = New DbHelper("ITEMS")
            Return db.getItemsModificar(_pedido)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Friend Function getReporte(_pedido As Pedido, _reporte As reportes) As DataTable
        Try
            db = New DbHelper()
            Return db.getReporte(_pedido, _reporte)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Friend Function getReporte(_ids As String()) As DataTable
        Try
            db = New DbHelper()
            Return db.getReporte(_ids)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getItems(_pedido As Integer, Optional _enCurso As Boolean = False) As DataTable
        Try
            Dim db = New DbHelper("ITEMS")
            Return db.getItems(_pedido, _enCurso = _enCurso)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getItems(_pedido As Integer) As DataTable
        Try
            Dim db = New DbHelper("ITEMS")

            Return db.getItems(_pedido)

        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getItems(_pedido As Integer, _tipo As DbHelper.tipoItem) As DataTable
        Try
            Dim db = New DbHelper("ITEMS")

            Return db.getItems(_pedido, _tipo)

        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function buscarPedidos(ByVal _nroPedido As Integer, _fecDesde As Date, ByVal _fecHasta As Date, _fecModDesde As Date, _fecModHasta As Date, ByVal _cliente As Object, ByVal _estado As Object) As DataTable

        Dim db = New DbHelper("pedidos")
        Try
            Return db.buscarPedidos(_nroPedido, _fecDesde, _fecHasta, _fecModDesde, _fecModHasta, _cliente, _estado)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function calcularMateriales(_pedido As Pedido, _gr As GridView, Optional _recalc As Boolean = False) As resultadoMateriales

        Dim materiales = _pedido.calcularMateriales(_recalc)
        Dim result As New List(Of resultadoMateriales)
        Dim redRows = New List(Of Integer)


        Try

            Dim i = 0

            For Each r As DataRow In materiales.Rows
                Dim requerido = r("CONSUMO")

                If requerido > r("STOCK_DISPONIBLE") Then
                    If Not result.Contains(resultadoMateriales.faltante) Then
                        result.Add(resultadoMateriales.faltante)
                    End If
                    redRows.Add(i)
                ElseIf r("STOCK_DISPONIBLE") < r("STOCK_MINIMO") Then
                    redRows.Add(i)
                    If Not result.Contains(resultadoMateriales.critico) Then
                        result.Add(resultadoMateriales.critico)
                    End If
                Else
                    result.Add(resultadoMateriales.ok)
                End If

                i += 1
            Next

            _gr.DataSource = materiales
            _gr.DataBind()

            If redRows.Count > 0 Then
                For Each i In redRows
                    _gr.Rows(i).ForeColor = Drawing.Color.Red
                Next
            End If

            If result.Count = 0 Then
                result.Add(resultadoMateriales.ok)
            End If

        Catch ex As Exception
            Throw
        End Try

        Return result.Max
    End Function

    Public Sub getRegistro(_pedido As Pedido, _grRegistro As GridView)
        Dim DTR = New DataTable
        Dim dbRegistroPedido = New DbHelper()
        DTR = dbRegistroPedido.getRegistroPedido(_pedido.id)

        For Each item As Item In _pedido.items
            Dim dbRegistroItem = New DbHelper()
            Dim DTI As New DataTable
            DTI = dbRegistroItem.getRegistroItem(item.id)
            DTR.Merge(DTI)
            DTR.DefaultView.Sort = "FECHA"
        Next

        _grRegistro.DataSource = DTR
        _grRegistro.DataBind()
    End Sub

    Public Function getRegistro(p As Producto) As DataTable
        Try
            Dim db As New DbHelper
            Return db.getRegistro(p)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getRegistro(p As Pieza) As DataTable
        Try
            Dim db As New DbHelper
            Return db.getRegistro(p)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getDespieceProducto(_idProducto As Integer) As DataTable
        Try
            db = New DbHelper()
            Return db.getDespiece(_idProducto)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getPedidos() As DataTable
        Try
            db = New DbHelper()
            Return db.getPedidos()
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getPedidos(prod As Producto) As DataTable
        Try
            db = New DbHelper()
            Return db.getPedidos(prod)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getProductos() As DataTable
        Try
            Dim db As New DbHelper
            Return db.getProductos()
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getProductos(_pieza As Pieza) As DataTable
        'LISTA DE PRODUCTOS QUE CONTIENEN UNA PIEZA
        Try
            Dim db As New DbHelper
            Return db.getProductos(_pieza)
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function getPiezas() As DataTable
        Dim db As New DbHelper
        Try
            Return db.getPiezas()
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Function materialesCriticos() As Integer
        Try
            Dim db As New DB(DB.conStrings.datos)
            Return db.ejecutarScalar("SELECT COUNT(*) FROM MATERIALES WHERE STOCK_DISPONIBLE < STOCK_MINIMO")
        Catch ex As Exception
            Throw
        End Try
    End Function
End Class
