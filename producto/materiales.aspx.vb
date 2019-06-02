Public Class materiales
    Inherits System.Web.UI.Page
    Dim sb As StatusBar
    Dim gd As GestorDatos
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        gd = New GestorDatos()
        sb = New StatusBar(HFMsg, lblMessage)

        If Not IsPostBack Then
            llenarGrilla()
        End If

    End Sub

    Private Sub llenarGrilla()
        Try
            Dim dt As New DataTable
            Dim rojas As New List(Of Integer)
            Dim i As Integer = 0
            dt = gd.getPiezas
            grMateriales.DataSource = dt
            grMateriales.DataBind()

            For Each r As DataRow In dt.Rows
                If r("STOCK_DISPONIBLE") < r("STOCK_MINIMO") Then
                    rojas.Add(i)
                End If
                i += 1
            Next

            For Each e In rojas
                grMateriales.Rows(e).ForeColor = Drawing.Color.Red
            Next

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    Protected Sub btnNvo_Click(sender As Object, e As EventArgs) Handles btnNvo.Click
        Try
            Dim p As New Pieza(txtNombre.Text.Trim.ToUpper, txtUnidad.Text.Trim.ToUpper, txtStockMin.Text.Trim)
            p.insertar()
            sb.write("Nueva pieza agregada a la lista de materiales")
            llenarGrilla()
        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()>
    Public Shared Function getUnidades(ByVal prefix As String, count As Integer) As List(Of String)
        Dim dt As New DataTable
        Dim gd = New GestorDatos
        Dim view As DataView
        Dim ddt As DataTable
        Dim ret As New List(Of String)

        dt = gd.getPiezas()
        view = New DataView(dt)
        ddt = view.ToTable(True, "UNIDAD")

        For Each r As DataRow In ddt.Rows
            ret.Add(r("UNIDAD"))
        Next

        Return ret

    End Function

    Protected Sub grMateriales_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grMateriales.SelectedIndexChanged
        Try
            Dim row = grMateriales.SelectedRow
            Dim idPieza = Convert.ToInt32(grMateriales.SelectedDataKey.Value)

            Response.Redirect("detallePieza.aspx?idPieza=" & idPieza)

        Catch ex As Exception
            sb.writeError(ex.Message)
        End Try
    End Sub
End Class