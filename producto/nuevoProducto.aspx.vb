Public Class producto1
    Inherits System.Web.UI.Page
    Dim sb As StatusBar
    Dim gp As GestorProductos
    Dim gd As New GestorDatos


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)

        If IsPostBack Then
        Else
            llenargrilla()
        End If

    End Sub

    Private Sub llenargrilla()
        Try
            grMateriales.DataSource = gd.getPiezas()
            grMateriales.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            Dim dt As New DataTable
            Dim idHoja As Integer = DPFiltroHoja.SelectedValue
            Dim idMarco As Integer = DPFiltroMarco.SelectedValue
            Dim idMadera As Integer = DPFiltroMadera.SelectedValue
            Dim idchapa As Integer = DPFiltroChapa.SelectedValue
            Dim idMano As Integer = DPFiltroMadera.SelectedValue
            Dim idLinea As Integer = DPFiltroLinea.SelectedValue

            Dim hoja As New Hoja(idHoja)
            Dim marco As New Marco(idMarco)
            Dim madera As New Madera(idMadera)
            Dim chapa As New Chapa(idchapa)
            Dim mano As New Mano(idMano)
            Dim linea As New Linea(idLinea)
            Dim precio As Decimal = txtPrecio.Text.Trim
            Dim gp As New GestorProductos(hoja, marco, madera, chapa, mano, linea, precio)

            dt.Columns.Add("ID_PIEZA", GetType(Integer))
            dt.Columns.Add("CONSUMO", GetType(Decimal))

            For Each r As GridViewRow In grMateriales.Rows
                Dim txt As New TextBox
                Dim dtr = dt.NewRow()

                txt = r.FindControl("txtConsumo")
                Dim cod = grMateriales.DataKeys(r.RowIndex).Value
                Dim val = txt.Text
                If txt.Text.Trim <> "" AndAlso txt.Text.Trim <> 0 Then
                    dtr("ID_PIEZA") = grMateriales.DataKeys(r.RowIndex).Value
                    dtr("CONSUMO") = txt.Text.Trim

                    dt.Rows.Add(dtr)
                End If
            Next

            gp.producto.despiece = dt
            gp.insertar()
            sb.write("Nuevo producto guardado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class