Public Class tests
    Inherits System.Web.UI.Page
    Dim gd As New GestorDatos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim gp As New GestorPedidos(558)

        grModificarItems.DataSource = gd.getItemsModificar(gp.pedido.id)
        grModificarItems.DataBind()

    End Sub

    Sub llenar()
        For Each r As GridViewRow In grModificarItems.Rows
            Dim cbMadera As DropDownList
            Dim cbHoja As DropDownList
            Dim cbMarco As DropDownList
            Dim cbChapa As DropDownList
            Dim cbMano As DropDownList

            Dim idLinea = grModificarItems.DataKeys(r.RowIndex).Values(1)

            cbMadera = r.FindControl("cbMadera")
            cbHoja = r.FindControl("cbHoja")
            cbMarco = r.FindControl("cbMarco")
            cbChapa = r.FindControl("cbChapa")
            cbMano = r.FindControl("cbMano")

            gd.fillCombos(idLinea, cbChapa, cbMarco, cbMadera, cbHoja, cbMano)

        Next
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        llenar()
    End Sub
End Class