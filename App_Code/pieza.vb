Public Class Pieza
    Inherits elementoBase

    Private _nombre As String
    Private _stockReservado As Decimal
    Private _stock As Decimal
    Private _unidad As String
    Public _modificado As Boolean

    Public Sub New()

    End Sub

    Public Sub New(_nombre As String, _unidad As String)
        MyBase.New()
        Me._nombre = _nombre
        Me._unidad = _unidad
        _modificado = False

    End Sub

    Public Property nombre As String
        Set(value As String)
            registro.Add(String.Format("NOMBRE ANTERIOR {0}, NUEVO {1}", _nombre, value))
            _nombre = value
            _modificado = True
        End Set
        Get
            Return _nombre
        End Get
    End Property

    Property unidad As String
        Set(value As String)
            _unidad = value
        End Set
        Get
            Return _unidad
        End Get
    End Property

    Public Property stock As Decimal
        Set(value As Decimal)
            _stock = value
        End Set
        Get
            Return _stock
        End Get
    End Property

    Public Overloads Sub insertar()
        Try
            registro.Clear()
            registro.Add("NUEVA PIEZA")
            DB.insertar(Me)
            DB.registrar(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Public Overloads Sub actualizar()
        Try
            DB.actualizar(Me)
            DB.registrar(Me)
        Catch ex As Exception
            Throw
        End Try
    End Sub
End Class
