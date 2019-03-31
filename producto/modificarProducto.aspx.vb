Public Class modificarProducto
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar
    Dim gp As GestorProductos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        HFEliminar.Value = 0

        If Not IsPostBack Then
            Dim idProducto = Request.QueryString("idProducto")

            If IsNothing(idProducto) Then
                Response.Redirect("productos.aspx")
            Else
                ViewState("idProducto") = idProducto
                llenarGrillaDetalle()
                sb.write(String.Format("Carga de datos Producto {0} - EXITOSA", gp.producto.codigo))
            End If
        End If
    End Sub

    Private Sub llenarGrillaDetalle()
        Dim idProducto As Integer
        Dim despiece As New DataTable
        Dim piezas As New DataTable

        Try
            idProducto = ViewState("idProducto")

            'refrescar el objeto pedidos desde la DB
            gp = New GestorProductos(idProducto)
            despiece = gp.producto.despiece()
            piezas = gd.getPiezas()

            lblSubtitulo.Text = String.Format("Detalles Producto: {0}", gp.producto.codigo)
            lblLinea.Text = gp.producto.linea.nombre
            lblChapa.Text = gp.producto.chapa.nombre
            lblMadera.Text = gp.producto.madera.nombre
            lblHoja.Text = gp.producto.hoja.nombre
            lblMarco.Text = gp.producto.marco.nombre
            lblMano.Text = gp.producto.mano.nombre
            lblPrecio.Text = "$" & gp.producto.precioUnitario
            lblStock.Text = gp.producto.stock

            DPLinea.SelectedValue = gp.producto.linea.id
            DPChapa.SelectedValue = gp.producto.chapa.id
            DPMadera.SelectedValue = gp.producto.madera.id
            DPMarco.SelectedValue = gp.producto.marco.id
            DPHoja.SelectedValue = gp.producto.hoja.id
            DPMano.SelectedValue = gp.producto.mano.id
            txtPrecio.Text = gp.producto.precioUnitario
            txtStock.Text = gp.producto.stock

            grMateriales.DataSource = despiece
            grModMateriales.DataSource = piezas

            grMateriales.DataBind()
            grModMateriales.DataBind()

            For Each r As GridViewRow In grModMateriales.Rows
                Dim txt As TextBox
                Dim idPieza As Integer
                Dim sel As DataRow()
                idPieza = grModMateriales.DataKeys(r.RowIndex).Value
                txt = r.FindControl("txtConsumo")

                sel = despiece.Select("ID_PIEZA=" & idPieza)

                If sel.Length = 0 Then
                    txt.Text = 0
                Else
                    txt.Text = sel(0)("CONSUMO")
                    r.Style.Add(HtmlTextWriterStyle.FontWeight, "Bold")
                End If
            Next
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim idProducto = ViewState("idProducto")

        gp = New GestorProductos(idProducto)

        If DPLinea.SelectedValue <> gp.producto.linea.id Then
            Dim idLinea As Integer
            idLinea = DPLinea.SelectedValue
            gp.producto.linea = New Linea(idLinea)
        End If

        If DPChapa.SelectedValue <> gp.producto.chapa.id Then
            Dim id As Integer
            id = DPChapa.SelectedValue
            gp.producto.chapa = New Chapa(id)
        End If

        If DPMadera.SelectedValue <> gp.producto.madera.id Then
            Dim id As Integer
            id = DPMadera.SelectedValue
            gp.producto.madera = New Madera(id)
        End If

        If DPMarco.SelectedValue <> gp.producto.marco.id Then
            Dim id As Integer
            id = DPMarco.SelectedValue
            gp.producto.marco = New Marco(id)
        End If

        If DPHoja.SelectedValue <> gp.producto.hoja.id Then
            Dim id As Integer
            id = DPHoja.SelectedValue
            gp.producto.hoja = New Hoja(id)
        End If

        If DPMano.SelectedValue <> gp.producto.mano.id Then
            Dim id As Integer
            id = DPMano.SelectedValue
            gp.producto.mano = New Mano(id)
        End If

        If txtPrecio.Text.Trim <> gp.producto.precioUnitario Then
            gp.producto.precioUnitario = txtPrecio.Text.Trim
        End If

        If txtStock.Text.Trim <> gp.producto.stock Then
            gp.producto.stock = txtStock.Text.Trim
        End If

        Try
            gp.modificar()
            ViewState("idProducto") = gp.producto.id
            sb.write("Producto Modificado")
            llenarGrillaDetalle()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs) Handles btnVolver.Click
        Response.Redirect("productos.aspx")
    End Sub

    Protected Sub btnRefrescarDetalle_Click(sender As Object, e As EventArgs) Handles btnRefrescarDetalle.Click
        Response.Redirect(Request.RawUrl)
    End Sub

    Protected Sub btnEliminarProd_Click(sender As Object, e As EventArgs) Handles btnEliminarProd.Click
        Dim idProd As Integer
        idProd = ViewState("idProducto")
        gp = New GestorProductos(idProd)

        Try
            gp.eliminarProducto()
            HFEliminar.Value = 1
            sb.write("Producto eliminado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub aUndo_Click(sender As Object, e As EventArgs) Handles aUndo.Click
        Dim idProd As Integer
        idProd = ViewState("idProducto")
        gp = New GestorProductos(idProd)

        Try
            gp.reActivarProducto()
            sb.write("Producto reactivado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnModMat_Click(sender As Object, e As EventArgs) Handles btnModMat.Click
        Dim dt As New DataTable
        dt.Columns.Add("ID_PIEZA", GetType(Integer))
        dt.Columns.Add("CONSUMO", GetType(Decimal))

        gp = New GestorProductos(ViewState("idProducto"))

        For Each r As GridViewRow In grModMateriales.Rows
            Dim txt As TextBox
            Dim idPieza As Integer
            Dim f As DataRow = dt.NewRow()
            Dim consumo As Decimal
            txt = r.FindControl("txtConsumo")
            idPieza = grModMateriales.DataKeys(r.RowIndex).Value
            consumo = txt.Text.Trim

            f("ID_PIEZA") = idPieza
            f("CONSUMO") = consumo
            dt.Rows.Add(f)
        Next

        Try
            gp.actualizarDespiece(dt)
            ViewState("idProducto") = gp.producto.id
            llenarGrillaDetalle()
            sb.write("Despiece Modificado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnUPHidden_Click(sender As Object, e As EventArgs) Handles btnUPHidden.Click
        Try
            gp = New GestorProductos(ViewState("idProducto"))
            grPedidos.DataSource = gd.getPedidos(gp.producto)
            grPedidos.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub grPedidos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grPedidos.SelectedIndexChanged

    End Sub

    Protected Sub btnHistorial_Click(sender As Object, e As EventArgs) Handles btnHistorial.Click
        Try
            gp = New GestorProductos(ViewState("idProducto"))
            grHistorial.DataSource = gd.getRegistro(gp.producto)
            grHistorial.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class