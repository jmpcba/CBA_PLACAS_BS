Public Class clientes
    Inherits System.Web.UI.Page
    Dim sb As StatusBar
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sb = New StatusBar(HFMsg, lblMessage)

        If IsPostBack Then
        Else
            Dim provincias = {"Buenos Aires", "Catamarca", "Chaco", "Chubut", "Cordoba", "Corrientes",
                          "Entre Ríos", "Formosa", "Jujuy", "La Pampa", "La Rioja", "Mendoza",
                          "Misiones", "Neuquén", "Río Negro", "Salta", "San Juan", "Santa Cruz",
                          "Santa Fe", "Santiago del Estero", "Tierra del Fuego", "Tucumán"}
            dpProv.DataSource = provincias
            dpFiltroProv.DataSource = provincias
            dpProv.DataBind()
            dpFiltroProv.DataBind()
        End If
    End Sub

    Private Sub llenarGrillaClientes()

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click

        Dim cliente = New Cliente(txtCuit.Text.Trim, txtNombre.Text.Trim, txtTel.Text.Trim, txtMail.Text.Trim, txtDir.Text.Trim, txtCiudad.Text.Trim, dpProv.SelectedValue)

        Try
            cliente.insertar()
            sb.write("Nuevo Cliente ingresado")
            grClientes.DataBind()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class