<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="materiales.aspx.vb" Inherits="CBA_PLACAS_BS.materiales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1 class="text-center">MATERIALES<br /><small>
        lista de piezas y stock</small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" Value="success" />
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-md-4">
                <strong>CODIGO:</strong><br />
                <input id="txtFiltroCod" class="form-control" type="text" /><br />
            </div>
            <div class="col-md-4">
                <strong>NOMBRE:</strong><br />
                <input id="txtFiltroNombre" class="form-control" type="text" /><br />
            </div>
            <div class="col-md-4">
                <input id="btnLimpiarFiltro" class="btn btn-primary pull-right" type="button" value="Limpiar Filtro" />
            </div>
        </div>
    </div>
    <hr>
    <div class="row">    
        <div class="table-responsive">
            <asp:GridView ID="grMateriales" runat="server" AutoGenerateColumns="False" ToolTip="Productos" CssClass="table" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID_LINEA" SortExpression="ID" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_LINEA" HeaderText="ID_LINEA" SortExpression="ID_LINEA" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_CHAPA" HeaderText="ID_CHAPA" SortExpression="ID_CHAPA" >
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
                    <asp:BoundField DataField="ID_MANO" HeaderText="ID_MANO" SortExpression="ID_MANO" >
                        <ControlStyle CssClass="hiddencol" />
                        <FooterStyle CssClass="hiddencol" />
                        <HeaderStyle CssClass="hiddencol" />
                        <ItemStyle CssClass="hiddencol" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="SEL">
                        <ItemTemplate>
                            <asp:CheckBox ID="check" runat="server" />
                        </ItemTemplate>
                        <ItemStyle CssClass="numCols" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="COD" HeaderText="COD" />
                    <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                    <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                    <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                    <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                    <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                    <asp:BoundField DataField="MANO" HeaderText="MANO" />
                    <asp:BoundField DataField="PRECIO" HeaderText="PRECIO" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="STOCK" HeaderText="STOCK" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                        <ControlStyle CssClass="imageButtons" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
