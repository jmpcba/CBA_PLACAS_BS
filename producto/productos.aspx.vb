Public Class productos1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim linea As New Linea()

        Dim i = 0
        For Each r As DataRow In linea.getLineas.Rows
            Dim pnlLinea As New panelLinea
            pnlLinea = LoadControl("panelLinea.ascx")
            pnlLinea.titulo = r("NOMBRE")
            pnlLinea.posicionAcordeon = i
            pnlAcordeon.Controls.Add(pnlLinea)
            i += 1
        Next
    End Sub

End Class