Public Class _Default
    Inherits Page

    Dim gd As New GestorDatos
    Dim SB As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)
        Dim matCriticos As Integer
        Try
            Dim dt As New DataTable
            dt = gd.getPedidos()
            Dim dvNuevos As New DataView
            dvNuevos = dt.DefaultView

            dvNuevos.RowFilter = "ID_ESTADO=0"
            lblnvos.Text = dvNuevos.Count

            dvNuevos.RowFilter = "ID_ESTADO IN (1,2)"
            lblProd.Text = dvNuevos.Count

            dvNuevos.RowFilter = "ID_ESTADO >=3"
            lblDepo.Text = dvNuevos.Count
            matCriticos = gd.materialesCriticos
            lblMat.Text = matCriticos

            If matCriticos > 0 Then
                HFMateriales.Value = "1"
            Else
                HFMateriales.Value = "0"
            End If

        Catch ex As Exception
            SB.writeError(ex.Message)
        End Try

    End Sub
End Class