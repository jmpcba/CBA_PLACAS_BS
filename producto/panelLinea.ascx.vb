Public Class panelLinea
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grProductos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grProductos.SelectedIndexChanged

    End Sub

    Public Property grilla As GridView
        Get
            Return grProductos
        End Get
        Set(value As GridView)
            grProductos = value
        End Set
    End Property

    Public Property titulo As String
        Set(value As String)
            lblTitulo.Text = value
        End Set
        Get
            Return lblTitulo.Text
        End Get
    End Property

    Public Property posicionAcordeon As Integer
        Set(value As Integer)
            HFPanel.Value = value
        End Set
        Get
            Return HFPanel.Value
        End Get
    End Property

    Public Property productos As DataTable
        Set(value As DataTable)
            grProductos.DataSource = value
            grProductos.DataBind()
        End Set
        Get
            Return grProductos.DataSource
        End Get
    End Property
End Class