Public Class productos1
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim i = 0
        For Each r As DataRow In gd.getLineas.Rows
            Dim pnlLinea As New panelLinea
            Dim idLinea As Integer
            idLinea = r("id")
            pnlLinea = LoadControl("panelLinea.ascx")
            pnlLinea.titulo = r("NOMBRE")
            pnlLinea.posicionAcordeon = i
            pnlLinea.productos = gd.getProductos(idLinea)
            pnlAcordeon.Controls.Add(pnlLinea)
            i += 1
        Next
    End Sub

End Class