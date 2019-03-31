Public Class producto1
    Inherits System.Web.UI.Page
    Dim sb As StatusBar
    Dim gp As GestorProductos
    Dim gd As New GestorDatos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)
        llenargrilla()
    End Sub

    Private Sub llenargrilla()
        Try
            grMateriales.DataSource = gd.getPiezas()
            grMateriales.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class