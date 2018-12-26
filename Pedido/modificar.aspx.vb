Public Class modificar
    Inherits System.Web.UI.Page

    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)
        'pnlDetalle.Visible = False
        'pnlAgregar.Visible = False
        'btnAgregar.Visible = True

        If Not IsPostBack Then
            'gd.getComboLineas(cbLinea)
            llenarGrillaPedido()
        End If
    End Sub

    Private Sub llenarGrillaPedido()
        grPedidos.DataSource = gd.getGrilla(GestorDatos.grillas.pedidosModificar)
        grPedidos.DataBind()
    End Sub
End Class