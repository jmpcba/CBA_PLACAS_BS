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

    Protected Sub btnGuardarModificar_Click(sender As Object, e As EventArgs) Handles btnGuardarModificar.Click
        Dim id As Integer
        id = cbChapas.SelectedValue
        Try
            Dim chapa As New Chapa(id)
            chapa.nombre = txtModChapa.Text.Trim.ToUpper
            chapa.actualizar
            grChapas.DataBind()
            sb.write("Chapa actualizada")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnGuardarMadera_Click(sender As Object, e As EventArgs) Handles btnGuardarMadera.Click
        Dim id As Integer
        id = cbMadera.SelectedValue
        Try
            Dim madera As New Madera(id)
            madera.nombre = txtModMadera.Text.Trim.ToUpper
            madera.actualizar()
            grMaderas.DataBind()
            sb.write("Madera actualizada")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnModHojas_Click(sender As Object, e As EventArgs) Handles btnModHojas.Click
        Dim id As Integer
        id = cbHojas.SelectedValue
        Try
            Dim hojas As New Hoja(id)
            hojas.nombre = txtModHojas.Text.Trim.ToUpper
            hojas.actualizar()
            grHojas.DataBind()
            sb.write("Hoja actualizada")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnMarcos_Click(sender As Object, e As EventArgs) Handles btnMarcos.Click
        Dim id As Integer
        id = cbMarcos.SelectedValue
        Try
            Dim marco As New Marco(id)
            marco.nombre = txtMarcos.Text.Trim.ToUpper
            marco.actualizar()
            grMarco.DataBind()
            sb.write("Marco actualizado")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnManos_Click(sender As Object, e As EventArgs) Handles btnManos.Click
        Dim id As Integer
        id = cbManos.SelectedValue
        Try
            Dim mano As New Mano(id)
            mano.nombre = txtModManos.Text.Trim.ToUpper
            mano.actualizar()
            grMarco.DataBind()
            sb.write("Mano actualizada")
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class