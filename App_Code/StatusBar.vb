Public Class StatusBar
    Private hf As HiddenField
    Private lbl As Label

    Public Sub New(_hf As HiddenField, _lbl As Label)
        hf = _hf
        hf.Value = ""
        lbl = _lbl
    End Sub

    Public Sub write(_msg As String)
        lbl.Text = _msg
        hf.Value = "success"
    End Sub

    Public Sub writeError(_msg As String)
        lbl.Text = _msg
        hf.Value = "error"
    End Sub
End Class
