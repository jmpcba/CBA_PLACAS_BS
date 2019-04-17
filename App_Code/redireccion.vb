Module redireccion
    Public Function redireccionarPedido(_idPedido As Integer) As String
        Dim url As String = ""

        If HttpContext.Current.User.IsInRole("ADMINISTRACION") Or HttpContext.Current.User.IsInRole("GERENCIA") Then
            url = "modificarDetalle.aspx?idPedido="
        ElseIf HttpContext.Current.User.IsInRole("ENCARGADO") Then
            url = "administrar.aspx?idPedido="
        End If

        If url <> "" Then
            url += _idPedido.ToString
            Return url
        Else
            Throw New Exception("El usuario no tiene un rol asignado")
        End If
    End Function
End Module
