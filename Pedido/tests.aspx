<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tests.aspx.vb" Inherits="CBA_PLACAS_BS.tests" Theme="default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="grModificarItems" runat="server" ToolTip="Detalle pedido" AutoGenerateColumns="False" 
            DataKeyNames="ITEM,ID_LINEA">
            <Columns>
                <asp:BoundField DataField="ITEM" HeaderText="ITEM" ReadOnly="true"/>
                <asp:BoundField DataField="LINEA" HeaderText="LINEA" ReadOnly="True" />
                <asp:TemplateField HeaderText="CANT">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCant" runat="server" Text='<%# Bind("CANT") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MADERA">
                    <ItemTemplate>
                        <asp:DropDownList ID="cbMadera" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HOJA">
                    <ItemTemplate>
                        <asp:DropDownList ID="cbHoja" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MARCO">
                    <ItemTemplate>
                        <asp:DropDownList ID="cbMarco" runat="server" >
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CHAPA">
                    <ItemTemplate>
                        <asp:DropDownList ID="cbChapa" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MANO">
                    <ItemTemplate>
                        <asp:DropDownList ID="cbMano" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID_LINEA" HeaderText="ID_LINEA"/>
                <asp:BoundField DataField="ID_MADERA" HeaderText="ID_MADERA" Visible="False" />
                <asp:BoundField DataField="ID_HOJA" HeaderText="ID_HOJA" Visible="False" />
                <asp:BoundField DataField="ID_MARCO" HeaderText="ID_MARCO" Visible="False" />
                <asp:BoundField DataField="ID_CHAPA" HeaderText="ID_CHAPA" Visible="False" />
                <asp:BoundField DataField="ID_MANO" HeaderText="ID_MANO" Visible="False" />
            </Columns>
        </asp:GridView>
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" />
</asp:Content>
