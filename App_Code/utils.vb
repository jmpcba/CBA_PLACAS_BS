Public Class utils
    Public Sub iniciarTextBox(_txtBoxes As TextBox())
        For Each t As TextBox In _txtBoxes
            t.Text = ""
        Next
    End Sub

    Public Sub iniciarLabels(_lbls As Label())
        For Each l As Label In _lbls
            l.Text = ""
        Next
    End Sub
End Class
