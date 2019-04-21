Imports System.Data.SqlClient
Imports System.Data
Public Class DB

    Private cnn As SqlConnection
    Private cmd As SqlCommand
    Private da As SqlDataAdapter
    Private ds As DataSet
    Private conStr As String
    Private CI As System.Globalization.CultureInfo = System.Threading.Thread.CurrentThread.CurrentCulture

    Public Sub New(conStr As String)
        Me.conStr = conStr
        cnn = New SqlConnection(conStr)
        cmd = New SqlCommand()
        da = New SqlDataAdapter(cmd)
        ds = New DataSet()
        cmd.Connection = cnn
    End Sub

    Public Function ejecutarSelect(SQL As String) As DataTable
        cmd.CommandText = SQL
        cmd.CommandType = CommandType.Text

        Try
            da.Fill(ds, "RESULTADO")
            Return ds.Tables("RESULTADO")
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Sub ejecutarNonQuery(SQL As String)
        cmd.CommandType = CommandType.Text
        cmd.CommandText = SQL
        Try
            cnn.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub
End Class
