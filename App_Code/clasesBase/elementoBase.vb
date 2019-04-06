Public MustInherit Class elementoBase
    Private _modificado As Boolean
    Dim _db As New DbHelper
    Public registro As New List(Of String)
    Private _id As Integer

    Public Sub New()
        _modificado = False
    End Sub

    Public ReadOnly Property modificado As Boolean
        Get
            Return _modificado
        End Get
    End Property

    Public Property id As Integer
        Set(value As Integer)
            _id = value
        End Set
        Get
            Return _id
        End Get
    End Property

    Public Sub insertar()
        Try
            db.insertar(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Sub actualizar()
        Try
            If modificado Then
                db.actualizar(Me)
            Else
                Throw New Exception("No se realizaron modificaciones")
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public ReadOnly Property DB As DbHelper
        Get
            Return New DbHelper
        End Get
    End Property
End Class
