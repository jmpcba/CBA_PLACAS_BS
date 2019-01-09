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
End Class