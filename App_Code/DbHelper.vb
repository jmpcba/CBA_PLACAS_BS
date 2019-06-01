Imports System.Data
Imports System.Web
Imports QRCoder
Imports System.Drawing

Imports System.Data.SqlClient
Imports CBA_PLACAS_BS

Public Class DbHelper
    Private cnn As SqlConnection
    Private cmd As SqlCommand
    Private da As SqlDataAdapter
    Private ds As DataSet
    Private table As String
    Private conStr As String = ConfigurationManager.ConnectionStrings("cbaPlacasConnectionString1").ConnectionString
    Private CI As System.Globalization.CultureInfo = System.Threading.Thread.CurrentThread.CurrentCulture

    Public Enum tablas
        CHAPAS
        MADERAS
        HOJAS
        LINEAS
        MANOS
        MARCOS
        PIEZAS
    End Enum

    Public Enum tipoItem
        modificar
        detalle
        enviarProd
        IncluirCancelados
    End Enum

    Sub New(ByVal _table As String)
        table = _table
        cnn = New SqlConnection(conStr)
        cmd = New SqlCommand()
        da = New SqlDataAdapter(cmd)
        ds = New DataSet()

        cmd.Connection = cnn
    End Sub

    Private Sub CIES()
        System.Threading.Thread.CurrentThread.CurrentCulture = CI
    End Sub

    Private Sub CIEN()
        System.Threading.Thread.CurrentThread.CurrentCulture = New System.Globalization.CultureInfo("en-US")
    End Sub


    Friend Sub eliminarPieza(_idProducto As Integer, _idPieza As Integer)
        Try
            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("DELETE FROM DESPIECE WHERE ID_PROD={0} AND ID_PIEZA={1}", _idProducto, _idPieza)

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Function getPedidos(_cliente As Cliente) As DataTable
        cmd.CommandText = "SELECT * FROM VW_PEDIDOS_CLIENTE WHERE ID_CLIENTE=" & _cliente.id
        cmd.CommandType = CommandType.Text

        Try
            da.Fill(ds, "pedidosCliente")
            Return ds.Tables("pedidosCliente")
        Catch ex As Exception
            Throw
        End Try
    End Function

    Friend Sub eliminar(_chapa As Chapa)

        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("SELECT COD_MAT FROM CHAPAS WHERE ID={0}", _chapa.id)
            Dim idMat = cmd.ExecuteScalar()

            cmd.CommandText = String.Format("DELETE MATERIALES WHERE ID={0}", idMat)
            cmd.ExecuteNonQuery()

            cmd.CommandText = String.Format("DELETE CHAPAS WHERE ID={0}", _chapa.id)
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            If ex.Message.ToLower.Contains(codigoError(tablas.CHAPAS)) Then
                Throw New Exception(mensajeExcepcion(tablas.CHAPAS))
            End If
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub eliminar(_p As Pieza)

        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("SELECT DISTINCT COD FROM PRODUCTOS P
                                            INNER JOIN DESPIECE D ON D.ID_PROD = P.id
                                            WHERE D.ID_PIEZA = {0} And P.VALIDO_HASTA Is NULL", _p.id)

            Dim reader = cmd.ExecuteReader()

            If reader.HasRows Then
                Dim exc As String
                exc = "Esta pieza no puede ser borrada, esta en uso en los siguientes productos activos: "

                While reader.Read
                    Dim cod = reader.GetInt16(0)
                    exc += cod & ", "
                End While

                exc = exc.Substring(0, exc.Length - 1)
                Throw New Exception(exc)
            Else
                reader.Close()
                cmd.CommandText = String.Format("SELECT * FROM ITEMS I INNER JOIN PRODUCTOS P ON P.ID = I.ID_PRODUCTO INNER JOIN DESPIECE D ON D.ID_PROD = P.ID WHERE D.ID_PIEZA={0} AND I.ID_ESTADO < 5 ORDER BY I.ID", _p.id)
                If cmd.ExecuteScalar > 0 Then
                    Throw New Exception("Esta pieza se utiliza en productos cuya fabricacion esta en curso")
                Else
                    cmd.CommandText = String.Format("DELETE DESPIECE WHERE ID_PIEZA = {0}", _p.id)
                    cmd.ExecuteNonQuery()

                    cmd.CommandText = String.Format("DELETE MATERIALES WHERE ID = {0}", _p.id)
                    cmd.ExecuteNonQuery()
                End If
            End If
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub eliminar(_mad As Madera)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("SELECT COD_MAT FROM MADERAS WHERE ID={0}", _mad.id)
            Dim idMat = cmd.ExecuteScalar()

            cmd.CommandText = String.Format("DELETE MATERIALES WHERE ID={0}", idMat)
            cmd.ExecuteNonQuery()

            cmd.CommandText = String.Format("DELETE MADERAS WHERE ID={0}", _mad.id)
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            If ex.Message.ToLower.Contains(codigoError(tablas.MADERAS)) Then
                Throw New Exception(mensajeExcepcion(tablas.MADERAS))
            Else
                Throw
            End If
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub eliminar(_prod As Producto)
        Try

            cmd.CommandText = String.Format("UPDATE PRODUCTOS SET VALIDO_HASTA='{0}' WHERE ID={1}", Today.Date.ToShortDateString, _prod.id)
            cnn.Open()

            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally

            cnn.Close()
        End Try
    End Sub

    Friend Function actualizarDespiece(_prod As Producto) As Integer
        Try
            Dim newIdProd As Integer

            newIdProd = actualizar(_prod, False)
            cnn.Open()
            cmd.CommandType = CommandType.Text

            For Each r As DataRow In _prod.despiece.Rows
                Dim consumo As String
                consumo = r("CONSUMO")

                Dim strConsumo = consumo.ToString

                strConsumo = strConsumo.Replace(",", ".")

                If r("CONSUMO") > 0 Then
                    cmd.CommandText = String.Format("INSERT INTO DESPIECE (ID_PROD, ID_PIEZA, CONSUMO, EN_PROGRESO) VALUES({0}, {1}, {2}, 0)", newIdProd, r("ID_PIEZA"), strConsumo.ToString)
                    cmd.ExecuteNonQuery()
                End If
            Next

            Return newIdProd
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()

        End Try
    End Function

    Friend Sub activarProducto(idProd As Integer)
        cmd.CommandType = CommandType.Text
        Try
            CIEN()
            cnn.Open()

            cmd.CommandText = String.Format("UPDATE PRODUCTOS Set VALIDO_HASTA=NULL WHERE ID={0}", idProd)
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
            CIES()
        End Try
    End Sub

    Friend Sub desactivarProducto(nvoId As Integer, viejoId As Integer)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("UPDATE ITEMS Set ID_PRODUCTO={0} WHERE ID_PRODUCTO={1}", nvoId, viejoId)
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Function existeProdDesactivado(prod As Producto) As Integer
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("Select ID FROM PRODUCTOS_DESACTIVADOS WHERE IDLINEA={0} IDCHAPA={1}, IDHOJA = {2}, IDMARCO = {3}, IDMADERA = {4}, IDMANO{5}",
                                            prod.linea.id, prod.chapa.id, prod.hoja.id, prod.marco.id, prod.madera.id, prod.mano.id)
            Dim ret = cmd.ExecuteScalar()
            Return ret

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Function

    Friend Sub registrar(p As Producto)

        cmd.CommandType = CommandType.Text

        Try
            Dim query As String
            cnn.Open()

            For Each r In p.registro
                query = String.Format("INSERT INTO REGISTRO_PRODUCTOS (CAMBIOS, COD_PRODUCTO, USUARIO) VALUES ('{0}', {1}, '{2}')", r, p.codigo, HttpContext.Current.User.Identity.Name)
                cmd.CommandText = query
                cmd.ExecuteNonQuery()
            Next

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub registrar(p As Pieza)

        cmd.CommandType = CommandType.Text

        Try
            Dim query As String
            cnn.Open()

            For Each r In p.registro
                query = String.Format("INSERT INTO REGISTRO_MATERIALES (CAMBIOS, COD_PIEZA, USUARIO) VALUES ('{0}', {1}, '{2}')", r, p.id, HttpContext.Current.User.Identity.Name)
                cmd.CommandText = query
                cmd.ExecuteNonQuery()
            Next

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub


    Friend Function existePedido(prod As Producto) As Integer
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("Select COUNT(ID) FROM ITEMS WHERE ID_PRODUCTO={0}", prod.id)
            Dim ret = cmd.ExecuteScalar()
            Return ret

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Function

    Friend Sub eliminar(_linea As Linea)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()

            cmd.CommandText = String.Format("DELETE LINEAS WHERE ID={0}", _linea.id)
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            If ex.Message.ToLower.Contains(codigoError(tablas.LINEAS)) Then
                Throw New Exception(mensajeExcepcion(tablas.LINEAS))
            Else
                Throw
            End If
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub eliminar(_hoj As Hoja)
        cmd.CommandText = String.Format("DELETE HOJAS WHERE ID={1}", _hoj.nombre, _hoj.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            If ex.Message.ToLower.Contains(codigoError(tablas.HOJAS)) Then
                Throw New Exception(mensajeExcepcion(tablas.HOJAS))
            Else
                Throw
            End If
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub eliminar(_mar As Marco)
        cmd.CommandText = String.Format("DELETE MARCOS WHERE ID={0}", _mar.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            If ex.Message.ToLower.Contains(codigoError(tablas.MARCOS)) Then
                Throw New Exception(mensajeExcepcion(tablas.MARCOS))
            Else
                Throw
            End If
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub eliminar(_man As Mano)
        cmd.CommandText = String.Format("DELETE MANOS WHERE ID={0}", _man.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            If ex.Message.ToLower.Contains(codigoError(tablas.MANOS)) Then
                Throw New Exception(mensajeExcepcion(tablas.MANOS))
            Else
                Throw
            End If
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(elementoBase As elementoBase)
        Throw New NotImplementedException()
    End Sub

    Friend Sub actualizar(_p As Pieza)
        cmd.CommandText = String.Format("UPDATE MATERIALES SET NOMBRE = '{0}', UNIDAD= '{1}', STOCK_DISPONIBLE = {2}, STOCK_MINIMO={3} WHERE ID={4}", _p.nombre, _p.unidad, _p.stock, _p.stockMinimo, _p.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(_madera As Madera)
        cmd.CommandText = String.Format("UPDATE MADERAS Set NOMBRE = '{0}' WHERE ID={1}", _madera.nombre, _madera.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(_linea As Linea)
        cmd.CommandText = String.Format("UPDATE LINEAS SET NOMBRE = '{0}' WHERE ID={1}", _linea.nombre, _linea.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(_ch As Chapa)
        cmd.CommandText = String.Format("UPDATE CHAPAS SET NOMBRE = '{0}' WHERE ID={1}", _ch.nombre, _ch.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(_hojas As Hoja)
        cmd.CommandText = String.Format("UPDATE HOJAS SET NOMBRE = '{0}' WHERE ID={1}", _hojas.nombre, _hojas.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(_marco As Marco)
        cmd.CommandText = String.Format("UPDATE MARCOS SET NOMBRE = '{0}' WHERE ID={1}", _marco.nombre, _marco.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizar(_mano As Mano)
        cmd.CommandText = String.Format("UPDATE MANOS SET NOMBRE = '{0}' WHERE ID={1}", _mano.nombre, _mano.id)
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    'Friend Function getExcluidas(_tabla As tablas, _id As Integer) As DataTable
    '    cmd.CommandText = String.Format("SELECT * FROM {0} WHERE ID <> {1}", _tabla, _id)
    '    cmd.CommandType = CommandType.Text

    '    Try
    '        da.Fill(ds, _tabla)
    '        Return ds.Tables(_tabla)
    '    Catch ex As Exception
    '        Throw
    '    End Try
    'End Function

    Friend Sub insertarPiezaProducto(_idProducto As Integer, _idPieza As Integer, _consumo As Decimal)
        Dim strConsumo = _consumo.ToString

        strConsumo = strConsumo.Replace(",", ".")
        Try
            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("INSERT INTO DESPIECE VALUES({0}, {1}, {2})", _idProducto, _idPieza, strConsumo)

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub actualizarDespiece(_idProducto As Integer, _idPieza As Integer, _consumo As Decimal)
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_UPDATE_DESPIECE"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@ID_PROD", _idProducto)
            cmd.Parameters.AddWithValue("@ID_PIEZA", _idPieza)
            cmd.Parameters.AddWithValue("@CONSUMO", _consumo)

            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS:    " & ex.Message)
        Finally
            cnn.Close()
        End Try
    End Sub

    Sub New()
        cnn = New SqlConnection(conStr)
        cmd = New SqlCommand()
        cmd.Connection = cnn
        da = New SqlDataAdapter(cmd)
        ds = New DataSet()
    End Sub

    Friend Function getReporte(_pedido As Pedido, _tipo As GestorDatos.reportes, Optional _stock As Integer = 0) As DataTable
        Dim query As String
        query = ""
        cmd.CommandType = CommandType.Text

        If _tipo = GestorDatos.reportes.remito Then
            query = "SELECT * FROM VW_REMITOS WHERE PEDIDO=" & _pedido.id.ToString
        ElseIf _tipo = GestorDatos.reportes.ordenTrabajo Then
            query = "SELECT * FROM VW_ORDENES WHERE PEDIDO=" & _pedido.id.ToString
        ElseIf _tipo = GestorDatos.reportes.etiquetaDeposito Then
            query = "SELECT * FROM VW_ETIQUETAS WHERE ID_ESTADO <> 7 AND ID=" & _pedido.id.ToString
        ElseIf _tipo = GestorDatos.reportes.etiquetaDepositoUnica Then
            query = "SELECT * FROM VW_ETIQUETAS_SIMPLE WHERE ID=" & _pedido.id.ToString
        ElseIf GestorDatos.reportes.etiquetaDepositoInterna Then
            query = "SELECT * FROM VW_ETIQUETAS_INTERNAS WHERE ID=" & _pedido.id.ToString
        ElseIf _tipo = GestorDatos.reportes.etiquetaDepositoStock Then
            query = "SELECT * FROM VW_ETIQUETAS_STOCK WHERE ID=" & _pedido.id.ToString
        End If

        cmd.CommandText = query

        Try
            da.Fill(ds, "REMITO")

            If _tipo = GestorDatos.reportes.etiquetaDeposito Then
                Try
                    cmd.CommandType = CommandType.Text

                    cnn.Open()
                    For Each i As Item In _pedido.items
                        cmd.CommandText = "UPDATE ITEMS SET P_IMPRIMIR=0 WHERE ID=" & i.id.ToString
                        cmd.ExecuteNonQuery()
                    Next

                Catch ex As Exception
                    Throw
                Finally
                    cnn.Close()
                End Try
            End If

            Return ds.Tables("REMITO")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS:  " & ex.Message)
        End Try
    End Function

    Public Function getReporte(ids As String()) As DataTable
        Dim query As String
        Dim i = 0

        query = "SELECT * FROM VW_ETIQUETAS_SIMPLE WHERE ID_ITEM IN ("

        For Each s As String In ids
            query += s
            query += ","
            i += 1
        Next

        If query.EndsWith(",") Then
            query = query.Substring(0, query.Length - 1)
        End If

        query += ")"

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "ETIQUETAS")
            Return ds.Tables("ETIQUETAS")

        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS:  " & ex.Message)
        End Try

    End Function

    Friend Sub eliminarMaterial(_id As Integer)
        Try
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "DELETE FROM MATERIALES WHERE ID=" & _id

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertMaterial(_nombre As String, _unidad As String)
        Try
            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("INSERT INTO MATERIALES (NOMBRE, UNIDAD) VALUES ('{0}', '{1}')", _nombre, _unidad)

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try

    End Sub

    Public Function getTable() As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SELECT * FROM " & table
            da.Fill(ds, table)
            Return ds.Tables(table)

        Catch ex As SqlException
            Throw
        End Try
    End Function

    Friend Function getPedidosModificar() As DataTable

        Dim query = "SELECT * FROM VW_PEDIDOS_MODIFICAR"
        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PEDIDOS_MODIFICAR")
            Return ds.Tables("PEDIDOS_MODIFICAR")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Friend Function getRegistro(_p As Producto) As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("SELECT * FROM REGISTRO_PRODUCTOS WHERE COD_PRODUCTO={0} ORDER BY FECHA DESC", _p.codigo)
            da.Fill(ds, "REGISTRO")

            Return ds.Tables("REGISTRO")
        Catch ex As SqlException
            Throw
        End Try
    End Function

    Friend Function getRegistro(_p As Pieza) As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("SELECT * FROM REGISTRO_MATERIALES WHERE COD_PIEZA={0} ORDER BY FECHA DESC", _p.id)
            da.Fill(ds, "REGISTRO")

            Return ds.Tables("REGISTRO")
        Catch ex As SqlException
            Throw
        End Try
    End Function

    Public Function getRow(ByVal index As Integer) As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SELECT * FROM " & table & " WHERE ID=" & index.ToString()
            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Friend Sub actualizarCliente(_cliente As Cliente)
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_UPDATE_CLIENTE"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@ID", _cliente.id)
            cmd.Parameters.AddWithValue("@NOMBRE", _cliente.nombre)
            cmd.Parameters.AddWithValue("@TELEFONO", _cliente.tel)
            cmd.Parameters.AddWithValue("@MAIL", _cliente.mail)
            cmd.Parameters.AddWithValue("@DIRECCION", _cliente.direccion)
            cmd.Parameters.AddWithValue("@CIUDAD", _cliente.ciudad)
            cmd.Parameters.AddWithValue("@PROVINCIA", _cliente.provincia)
            cmd.Parameters.AddWithValue("@CUIT", _cliente.CUIT)

            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS:    " & ex.Message)
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Function buscarPedidos(_idLinea As Object, _idChapa As Object, _idHoja As Object, _idMarco As Object, _idMadera As Object, _idMano As Object) As DataTable
        Dim query = "SELECT ID, LINEA, CHAPA, HOJA, MARCO, MADERA, MANO, PRECIO, STOCK FROM VW_PRODUCTOS WHERE "
        Dim firstParam = True

        'LINEA
        If _idLinea <> 0 Then
            If Not firstParam Then
                query = query + " AND "
            End If

            query = query & "ID_LINEA=" & _idLinea.ToString()
            firstParam = False
        End If

        'CHAPA
        If _idChapa <> "" Then
            If Not firstParam Then
                query = query + " AND "
            End If
            query = query & "ID_CHAPA=" & _idChapa.ToString()
            firstParam = False
        End If

        'HOJA
        If _idHoja <> "" Then
            If Not firstParam Then
                query = query + " AND "
            End If
            query = query & "ID_HOJA=" & _idHoja.ToString()
        End If

        'MARCO
        If _idMarco <> "" Then
            If Not firstParam Then
                query = query + " AND "
            End If
            query = query & "ID_MARCO=" & _idMarco.ToString
            firstParam = False
        End If

        'MADERA
        If _idMadera <> "" Then
            If Not firstParam Then
                query = query + " AND "
            End If
            query = query & "ID_MADERA=" & _idMadera.ToString
            firstParam = False
        End If

        'MANO
        If _idMano <> "" Then
            If Not firstParam Then
                query = query + " AND "
            End If
            query = query & "ID_MANO=" & _idMano.ToString
            firstParam = False
        End If

        cmd.Connection = cnn
        cmd.CommandText = query
        Try
            da.Fill(ds, "PRODUCTOS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try

        Return ds.Tables("PRODUCTOS")

    End Function

    Friend Function getPiezas() As DataTable
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT * FROM MATERIALES"

        Try
            da.Fill(ds, "MATERIALES")
            Return ds.Tables("MATERIALES")
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Sub insertar(base As elementoBase)

    End Sub

    Public Function insertar(_prod As Producto) As Integer()
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_INSERT_PRODUCTO"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@ID_LINEA", _prod.linea.id)
            cmd.Parameters.AddWithValue("@ID_CHAPA", _prod.chapa.id)
            cmd.Parameters.AddWithValue("@ID_HOJA", _prod.hoja.id)
            cmd.Parameters.AddWithValue("@ID_MARCO", _prod.marco.id)
            cmd.Parameters.AddWithValue("@ID_MADERA", _prod.madera.id)
            cmd.Parameters.AddWithValue("@ID_MANO", _prod.mano.id)
            cmd.Parameters.AddWithValue("@PRECIO", _prod.precioUnitario)

            cnn.Open()
            Dim id = cmd.ExecuteScalar()

            cmd.CommandText = "SELECT MAX(COD) FROM PRODUCTOS"
            cmd.CommandType = CommandType.Text
            Dim cod = cmd.ExecuteScalar()

            Return {id, cod}
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Function

    Public Function insertar(_pieza As Pieza) As DataTable
        Try
            Dim query = String.Format("INSERT INTO MATERIALES (nombre, UNIDAD, STOCK_MINIMO) VALUES ('{0}', '{1}', {2})", _pieza.nombre, _pieza.unidad, _pieza.stockMinimo)

            cmd.CommandType = CommandType.Text
            cmd.CommandText = query
            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Function

    Friend Sub insertar(_cliente As Cliente)
        Try
            String.Format("SELECT COUNT(CUIT) FROM CLIENTES WHERE CUIT={0}", _cliente.CUIT)
            cmd.Connection = cnn
            cmd.CommandText = String.Format("SELECT NOMBRE FROM CLIENTES WHERE CUIT='{0}'", _cliente.CUIT)
            cmd.CommandType = CommandType.Text

            Dim dt = New DataTable

            da.Fill(dt)

            If dt.Rows.Count > 0 Then
                Throw New Exception(String.Format("El CUIT ya existe para el cliente {0}", dt(0)(0)))
            Else

                cmd.CommandText = "SP_INSERT_CLIENTE"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@NOMBRE", _cliente.nombre)
                cmd.Parameters.AddWithValue("@TELEFONO", _cliente.tel)
                cmd.Parameters.AddWithValue("@MAIL", _cliente.mail)
                cmd.Parameters.AddWithValue("@DIRECCION", _cliente.direccion)
                cmd.Parameters.AddWithValue("@CIUDAD", _cliente.ciudad)
                cmd.Parameters.AddWithValue("@PROVINCIA", _cliente.provincia)
                cmd.Parameters.AddWithValue("@CUIT", _cliente.CUIT)

                cnn.Open()
                cmd.ExecuteNonQuery()
            End If

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS:    " & ex.Message)
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertar(_linea As Linea)
        Try
            Dim query = String.Format("INSERT INTO LINEAS (nombre) VALUES ('{0}')", _linea.nombre)

            cmd.CommandType = CommandType.Text
            cmd.CommandText = query

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertar(_chapa As Chapa)
        Try

            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("INSERT INTO MATERIALES (nombre, UNIDAD, ES_LINEA) VALUES ('{0}', 'TON', 1)", _chapa.nombre)

            cnn.Open()
            cmd.ExecuteNonQuery()

            cmd.CommandText = "SELECT MAX(ID) FROM MATERIALES"
            Dim idMat = cmd.ExecuteScalar()

            cmd.CommandText = String.Format("INSERT INTO CHAPAS (nombre, cod_mat) VALUES ('{0}', {1})", _chapa.nombre, idMat)
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertar(_hoja As Hoja)
        Try
            Dim query = String.Format("INSERT INTO HOJAS (nombre) VALUES ('{0}')", _hoja.nombre)

            cmd.CommandType = CommandType.Text
            cmd.CommandText = query

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertar(_marco As Marco)
        Try
            Dim query = String.Format("INSERT INTO MARCOS (nombre) VALUES ('{0}')", _marco.nombre)

            cmd.CommandType = CommandType.Text
            cmd.CommandText = query

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertar(_madera As Madera)
        Try
            cmd.CommandType = CommandType.Text
            cmd.CommandText = String.Format("INSERT INTO MATERIALES (nombre, UNIDAD, ES_LINEA) VALUES ('{0}', 'HOJA', 1)", _madera.nombre)

            cnn.Open()
            cmd.ExecuteNonQuery()

            cmd.CommandText = "SELECT MAX(ID) FROM MATERIALES"
            Dim idMat = cmd.ExecuteScalar()

            cmd.CommandText = String.Format("INSERT INTO MADERAS (nombre, cod_mat) VALUES ('{0}', {1})", _madera.nombre, idMat)
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub insertar(_mano As Mano)
        Try
            Dim query = String.Format("INSERT INTO MANOS (nombre) VALUES ('{0}')", _mano.nombre)

            cmd.CommandType = CommandType.Text
            cmd.CommandText = query

            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub consumirMateriales(_piezas As DataTable, _cant As Double, Optional _depo As Boolean = False)

        cmd.Connection = cnn
        cmd.CommandText = "SP_UPDATE_STOCK_MATERIAL"
        cmd.CommandType = CommandType.StoredProcedure

        Try
            cnn.Open()
            For Each r As DataRow In _piezas.Rows

                cmd.Parameters.Clear()
                If _depo Then
                    cmd.Parameters.AddWithValue("@DEPO", 1)
                Else
                    cmd.Parameters.AddWithValue("@DEPO", 0)
                End If

                cmd.Parameters.AddWithValue("@ID_PIEZA", r("ID_PIEZA"))
                cmd.Parameters.AddWithValue("@CONSUMO", r("consumo"))
                cmd.Parameters.AddWithValue("@CANT", _cant)

                cmd.ExecuteNonQuery()
            Next

        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Sub updateStock(_idItem As Integer, _stock As Integer)
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_UPDATE_STOCK"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@STOCK", _stock)
            cmd.Parameters.AddWithValue("@ID_ITEM", _idItem)

            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        Finally
            cnn.Close()
        End Try
    End Sub

    Public Sub updateMaterial(_idpieza As Integer, _cant As Decimal)
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_UPDATE_MATERIALES"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@ID_PIEZA", _idpieza)
            cmd.Parameters.AddWithValue("@CANT", _cant)

            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try

    End Sub

    Public Sub insertar(_item As Item)

        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_INSERT_ITEM"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@ID_PRODUCTO", _item.getProducto().id)
            cmd.Parameters.AddWithValue("@ID_PEDIDO", _item.idPedido)
            cmd.Parameters.AddWithValue("@CANT", _item.getCant())
            cmd.Parameters.AddWithValue("@MONTO", _item.monto)
            cmd.Parameters.AddWithValue("@STOCK", _item.stock)

            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Public Function insertar(_pedido As Pedido) As Integer

        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_INSERT_PEDIDO"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@CLIENTE", _pedido.cliente.id)
            cmd.Parameters.AddWithValue("@CANT", _pedido.cantTotal)
            cmd.Parameters.AddWithValue("@PRECIO", _pedido.precioTotal)

            cnn.Open()

            Dim idPedido As Integer

            idPedido = cmd.ExecuteScalar()

            Dim qrRemito As New SqlClient.SqlParameter("@QR_REMITO", SqlDbType.Image)
            qrRemito.Value = generarQR("URL:http://192.168.43.100/Pedido/recepcionQR?idpedido=" & idPedido)

            Dim qrPedido As New SqlClient.SqlParameter("@QR_PEDIDO", SqlDbType.Image)
            qrPedido.Value = generarQR("URL:http://192.168.43.100/Pedido/redireccionQR?idPedido= " & idPedido)

            cmd.Parameters.Clear()
            cmd.Parameters.Add(qrPedido)
            cmd.Parameters.Add(qrRemito)

            cmd.CommandType = CommandType.Text
            cmd.CommandText = "UPDATE PEDIDOS SET QR_REMITO=@QR_REMITO, QR_PEDIDO=@QR_PEDIDO WHERE ID=" & idPedido
            cmd.ExecuteNonQuery()

            Return idPedido

        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
        End Try
    End Function

    Public Sub insertDespiece(_idProducto As Integer, _despiece As DataTable)
        cmd.CommandType = CommandType.Text
        cnn.Open()

        Try
            For Each r As DataRow In _despiece.Rows
                Dim query = String.Format("INSERT INTO DESPIECE VALUES ({0}, {1}, {2}, 1)", _idProducto, r("ID_PIEZA"), r("CONSUMO"))
                cmd.CommandText = query
                cmd.ExecuteNonQuery()
            Next
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Function getItemsBusqueda(_idPedido As Integer) As DataTable
        Dim query = "SELECT * FROM VW_ITEMS WHERE ID_PEDIDO=" & _idPedido

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "ITEMS")
            Return ds.Tables("ITEMS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getRange(ByVal _column As String, ByVal _value As String) As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandText = String.Format("SELECT * FROM {0} WHERE {1}={2}", table, _column, _value)
            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getItems(_pedido As Integer, _estado As Estado, Optional _stock As Boolean = False) As DataTable
        Try
            cmd.Connection = cnn

            If _stock Then
                cmd.CommandText = "SP_ITEMS_PEDIDO_ESTADO_STOCK"
            Else
                cmd.CommandText = "SP_ITEMS_PEDIDO_ESTADO"
            End If


            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@ID_PEDIDO", _pedido)
            cmd.Parameters.AddWithValue("@ID_ESTADO", _estado.id)

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getItems(_pedido As Integer, _estado As Estado) As DataTable
        Try
            cmd.Connection = cnn

            cmd.CommandText = "SELECT * FROM VW_PEDIDOS WHERE ID_ESTADO=" & _estado.id
            cmd.CommandType = CommandType.Text

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw
        End Try
    End Function

    Public Function getItems(_pedido As Integer, Optional _enCurso As Boolean = False) As DataTable
        Try
            cmd.Connection = cnn
            If _enCurso Then
                cmd.CommandText = "SP_ITEMS_PEDIDO_ENCURSO"
            End If

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@ID_PEDIDO", _pedido)

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getItems(_pedido As Integer) As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandText = String.Format("SELECT * FROM VW_ITEMS WHERE ID_PEDIDO={0} AND ID_ESTADO <> 7", _pedido)
            cmd.CommandType = CommandType.Text

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getItems(_pedido As Integer, _tipo As tipoItem) As DataTable
        Dim query = String.Format("SELECT * FROM VW_ITEMS WHERE ID_PEDIDO={0} AND ID_ESTADO <> 7", _pedido)

        If _tipo = tipoItem.enviarProd Then
            query += " AND ID_ESTADO = 0"
        Else
            _tipo = tipoItem.detalle
            query = query.Replace(" AND ID_ESTADO <> 7", "")
        End If

        Try
            cmd.Connection = cnn
            cmd.CommandText = query
            cmd.CommandType = CommandType.Text

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getItemsModificar(_pedido As Integer) As DataTable
        Try
            cmd.Connection = cnn

            cmd.CommandText = "SP_ITEMS_PEDIDO_MODIFICAR"

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@idPedido", _pedido)

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function buscarPedidos(ByVal _nroPedido As Integer, _fecRecDesde As Date, ByVal _fecRecHasta As Date, _fecModDesde As Date,
                                  ByVal _fecModHasta As Date, ByVal _cliente As Object, ByVal _estado As Object) As DataTable
        Dim dt = New DataTable
        Dim query = "SELECT * FROM VW_PEDIDOS_TODOS where "
        Dim firstParam = True
        'NUMERO DE PEDIDO
        If _nroPedido Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & "id=" & _nroPedido.ToString
            firstParam = False
        End If

        'CLIENTE
        If Not IsNothing(_cliente) Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & "id_cliente=" & _cliente.ToString
            firstParam = False
        End If

        'ESTADO
        If Not IsNothing(_estado) Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & "id_estado = " & _estado
            firstParam = False
        Else
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & "id_estado not in (5, 6, 7)" 'estado no cancelado, entregado
            firstParam = False
        End If

        'FECHA RECEPCION PEDIDO
        If _fecRecDesde <> Date.MinValue And _fecRecHasta <> Date.MinValue Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & " fecha_recibido BETWEEN '" & _fecRecDesde & "' AND '" & _fecRecHasta & "'"
            firstParam = False

        ElseIf _fecRecHasta <> Date.MinValue Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & " fecha_recibido <= '" & _fecRecHasta & "'"
            firstParam = False

        ElseIf _fecRecDesde <> Date.MinValue Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & " fecha_recibido >= '" & _fecRecDesde & "'"
            firstParam = False
        End If

        'FECHA ULTIMA MODIFICACION
        If _fecModDesde <> Date.MinValue And _fecModHasta <> Date.MinValue Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & " fecha_modificado BETWEEN '" & _fecModDesde & "' AND '" & _fecModHasta & "'"
            firstParam = False

        ElseIf _fecModHasta <> Date.MinValue Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & " fecha_modificado <= '" & _fecModHasta & "'"
            firstParam = False

        ElseIf _fecModDesde <> Date.MinValue Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & " fecha_modificado >= '" & _fecModDesde & "'"
            firstParam = False
        End If

        cmd.Connection = cnn
        cmd.CommandText = query
        Try
            da.Fill(ds, table)
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try

        Return ds.Tables("pedidos")
    End Function

    Public Sub actualizar(_item As Item)
        Dim strPrecio = _item.monto.ToString()

        strPrecio = strPrecio.Replace(",", ".")


        cmd.Connection = cnn
        cmd.CommandText = "SP_UPDATE_ITEM"
        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.AddWithValue("@ID_ITEM", _item.id)
        cmd.Parameters.AddWithValue("@ID_PRODUCTO", _item.getProducto().id)
        cmd.Parameters.AddWithValue("@CANT", _item.getCant)
        cmd.Parameters.AddWithValue("@MONTO", _item.monto)
        cmd.Parameters.AddWithValue("@ID_ESTADO", _item.getEstado().id)
        cmd.Parameters.AddWithValue("@MARCO_TER", _item.marcosTerminados)
        cmd.Parameters.AddWithValue("@HOJA_TER", _item.hojasTerminadas)
        cmd.Parameters.AddWithValue("@ENSAMBLADO", _item.getEnsamblados())
        cmd.Parameters.AddWithValue("@EN_DEPOSITO", _item.getEnDeposito())

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        Finally
            cnn.Close()
        End Try
    End Sub

    Public Sub actualizar(_pedido As Pedido)
        Dim strPrecio = _pedido.precioTotal.ToString()

        strPrecio = strPrecio.Replace(",", ".")


        cmd.Connection = cnn
        cmd.CommandText = "SP_UPDATE_PEDIDO"
        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@ID_PEDIDO", _pedido.id)
        cmd.Parameters.AddWithValue("@ID_CLIENTE", _pedido.cliente.id)
        cmd.Parameters.AddWithValue("@CANT_TOTAL", _pedido.cantTotal)
        cmd.Parameters.AddWithValue("@PRECIO_TOTAL", strPrecio)
        cmd.Parameters.AddWithValue("@ID_ESTADO", _pedido.estado.id)

        If _pedido.entregado <> Date.MinValue Then
            cmd.Parameters.AddWithValue("@FECHA_ENTREGADO", _pedido.entregado)
        End If

        Try
            cnn.Open()
            cmd.ExecuteNonQuery()

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        Finally
            cnn.Close()
        End Try
    End Sub

    Public Function actualizar(_producto As Producto, Optional _CopiarDesp As Boolean = True) As Integer
        CIEN()
        Dim ret As Integer
        Try
            cnn.Open()
            cmd.Connection = cnn
            If _producto.updateStock Then

                cmd.CommandText = String.Format("UPDATE PRODUCTOS SET STOCK={0} WHERE ID={1}", _producto.stock, _producto.id)
                cmd.CommandType = CommandType.Text
                cmd.ExecuteScalar()
                ret = _producto.id
            End If

            If _producto.modificado Then

                cmd.CommandText = "SP_UPDATE_PRODUCTO"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@ID_PRODUCTO", _producto.id)
                cmd.Parameters.AddWithValue("@ID_LINEA", _producto.linea.id)
                cmd.Parameters.AddWithValue("@ID_CHAPA", _producto.chapa.id)
                cmd.Parameters.AddWithValue("@ID_HOJA", _producto.hoja.id)
                cmd.Parameters.AddWithValue("@ID_MARCO", _producto.marco.id)
                cmd.Parameters.AddWithValue("@ID_MADERA", _producto.madera.id)
                cmd.Parameters.AddWithValue("@ID_MANO", _producto.mano.id)
                cmd.Parameters.AddWithValue("@PRECIO", _producto.precioUnitario)
                If Not _CopiarDesp Then
                    cmd.Parameters.AddWithValue("@DESP", 0)
                End If

                ret = cmd.ExecuteScalar()
            End If

            Return ret

        Catch ex As SqlException
            Throw
        Finally
            cnn.Close()
            CIES()
        End Try
    End Function

    Public Function getStock(ByVal _idHoja As Integer, ByVal _idMarco As Integer, ByVal _idMadera As Integer, ByVal _idChapa As Integer, ByVal _idMano As Integer, ByVal _idLinea As Integer) As DataTable

        Try
            cmd.Connection = cnn
            cmd.CommandText = "sp_getStock"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@idHoja", _idHoja)
            cmd.Parameters.AddWithValue("@idMarco", _idMarco)
            cmd.Parameters.AddWithValue("@idMadera", _idMadera)
            cmd.Parameters.AddWithValue("@idChapa", _idChapa)
            cmd.Parameters.AddWithValue("@idMano", _idMano)
            cmd.Parameters.AddWithValue("@idLinea", _idLinea)

            da.Fill(ds, table)

            Return ds.Tables(table)
        Catch ex As SqlException
            Throw
        End Try
    End Function

    Friend Function getItemsEnsamblados(_id As Integer) As DataTable
        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_ITEMS_PEDIDO_ENSAMBLADOS"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@ID_PEDIDO", _id)

            da.Fill(ds, "ENSAMBLADOS")

            Return ds.Tables("ENSAMBLADOS")
        Catch ex As SqlException
            Throw
        End Try
    End Function

    Public Function fillCombo(_spName As String, _IdLinea As Integer) As DataTable
        Try
            ds = New DataSet()
            cmd.Connection = cnn
            cmd.CommandText = _spName
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@LINEA", _IdLinea)

            da.Fill(ds, "tabla_combos")

            Return ds.Tables("tabla_combos")
        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS:    " & ex.Message)
        End Try
    End Function

    Public Function getProducto(_id As Integer) As DataTable
        ds = New DataSet

        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_GET_PRODUCTO_POR_ID"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@ID", _id)

            da.Fill(ds, "RESULTADO")
            Return ds.Tables("RESULTADO")

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getDespiece(_idProducto As Integer) As DataTable

        ds = New DataSet

        cmd.Connection = cnn
        cmd.CommandText = "SP_DESPIECE_PRODUCTO"
        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@ID_PROD", _idProducto)

        Try
            da.Fill(ds, "RESULTADO")
            Return ds.Tables("RESULTADO")

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getDespiece(_pedido As Pedido, _recalc As Boolean) As DataTable
        ds = New DataSet

        cmd.Connection = cnn
        cmd.CommandType = CommandType.StoredProcedure

        If _recalc Then
            cmd.CommandText = "SP_ITEM_STOCK_TEMP"

            Try
                cnn.Open()

                For Each i As Item In _pedido.items
                    cmd.Parameters.Clear()
                    cmd.Parameters.AddWithValue("@ID_ITEM", i.id)
                    cmd.Parameters.AddWithValue("@STOCK", i.stock)
                    cmd.ExecuteNonQuery()
                Next
                cmd.CommandText = "SP_DESPIECE_PRODUCTO_RECALC"
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@ID_PEDIDO", _pedido.id)

                da.Fill(ds, "RESULTADO")
                Return ds.Tables("RESULTADO")

            Catch ex As Exception
                Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
            Finally
                cnn.Close()
            End Try

        Else
            Try
                cmd.CommandText = "SP_DESPIECE_PEDIDO"

                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@ID_PEDIDO", _pedido.id)
                da.Fill(ds, "RESULTADO")
                Return ds.Tables("RESULTADO")
            Catch ex As Exception
                Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
            End Try
        End If

    End Function

    Public Function getDespiece(_prod As Producto) As DataTable

        ds = New DataSet

        cmd.Connection = cnn
        cmd.CommandText = "SP_GET_MATERIALES"
        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@ID_CHAPA", _prod.chapa.id)
        cmd.Parameters.AddWithValue("@ID_MADERA", _prod.madera.id)

        Try
            da.Fill(ds, "RESULTADO")
            Return ds.Tables("RESULTADO")

        Catch ex As SqlException
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function buscar(_cliente As Cliente) As DataTable
        Dim query = "SELECT * FROM CLIENTES WHERE "
        Dim firstParam = True

        If _cliente.ciudad <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("CIUDAD LIKE '%{0}%'", _cliente.ciudad)
            firstParam = False
        End If

        If _cliente.CUIT <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("CUIT LIKE '%{0}%'", _cliente.CUIT)
            firstParam = False
        End If

        If _cliente.direccion <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("DIRECCION LIKE '%{0}%'", _cliente.direccion)
            firstParam = False
        End If

        If _cliente.mail <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("MAIL LIKE '%{0}%'", _cliente.mail)
            firstParam = False
        End If

        If _cliente.nombre <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("NOMBRE LIKE '%{0}%'", _cliente.nombre)
            firstParam = False
        End If

        If _cliente.provincia <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("PROVINCIA LIKE '%{0}%'", _cliente.provincia)
            firstParam = False
        End If

        If _cliente.tel <> "" Then
            If Not firstParam Then
                query = query & " AND "
            End If
            query = query & String.Format("TELEFONO LIKE '%{0}%'", _cliente.tel)
            firstParam = False
        End If

        'ELIMINA WHERE SI NO SE PASARON PARAMETROS
        If firstParam Then
            query = query.Replace(" WHERE ", "")
        End If

        cmd.CommandText = query

        Try
            da.Fill(ds, table)
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try

        Return ds.Tables("CLIENTES")
    End Function

    Public Function getRegistroItem(_idItem As Integer) As DataTable
        Dim query = "SELECT FECHA, ENTRADA FROM REGISTRO_ITEMS WHERE ID_ITEM=" & _idItem

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "REGISTRO_ITEMS")
            Return ds.Tables("REGISTRO_ITEMS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getRegistroPedido(_idPedido As Integer) As DataTable
        Dim query = "SELECT FECHA, ENTRADA FROM REGISTRO_PEDIDOS WHERE ID_PEDIDO=" & _idPedido

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "REGISTRO_PEDIDOS")
            Return ds.Tables("REGISTRO_PEDIDOS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getProductos(_l As Linea, Optional todos As Boolean = False) As DataTable
        Dim query As String

        If Not todos Then
            query = String.Format("SELECT CHAPA, HOJA, MARCO, MADERA, ID_CHAPA, ID_HOJA, ID_MARCO, ID_MADERA FROM VW_PRODUCTOS WHERE ID_LINEA={0} GROUP BY CHAPA, HOJA, MADERA, MARCO, ID_CHAPA, ID_HOJA, ID_MARCO, ID_MADERA ORDER BY ID_MADERA, ID_HOJA, ID_MARCO, ID_CHAPA", _l.id)
        End If


        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PRODUCTOS")
            Return ds.Tables("PRODUCTOS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getProductos(_pieza As Pieza) As DataTable
        Dim query = String.Format("SELECT ID, COD, LINEA, CHAPA, HOJA, MARCO, MADERA, MANO, D.CONSUMO from VW_PRODUCTOS P INNER JOIN DESPIECE D ON P.id=D.ID_PROD WHERE D.ID_PIEZA = {0} ORDER BY COD", _pieza.id)

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PRODUCTOS")
            Return ds.Tables("PRODUCTOS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function getProductos() As DataTable
        Dim query = "SELECT * FROM VW_PRODUCTOS ORDER BY COD"

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PRODUCTOS")
            Return ds.Tables("PRODUCTOS")
        Catch ex As Exception
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Function

    Public Function buscar(_producto As Producto) As DataTable
        ds = New DataSet

        Try
            cmd.Connection = cnn
            cmd.CommandText = "SP_GET_PRODUCTO"
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@LINEA", _producto.linea.id)
            cmd.Parameters.AddWithValue("@CHAPA", _producto.chapa.id)
            cmd.Parameters.AddWithValue("@HOJA", _producto.hoja.id)
            cmd.Parameters.AddWithValue("@MARCO", _producto.marco.id)
            cmd.Parameters.AddWithValue("@MADERA", _producto.madera.id)
            cmd.Parameters.AddWithValue("@MANO", _producto.mano.id)

            da.Fill(ds, "RESULTADO")
            Return ds.Tables("RESULTADO")

        Catch ex As SqlException
            Throw
        End Try
    End Function

    Public Function existeProducto(_prod As Producto, Optional modProd As Boolean = True) As Integer
        CIEN()
        Dim query As String

        'para validar si existe un producto similar al modificar productos
        If modProd Then
            query = String.Format("SELECT ID FROM PRODUCTOS WHERE idLinea = {0} AND IDCHAPA={1} AND IDHOJA={2} AND IDMARCO={3} AND IDMADERA={4} AND IDMANO={5} AND PRECIO={6} AND ID<>{7} AND VALIDO_HASTA IS NULL", _prod.linea.id, _prod.chapa.id, _prod.hoja.id, _prod.marco.id, _prod.madera.id, _prod.mano.id, _prod.precioUnitario, _prod.id)
        Else
            'para validar si existe un prod similar al hacer un producto nuevo
            query = String.Format("SELECT ID FROM PRODUCTOS WHERE idLinea = {0} AND IDCHAPA={1} AND IDHOJA={2} AND IDMARCO={3} AND IDMADERA={4} AND IDMANO={5} AND VALIDO_HASTA IS NULL", _prod.linea.id, _prod.chapa.id, _prod.hoja.id, _prod.marco.id, _prod.madera.id, _prod.mano.id)
        End If

        cmd.Connection = cnn
        cmd.CommandType = CommandType.Text
        cmd.CommandText = query
        Try
            cnn.Open()
            Return cmd.ExecuteScalar()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
            CIES()
        End Try
    End Function

    Public Function getPedidos() As DataTable
        Dim query = "SELECT * FROM VW_PEDIDOS_EN_CURSO"

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PEDIDOS")
            Return ds.Tables("PEDIDOS")
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function

    Public Function getPedidos(_prod As Producto) As DataTable
        Dim query = "select * from vw_PEDIDOS_en_curso P
                        inner join items I ON P.ID=I.ID_PEDIDO
                        INNER JOIN PRODUCTOS PR ON I.ID_PRODUCTO = PR.ID
                        WHERE PR.COD=" & _prod.codigo

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PEDIDOS")
            Return ds.Tables("PEDIDOS")
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function

    Private Function codigoError(tipo As tablas) As String
        'Select Case tipo
        '    Case tablas.CHAPAS
        '        Return "fk_productos_chapas"
        '    Case tablas.HOJAS
        '        Return "fk_productos_hojas"
        '    Case tablas.LINEAS
        '        Return "fk_productos_lineas"
        '    Case tablas.MADERAS
        '        Return "fk_productos_maderas"
        '    Case tablas.MANOS
        '        Return "fk_productos_manos"
        '    Case tablas.MARCOS
        '        Return "fk_productos_marcos"
        'End Select

        Return "reference 'fk"

    End Function

    Private Function mensajeExcepcion(tipo As tablas) As String
        Dim estaEste As String
        Dim borr As String
        Dim asoc As String
        Dim strTipo = tipo.ToString

        If tipo = tablas.MARCOS Then
            estaEste = "ESTE"
            asoc = "ASOCIADO"
            borr = "BORRADO"
        Else
            estaEste = "ESTA"
            asoc = "ASOCIADA"
            borr = "BORRADA"
        End If

        Return String.Format("{0} {1} ESTA {2} A PRODUCTOS EXISTENTES Y NO PUEDE SER {3}", estaEste, strTipo.Substring(0, strTipo.Length - 1), asoc, borr)

    End Function

    Public Function generarQR(str As String) As Byte()
        Dim ms As New IO.MemoryStream
        Dim gen As New QRCodeGenerator
        Dim data = gen.CreateQrCode(str, QRCodeGenerator.ECCLevel.Q)
        Dim code As New QRCode(data)
        Dim img As Image
        img = code.GetGraphic(20)
        img.Save(ms, Imaging.ImageFormat.Jpeg)

        Return ms.GetBuffer

    End Function

    Public Sub codigosQMasivo()
        Dim query = "SELECT ID FROM PEDIDOS"

        cmd.CommandType = CommandType.Text
        cmd.CommandText = query

        Try
            da.Fill(ds, "PEDIDOS")

            cnn.Open()

            For Each r As DataRow In ds.Tables("PEDIDOS").Rows
                Dim idPedido As Integer
                idPedido = r("id")

                cmd.Parameters.Clear()

                Dim qrRemito As New SqlClient.SqlParameter("@QR_REMITO", SqlDbType.Image)
                qrRemito.Value = generarQR("URL:http://192.168.43.100/Pedido/recepcionQR?idpedido=" & idPedido)

                Dim qrPedido As New SqlClient.SqlParameter("@QR_PEDIDO", SqlDbType.Image)
                qrPedido.Value = generarQR("URL:http://192.168.43.100/Pedido/redireccionQR?idPedido= " & idPedido)

                cmd.Parameters.Add(qrPedido)
                cmd.Parameters.Add(qrRemito)

                cmd.CommandText = "UPDATE PEDIDOS SET QR_REMITO=@QR_REMITO, QR_PEDIDO=@QR_PEDIDO WHERE ID=" & idPedido
                cmd.ExecuteNonQuery()
            Next
        Catch ex As Exception
            cnn.Close()
            Throw New Exception("ERROR DE BASE DE DATOS: " & ex.Message)
        End Try
    End Sub
End Class