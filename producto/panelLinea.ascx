<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="panelLinea.ascx.vb" Inherits="CBA_PLACAS_BS.panelLinea" %>
<script type="text/javascript">
    $(document).ready(function () {
        var pos = $("#" + '<%= HFPanel.ClientID %>').val()
        $("#link").attr('id', 'link' + pos)
        $("#link" + pos).attr("href", "#panel" + pos)
        $("#panel").attr('id', 'panel'+pos)
    })
</script>
<asp:HiddenField ID="HFPanel" runat="server" />
<div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingOne">
        <h4 class="panel-title">
        <a id="link" role="button" data-toggle="collapse" data-parent="#accordion" href="#panel" aria-expanded="true" aria-controls="collapseOne">
            <asp:Label ID="lblTitulo" runat="server" Text="Label"></asp:Label>
        </a>
        </h4>
    </div>
    <div id="panel" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
        <div class="panel-body">
            <div class="table-responsive">
                <asp:GridView ID="grProductos" runat="server" AutoGenerateColumns="False" ToolTip="Productos" CssClass="table" DataKeyNames="ID_HOJA, ID_MARCO, ID_CHAPA, ID_MADERA">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                        <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                        <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                        <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                        <asp:BoundField DataField="ID_CHAPA" HeaderText="ID_CHAPA" SortExpression="ID_CHAPA" >
                            <ControlStyle CssClass="hiddencol" />
                            <FooterStyle CssClass="hiddencol" />
                            <HeaderStyle CssClass="hiddencol" />
                            <ItemStyle CssClass="hiddencol" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ID_HOJA" HeaderText="ID_HOJA" SortExpression="ID_HOJA" >
                            <ControlStyle CssClass="hiddencol" />
                            <FooterStyle CssClass="hiddencol" />
                            <HeaderStyle CssClass="hiddencol" />
                            <ItemStyle CssClass="hiddencol" />
                        </asp:BoundField>
                         <asp:BoundField DataField="ID_MARCO" HeaderText="ID_MARCO" SortExpression="ID_MARCO" >
                            <ControlStyle CssClass="hiddencol" />
                            <FooterStyle CssClass="hiddencol" />
                            <HeaderStyle CssClass="hiddencol" />
                            <ItemStyle CssClass="hiddencol" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ID_MADERA" HeaderText="ID_MADERA" SortExpression="ID_MADERA" >
                            <ControlStyle CssClass="hiddencol" />
                            <FooterStyle CssClass="hiddencol" />
                            <HeaderStyle CssClass="hiddencol" />
                            <ItemStyle CssClass="hiddencol" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                            <ControlStyle CssClass="imageButtons" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
