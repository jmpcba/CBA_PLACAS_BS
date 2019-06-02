Imports System.Data.SqlClient
Imports System.Data
Public Class DB

    Private cnn As SqlConnection
    Private cmd As SqlCommand
    Private da As SqlDataAdapter
    Private ds As DataSet
    Private conStr As String
    Private CI As System.Globalization.CultureInfo = System.Threading.Thread.CurrentThread.CurrentCulture

    Public Sub New(_tipo As conStrings)
        If _tipo = conStrings.usuarios Then
            Me.conStr = ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString
        Else
            Me.conStr = ConfigurationManager.ConnectionStrings("cbaPlacasConnectionString1").ConnectionString
        End If

        cnn = New SqlConnection(conStr)
        cmd = New SqlCommand()
        da = New SqlDataAdapter(cmd)
        ds = New DataSet()
        cmd.Connection = cnn
    End Sub

    Public Enum conStrings
        usuarios
        datos
    End Enum

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

    Public Sub ejecutarNonQueryMultiple(SQL As List(Of String))
        cmd.CommandType = CommandType.Text
        Try
            cnn.Open()
            For Each S In SQL
                cmd.CommandText = S
                cmd.ExecuteNonQuery()
            Next
        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try
    End Sub

    Friend Function ejecutarScalar(query As String) As Integer
        Dim re As Integer
        Try
            cmd.CommandType = CommandType.Text
            cmd.CommandText = query
            cnn.Open()
            re = cmd.ExecuteScalar()

        Catch ex As Exception
            Throw
        Finally
            cnn.Close()
        End Try

        Return re

    End Function
End Class
