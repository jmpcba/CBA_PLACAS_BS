Imports System.Data
Public Class Usuario
    Private _id As String
    Private _mail As String
    Private _rol As String
    Private _rolid As String
    Private db As DB
    Private modificado As Boolean
    Public Sub New(id As String)
        Dim dt As New DataTable
        db = New DB(DB.conStrings.usuarios)
        Me._id = id

        dt = db.ejecutarSelect(String.Format("SELECT R.name, R.id, S.Email from AspNetRoles R
                                inner join AspNetUserRoles U on U.RoleId=R.Id
                                inner join AspNetUsers S on S.Id=u.UserId where u.UserId = '{0}'", Me.id))
        Me._rol = dt(0)("name")
        Me._rolid = dt(0)("Id")
        Me._mail = dt(0)("email")
        modificado = False
    End Sub

    Public Property id As String
        Get
            Return _id
        End Get
        Set(value As String)
            _id = value
            modificado = True
        End Set
    End Property

    Public Property mail As String
        Set(value As String)
            _mail = value
            modificado = True
        End Set
        Get
            Return _mail
        End Get
    End Property

    Public Property rol As String
        Get
            Return _rol
        End Get
        Set(value As String)
            _rol = value
            modificado = True
        End Set
    End Property

    Public Property rolid As String
        Set(value As String)
            _rolid = value
            modificado = True
        End Set
        Get
            Return _rolid
        End Get
    End Property

    Friend Sub actualizar()
        If modificado Then
            Dim db As New DB(DB.conStrings.usuarios)
            Dim query As New List(Of String)
            query.Add(String.Format("UPDATE AspNetUsers SET email={0}, username={0} WHERE ID={1}", mail, id))
            query.Add(String.Format("UPDATE AspNetUserRoles SET ROLEID={0} WHERE ID={1}", rolid, id))

            Try
                db.ejecutarNonQueryMultiple(query)
            Catch ex As Exception
                Throw
            End Try
        Else
            Throw New Exception("No se realizaron cambios")
        End If
    End Sub
End Class
