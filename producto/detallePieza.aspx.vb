Public Class detallePieza
    Inherits System.Web.UI.Page
    Dim gd As GestorDatos
    Dim sb As StatusBar
    Dim p As Pieza
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        HFEliminar.Value = 0

        If Not IsPostBack Then
            Dim idPieza = Request.QueryString("idPieza")

            If IsNothing(idPieza) Then
                Response.Redirect("materiales.aspx")
            Else
                ViewState("idPieza") = idPieza
                llenarGrillaDetalle()
                sb.write(String.Format("Carga de datos Pieza {0} - EXITOSA", p.id))
            End If
        End If
    End Sub

    Private Sub llenarGrillaDetalle()
        Try
            Dim idPieza As Integer
            idPieza = ViewState("idPieza")
            p = New Pieza(idPieza)

            lblCodigo.Text = p.id
            lblNombre.Text = p.nombre
            lblUnidad.Text = p.unidad
            lblStock.Text = p.stock
            txtStock.Text = p.stock
            txtStockMin.Text = p.stockMinimo
            txtModNombre.Text = p.nombre
            txtModUnidad.Text = p.unidad
            lblModUnidad.Text = p.unidad
            lblStockMin.Text = p.stockMinimo

            grProductos.DataSource = gd.getProductos(p)
            grProductos.DataBind()
            grHistorial.DataSource = gd.getRegistro(p)
            grHistorial.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardarStock.Click
        Try
            Dim idPieza As Integer
            idPieza = ViewState("idPieza")
            p = New Pieza(idPieza)

            If p.stock <> txtStock.Text.Trim Then
                p.actualizarStock(txtStock.Text.Trim, txtMotivo.text.trim)
                p.actualizar()
            End If

            llenarGrillaDetalle()
            sb.write("Pieza actualizada")

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnModDet_Click(sender As Object, e As EventArgs) Handles btnModDet.Click
        Try
            Dim idPieza As Integer
            idPieza = ViewState("idPieza")
            p = New Pieza(idPieza)

            If p.nombre <> txtModNombre.Text.Trim Then
                p.nombre = txtModNombre.Text.Trim.ToUpper
            End If

            If p.unidad <> txtModUnidad.Text.Trim Then
                p.unidad = txtModUnidad.Text.Trim.ToUpper
            End If

            If p.stockMinimo <> txtStockMin.Text.Trim Then
                p.stockMinimo = txtStockMin.Text.Trim
            End If

            p.actualizar()
            llenarGrillaDetalle()
            sb.write("Pieza actualizada")

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnEliminarPieza_Click(sender As Object, e As EventArgs) Handles btnEliminarPieza.Click
        Dim idPieza As Integer
        idPieza = ViewState("idPieza")
        p = New Pieza(idPieza)

        Try
            p.eliminar()
            HFEliminar.Value = 1
            llenarGrillaDetalle()
            sb.write("Pieza eliminada")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub grProductos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grProductos.SelectedIndexChanged
        Dim idProducto As Integer
        idProducto = grProductos.SelectedDataKey.Value
        Response.Redirect("detalleProducto.aspx?idProducto=" & idProducto)
    End Sub
End Class