Imports System.Data
Public Class Usuario
    Public id As String
    Public mail As String
    Public rol As String
    Public rolid As String
    Private db As DB
    Public Sub New(id As String)
        Dim dt As New DataTable
        db = New DB(ConfigurationManager.ConnectionStrings("DefaultConnection").ConnectionString)
        Me.id = id

        dt = db.ejecutarSelect("SELECT R.name, R.id, S.Email from AspNetRoles R
                                inner join AspNetUserRoles U on U.RoleId=R.Id
                                inner join AspNetUsers S on S.Id=u.UserId where u.UserId = '{0}'" & Me.id)
        Me.rol = dt(0)("name")
        Me.rolid = dt(0)("UserId")
        Me.mail = dt(0)("mail")
    End Sub
End Class
