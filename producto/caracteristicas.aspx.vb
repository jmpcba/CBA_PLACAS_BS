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
            ElseIf tipo = "Linea" Then
                Dim linea As New Linea(nvoNombre)
                linea.insertar()
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

    Protected Sub btnUPHidden_Click(sender As Object, e As EventArgs) Handles btnUPHidden.Click
        Dim tipo = HFEliminar.Value

        Try
            If tipo = "Chapa" Then
                Dim ch As New Chapa
                cbEliminar.DataSource = ch.getChapas()
            ElseIf tipo = "Madera" Then
                Dim mad As New Madera
                cbEliminar.DataSource = mad.getMaderas()
            ElseIf tipo = "Hoja" Then
                Dim hoj As New Hoja
                cbEliminar.DataSource = hoj.getHojas()
            ElseIf tipo = "Marco" Then
                Dim mar As New Marco
                cbEliminar.DataSource = mar.getMarcos()
            ElseIf tipo = "Mano" Then
                Dim man As New Mano
                cbEliminar.DataSource = man.getManos()
            ElseIf tipo = "Linea" Then
                Dim linea As New Linea
                cbEliminar.DataSource = linea.getLineas()
            End If
            cbEliminar.DataTextField = "nombre"
            cbEliminar.DataValueField = "id"
            cbEliminar.DataBind()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnUPModificar_Click(sender As Object, e As EventArgs) Handles btnUPModificar.Click
        Dim tipo = HFModificar.Value

        Try
            If tipo = "Chapa" Then
                Dim ch As New Chapa
                cbModificar.DataSource = ch.getChapas()
            ElseIf tipo = "Madera" Then
                Dim mad As New Madera
                cbModificar.DataSource = mad.getMaderas()
            ElseIf tipo = "Hoja" Then
                Dim hoj As New Hoja
                cbModificar.DataSource = hoj.getHojas()
            ElseIf tipo = "Marco" Then
                Dim mar As New Marco
                cbModificar.DataSource = mar.getMarcos()
            ElseIf tipo = "Mano" Then
                Dim man As New Mano
                cbModificar.DataSource = man.getManos()
            ElseIf tipo = "Linea" Then
                Dim linea As New Linea
                cbModificar.DataSource = linea.getLineas()
            End If
            cbModificar.DataTextField = "nombre"
            cbModificar.DataValueField = "id"
            cbModificar.DataBind()

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnMod_Click(sender As Object, e As EventArgs) Handles btnMod.Click
        Dim id As Integer
        Dim tipo = HFModificar.Value
        Dim val = txtMod.Text.Trim.ToUpper
        Dim finMsg = "o"

        id = cbModificar.SelectedValue

        If tipo = "Madera" Or tipo = "Linea" Or tipo = "Hoja" Or tipo = "Chapa" Or tipo = "Mano" Then
            finMsg = "a"
        End If

        Try
            If tipo = "Chapa" Then
                Dim ch As New Chapa(id)
                ch.nombre = val
                ch.actualizar()
            ElseIf tipo = "Madera" Then
                Dim mad As New Madera(id)
                mad.nombre = val
                mad.actualizar()
            ElseIf tipo = "Hoja" Then
                Dim hoj As New Hoja(id)
                hoj.nombre = val
                hoj.actualizar()
            ElseIf tipo = "Marco" Then
                Dim mar As New Marco(id)
                mar.nombre = val
                mar.actualizar()
            ElseIf tipo = "Mano" Then
                Dim man As New Mano(id)
                man.nombre = val
                man.actualizar()
            ElseIf tipo = "Linea" Then
                Dim linea As New Linea(id)
                linea.nombre = val
                linea.actualizar
            End If

            iniciarGrillas()
            sb.write(tipo & " modificad" & finMsg)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try



    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        Dim id As Integer
        Dim tipo = HFEliminar.Value
        Dim val = txtMod.Text.Trim.ToUpper
        Dim finMsg = "o"

        id = cbEliminar.SelectedValue

        If tipo = "Madera" Or tipo = "Linea" Or tipo = "Hoja" Or tipo = "Chapa" Then
            finMsg = "a"
        End If

        Try
            If tipo = "Chapa" Then
                Dim ch As New Chapa(id)
                ch.eliminar()
            ElseIf tipo = "Madera" Then
                Dim mad As New Madera(id)
                mad.eliminar()
            ElseIf tipo = "Hoja" Then
                Dim hoj As New Hoja(id)
                hoj.eliminar()
            ElseIf tipo = "Marco" Then
                Dim mar As New Marco(id)
                mar.eliminar()
            ElseIf tipo = "Mano" Then
                Dim man As New Mano(id)
                man.eliminar()
            ElseIf tipo = "Linea" Then
                Dim lin As New Linea(id)
                lin.eliminar()
            End If

            iniciarGrillas()
            sb.write(tipo & " eliminad" & finMsg)
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class