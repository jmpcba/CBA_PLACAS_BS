Public Class ExcepcionProducto
    Inherits Exception
    Public codProd As Integer

    Public Sub New(ByVal msg As String, _codProd As Integer)
        MyBase.New(msg)
        codProd = _codProd
    End Sub
End Class
