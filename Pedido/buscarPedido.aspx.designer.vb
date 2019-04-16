'------------------------------------------------------------------------------
' <generado automáticamente>
'     Este código fue generado por una herramienta.
'
'     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
'     se vuelve a generar el código. 
' </generado automáticamente>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Partial Public Class buscarPedido
    
    '''<summary>
    '''Control HFPostback.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents HFPostback As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control lblMessage.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblMessage As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control HFMsg.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents HFMsg As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control txtNroPedido.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNroPedido As Global.System.Web.UI.WebControls.TextBox
    
    '''<summary>
    '''Control RegularExpressionValidator1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents RegularExpressionValidator1 As Global.System.Web.UI.WebControls.RegularExpressionValidator
    
    '''<summary>
    '''Control dpCliente.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents dpCliente As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control DSCliente.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DSCliente As Global.System.Web.UI.WebControls.SqlDataSource
    
    '''<summary>
    '''Control dpEstado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents dpEstado As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control DSEstado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DSEstado As Global.System.Web.UI.WebControls.SqlDataSource
    
    '''<summary>
    '''Control txtFecRecDesde.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecRecDesde As Global.System.Web.UI.WebControls.TextBox
    
    '''<summary>
    '''Control txtFecRecDesde_MaskedEditExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecRecDesde_MaskedEditExtender As Global.AjaxControlToolkit.MaskedEditExtender
    
    '''<summary>
    '''Control txtFecRecDesde_CalendarExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecRecDesde_CalendarExtender As Global.AjaxControlToolkit.CalendarExtender
    
    '''<summary>
    '''Control CVFecRecDesde.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents CVFecRecDesde As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control txtFecRecHasta.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecRecHasta As Global.System.Web.UI.WebControls.TextBox
    
    '''<summary>
    '''Control txtFecRecHasta_MaskedEditExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecRecHasta_MaskedEditExtender As Global.AjaxControlToolkit.MaskedEditExtender
    
    '''<summary>
    '''Control txtFecRecHasta_CalendarExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecRecHasta_CalendarExtender As Global.AjaxControlToolkit.CalendarExtender
    
    '''<summary>
    '''Control CompareValidator1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents CompareValidator1 As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control CompareValidator4.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents CompareValidator4 As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control txtFecModDesde.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecModDesde As Global.System.Web.UI.WebControls.TextBox
    
    '''<summary>
    '''Control txtFecModDesde_MaskedEditExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecModDesde_MaskedEditExtender As Global.AjaxControlToolkit.MaskedEditExtender
    
    '''<summary>
    '''Control txtFecModDesde_CalendarExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecModDesde_CalendarExtender As Global.AjaxControlToolkit.CalendarExtender
    
    '''<summary>
    '''Control CompareValidator2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents CompareValidator2 As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control txtFecModHasta.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecModHasta As Global.System.Web.UI.WebControls.TextBox
    
    '''<summary>
    '''Control txtFecModHasta_MaskedEditExtender.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecModHasta_MaskedEditExtender As Global.AjaxControlToolkit.MaskedEditExtender
    
    '''<summary>
    '''Control txtFecModHasta_CalendarExtender2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFecModHasta_CalendarExtender2 As Global.AjaxControlToolkit.CalendarExtender
    
    '''<summary>
    '''Control CompareValidator3.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents CompareValidator3 As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control CompareValidator5.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents CompareValidator5 As Global.System.Web.UI.WebControls.CompareValidator
    
    '''<summary>
    '''Control btnBuscar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnBuscar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control pnlResultado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlResultado As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control grNuevos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grNuevos As Global.System.Web.UI.WebControls.GridView
End Class
