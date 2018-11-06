<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WebForm1.aspx.vb" Inherits="CBA_PLACAS_BS.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:GridView ID="grDeposito" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                        <asp:CheckBox ID="chPrint" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                                <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                                <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                                <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                                <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                                <asp:BoundField DataField="MANO" HeaderText="MANO" />
                                <asp:TemplateField>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                            </EmptyDataTemplate>
                        </asp:GridView>
</asp:Content>
