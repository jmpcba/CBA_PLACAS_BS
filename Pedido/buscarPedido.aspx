<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="buscarPedido.aspx.vb" Inherits="CBA_PLACAS_BS.buscarPedido" Theme="default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //BARRA DE ESTADO
            var err = $("#" + '<%= HFMsg.ClientID %>').val();
            barraEstado(err, $("#msg"))

            //iniciar controles si es postback
            if ($("#" + '<%= HFPostback.ClientID %>').val() == 1) {
                var txtBoxes = [
                            $("#" + '<%= txtFecModDesde.ClientID %>'),
                            $("#" + '<%= txtFecModHasta.ClientID %>'),
                            $("#" + '<%= txtFecRecDesde.ClientID %>'),
                            $("#" + '<%= txtFecRecHasta.ClientID %>'),
                            $("#" + '<%= txtNroPedido.ClientID %>')
                ]

                var dropdowns = [
                                $("#" + '<%= dpCliente.ClientID %>'),
                                $("#" + '<%= dpEstado.ClientID %>')
                ]

                iniciarDropDowns(dropdowns)
                iniciarTextBoxes(txtBoxes)
            }
            $("#btnLimpiarFiltro").click(function () {
                iniciarDropDowns(dropdowns)
                iniciarTextBoxes(txtBoxes)
            })
        })
    </script>
    <asp:HiddenField ID="HFPostback" runat="server" Value="1" />
    <div class="page-header">
        <h1 class="text-center">
            BUSCAR<br /><small>
        Busqueda de pedidos</small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" Value="success" />
        </div>
    </div>
    <div class="row">
        <h4>General</h4>
    </div>
    <div class="row">
        <div class="col-md-3">
            <strong>Numero:</strong><br />
            <asp:TextBox ID="txtNroPedido" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="vgBuscar" ErrorMessage="Ingrese un numero entero" ControlToValidate="txtNroPedido" CssClass="validators">Ingrese un numero entero</asp:RegularExpressionValidator>
        </div>
        <div class="col-md-4">
            <strong>Cliente</strong><br />
            <asp:DropDownList ID="dpCliente" runat="server" DataSourceID="DSCliente" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="DSCliente" ConnectionString='<%$ ConnectionStrings:cbaPlacasConnectionString1 %>' SelectCommand="SELECT * FROM [CLIENTES]"></asp:SqlDataSource>
        </div>
        <div class="col-md-4">
            <strong>Estado</strong><br />
            <asp:DropDownList ID="dpEstado" runat="server" DataSourceID="DSEstado" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="DSEstado" ConnectionString='<%$ ConnectionStrings:cbaPlacasConnectionString1 %>' SelectCommand="SELECT * FROM [ESTADOS]"></asp:SqlDataSource>
        </div>
    </div>
    <hr />
    <div class="row">
        <h4>Fecha en que se recibio</h4>
    </div>
    <div class="row">
        <div class="col-md-3">
            <strong>Desde</strong><br />
            <asp:TextBox ID="txtFecRecDesde" runat="server" ValidationGroup="vgBuscar" ToolTip="Filtrar por fecha de recepcion"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender 
                ID="txtFecRecDesde_MaskedEditExtender" 
                runat="server" 
                TargetControlID="txtFecRecDesde"
                Mask="99/99/9999"
                Masktype="Date"
                BehaviorID="_content_txtFecRecDesde_MaskedEditExtender" 
                Century="2000" 
                CultureAMPMPlaceholder="" 
                CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" 
                CultureDatePlaceholder="" 
                CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" 
                CultureTimePlaceholder="" />
            <ajaxToolkit:CalendarExtender ID="txtFecRecDesde_CalendarExtender" runat="server" TargetControlID="txtFecRecDesde" format="dd/MM/yyyy" BehaviorID="_content_txtFecRecDesde_CalendarExtender"/>
            <asp:CompareValidator ID="CVFecRecDesde" runat="server" ErrorMessage="Fecha Invalida" Operator="DataTypeCheck" Type="Date" ControlToValidate="txtFecRecDesde" ValidationGroup="vgBuscar" CssClass="validators">Fecha Invalida</asp:CompareValidator>
        </div>
        <div class="col-md-3">
            <strong>Hasta</strong><br />
            <asp:TextBox ID="txtFecRecHasta" runat="server" ValidationGroup="vgBuscar" ToolTip="Filtrar por fecha de recepcion"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="txtFecRecHasta_MaskedEditExtender"
                runat="server" 
                TargetControlID="txtFecRecHasta"
                    Mask="99/99/9999"
                Masktype="Date"
                BehaviorID="_content_txtFecRecDesde_MaskedEditExtender" 
                Century="2000" 
                CultureAMPMPlaceholder="" 
                CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" 
                CultureDatePlaceholder="" 
                CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" 
                CultureTimePlaceholder=""/>
            <ajaxToolkit:CalendarExtender ID="txtFecRecHasta_CalendarExtender" runat="server" TargetControlID="txtFecRecHasta" format="dd/MM/yyyy" BehaviorID="_content_txtFecRecHasta_CalendarExtender"/>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtFecRecHasta" ErrorMessage="Fecha Invalida" Operator="DataTypeCheck" Type="Date" ValidationGroup="vgBuscar" CssClass="validators">Fecha Invalida</asp:CompareValidator><br />
            <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="'Hasta' no puede ser menor a 'Desde'" Text="*" Type="Date" ControlToValidate="txtFecRecHasta" ValidationGroup="vgBuscar" ControlToCompare="txtFecRecDesde" CssClass="validators" Operator="GreaterThanEqual">Desde debe ser menor a hasta</asp:CompareValidator>
        </div>
    </div>
    <hr />
    <div class="row">
        <h4>Ultima Modificacion</h4>
    </div>
    <div class="row">
        <div class="col-md-3">
            <strong>Desde</strong><br />
            <asp:TextBox ID="txtFecModDesde" runat="server" ValidationGroup="vgBuscar" ToolTip="Filtrar por fecha de modificacion"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender 
                ID="txtFecModDesde_MaskedEditExtender"
                runat="server" 
                TargetControlID="txtFecModDesde"
                Mask="99/99/9999"
                Masktype="Date"
                BehaviorID="_content_txtFecRecDesde_MaskedEditExtender" 
                Century="2000" 
                CultureAMPMPlaceholder="" 
                CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" 
                CultureDatePlaceholder="" 
                CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" 
                CultureTimePlaceholder=""/>
            <ajaxToolkit:CalendarExtender ID="txtFecModDesde_CalendarExtender" runat="server" TargetControlID="txtFecModDesde" format="dd/MM/yyyy" BehaviorID="_content_txtFecModDesde_CalendarExtender"/>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtFecModDesde" ErrorMessage="Fecha Invalida" Type="Date" ValidationGroup="vgBuscar" Operator="DataTypeCheck" CssClass="validators">Fecha Invalida</asp:CompareValidator>
        </div>
        <div class="col-md-3">
            <strong>Hasta</strong><br />
            <asp:TextBox ID="txtFecModHasta" runat="server" ValidationGroup="vgBuscar" ToolTip="Filtrar por fecha de modificacion"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="txtFecModHasta_MaskedEditExtender" 
                runat="server" 
                TargetControlID="txtFecModHasta"
                Mask="99/99/9999"
                Masktype="Date"
                BehaviorID="_content_txtFecRecDesde_MaskedEditExtender" 
                Century="2000" 
                CultureAMPMPlaceholder="" 
                CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" 
                CultureDatePlaceholder="" 
                CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" 
                CultureTimePlaceholder="" />
            <ajaxToolkit:CalendarExtender ID="txtFecModHasta_CalendarExtender2" runat="server" TargetControlID="txtFecModHasta" format="dd/MM/yyyy" BehaviorID="_content_txtFecModHasta_CalendarExtender2"/>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtFecModHasta" ErrorMessage="Fecha invalida" Type="Date" ValidationGroup="vgBuscar" Operator="DataTypeCheck" CssClass="validators">Fecha Invalida</asp:CompareValidator><br />
            <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="'Hasta' no puede ser menor a 'Desde'" Text="*" Type="Date" ControlToValidate="txtFecModHasta" ValidationGroup="vgBuscar" ControlToCompare="txtFecModDesde" CssClass="validators" Operator="GreaterThanEqual">Desde debe ser menor a hasta</asp:CompareValidator>
        </div>
    </div>
    <div class="row text-right">
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" ValidationGroup="vgBuscar" />
        <input id="btnLimpiarFiltro" class="btn btn-primary" type="button" value="Limpiar Filtros" />
        
    </div>
    <asp:Panel ID="pnlResultado" runat="server" CssClass="row">
        <div class="table-responsive">
            <asp:GridView ID="grNuevos" runat="server" AutoGenerateColumns="False" ToolTip="Pedidos en estado RECIBIDO" DataKeyNames="ID" CssClass="table-condensed">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="NRO" SortExpression="ID" />
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cantidad" >
                    <ItemStyle CssClass="numCol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_ESTADO" HeaderText="ID_ESTADO" SortExpression="ID_ESTADO" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_ESTADO" HeaderText="ID_ESTADO" SortExpression="ID_ESTADO" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    <asp:BoundField DataField="FECHA_RECIBIDO" HeaderText="Recibido" SortExpression="FECHA_RECIBIDO" DataFormatString="{0:d}" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                        <ControlStyle CssClass="imageButtons" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            </div>
    </asp:Panel>
</asp:Content>
