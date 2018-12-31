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


Partial Public Class modificar
    
    '''<summary>
    '''Control HFEstado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents HFEstado As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control HFAgregar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents HFAgregar As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control HFIdPedido.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents HFIdPedido As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control HFIsPostBack.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents HFIsPostBack As Global.System.Web.UI.WebControls.HiddenField
    
    '''<summary>
    '''Control lblSubtitulo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblSubtitulo As Global.System.Web.UI.WebControls.Label
    
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
    '''Control pnlPedidos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlPedidos As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control DPFiltroEstados.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DPFiltroEstados As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control DSestados.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DSestados As Global.System.Web.UI.WebControls.SqlDataSource
    
    '''<summary>
    '''Control DPFiltroClientes.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DPFiltroClientes As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control SqlDataSource2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlDataSource2 As Global.System.Web.UI.WebControls.SqlDataSource
    
    '''<summary>
    '''Control Button1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Button1 As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control grPedidos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grPedidos As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control SqlDataSource1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlDataSource1 As Global.System.Web.UI.WebControls.SqlDataSource
    
    '''<summary>
    '''Control pnlDetalle.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlDetalle As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control btnVolver.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnVolver As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control btnRefrescar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnRefrescar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control grDetalle.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grDetalle As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control lblnroPedidoDet.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblnroPedidoDet As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control lblClienteDet.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblClienteDet As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control lblEstadoDet.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblEstadoDet As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control lblCantDet.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblCantDet As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control lblRecibidoDet.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblRecibidoDet As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control lblModificadoDet.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblModificadoDet As Global.System.Web.UI.WebControls.Label
    
    '''<summary>
    '''Control grProduccion.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grProduccion As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control grLog.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grLog As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control btnEliminar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnEliminar As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control btnEliminarItems.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnEliminarItems As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control grEliminarItems.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grEliminarItems As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control grModificarItems.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents grModificarItems As Global.System.Web.UI.WebControls.GridView
    
    '''<summary>
    '''Control btnModificarItems.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnModificarItems As Global.System.Web.UI.WebControls.Button
    
    '''<summary>
    '''Control cbLinea.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cbLinea As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control pnlCombos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlCombos As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control cbChapa.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cbChapa As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control cbMarco.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cbMarco As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control cbMadera.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cbMadera As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control cbHoja.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cbHoja As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control cbMano.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cbMano As Global.System.Web.UI.WebControls.DropDownList
    
    '''<summary>
    '''Control txtCant.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtCant As Global.System.Web.UI.WebControls.TextBox
    
    '''<summary>
    '''Control rgvCant.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents rgvCant As Global.System.Web.UI.WebControls.RegularExpressionValidator
    
    '''<summary>
    '''Control RequiredFieldValidator2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents RequiredFieldValidator2 As Global.System.Web.UI.WebControls.RequiredFieldValidator
    
    '''<summary>
    '''Control pnlValidacion.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlValidacion As Global.System.Web.UI.WebControls.Panel
    
    '''<summary>
    '''Control ValidationSummary1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ValidationSummary1 As Global.System.Web.UI.WebControls.ValidationSummary
    
    '''<summary>
    '''Control btnGuardar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnGuardar As Global.System.Web.UI.WebControls.Button
End Class
