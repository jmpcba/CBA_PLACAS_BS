Public Class modificarProducto
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar
    Dim gp As GestorProductos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)

        If Not IsPostBack Then
            Dim idProducto = Request.QueryString("idProducto")

            If IsNothing(idProducto) Then
                Response.Redirect("productos.aspx")
            Else
                ViewState("idProducto") = idProducto
                llenarGrillaDetalle()

                lblSubtitulo.Text = String.Format("Detalles Producto: {0}", gp.producto.id)

                sb.write(String.Format("Carga de datos Producto {0} - EXITOSA", gp.producto.id))
            End If
        End If

    End Sub

    Private Sub llenarGrillaDetalle()
        Dim idProducto As Integer

        idProducto = ViewState("idProducto")

        'refrescar el objeto pedidos desde la DB
        gp = New GestorProductos(idProducto)

        lblCodido.Text = "PRODUCTO: " & gp.producto.id
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

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim idProducto = ViewState("idProducto")

        gp = New GestorProductos(idProducto)

        If DPLinea.SelectedValue <> gp.producto.linea.id Then
            gp.producto.linea.id = DPLinea.SelectedValue
        End If

        If DPChapa.SelectedValue <> gp.producto.chapa.id Then
            gp.producto.chapa.id = DPChapa.SelectedValue
        End If

        If DPMadera.SelectedValue <> gp.producto.madera.id Then
            gp.producto.madera.id = DPMadera.SelectedValue
        End If

        If DPMarco.SelectedValue <> gp.producto.marco.id Then
            gp.producto.marco.id = DPMarco.SelectedValue
        End If

        If DPHoja.SelectedValue <> gp.producto.hoja.id Then
            gp.producto.hoja.id = DPHoja.SelectedValue
        End If

        If DPMano.SelectedValue <> gp.producto.mano.id Then
            gp.producto.mano.id = DPMano.SelectedValue
        End If

        If txtPrecio.Text <> gp.producto.precioUnitario Then
            gp.producto.precioUnitario = txtPrecio.Text
        End If

        If txtStock.Text <> gp.producto.stock Then
            gp.producto.stock = txtStock.Text
        End If

        Try
            gp.modificar()
            sb.write("Producto Modificado")
            llenarGrillaDetalle()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class