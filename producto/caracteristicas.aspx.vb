Public Class caracteristicas
    Inherits System.Web.UI.Page

    Dim gd As GestorDatos
    Dim gp As GestorPedidos
    Dim sb As StatusBar

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim nvoNombre As String
        Dim tipo = HFTipo.Value
        Dim msg = " Nuevo "
        Dim finMsg = "o"

        nvoNombre = txtNombre.Text.Trim

        If tipo = "Madera" Or tipo = "Linea" Or tipo = "Hoja" Or tipo = "Chapa" Then
            msg = "Nueva "
            finMsg = "a"
        End If

        Try
            If tipo = "Chapa" Then

                Dim chapa = New Chapa(nvoNombre)
                chapa.insertar()
            ElseIf tipo = "Madera" Then
                Dim madera = New Madera(nvoNombre)
                madera.insertar()
            ElseIf tipo = "Hoja" Then
                Dim hoja = New Hoja(nvoNombre)
                hoja.insertar()
            ElseIf tipo = "Marco" Then
                Dim marco = New Marco(nvoNombre)
                marco.insertar()
            ElseIf tipo = "Mano" Then
                Dim mano = New Mano(nvoNombre)
                mano.insertar()
            End If

            iniciarGrillas()
            sb.write(msg & tipo & " agregad" & finMsg)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Private Sub iniciarGrillas()
        grLineas.DataBind()
        grChapas.DataBind()
        grMaderas.DataBind()
        grHojas.DataBind()
        grMarco.DataBind()
        GRManos.DataBind()
    End Sub
End Class