<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="clientes.aspx.vb" Inherits="CBA_PLACAS_BS.clientes" theme="default"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1 class="text-center">Administrar Clientes <br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
        <div id="msg" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:HiddenField ID="HFMsg" runat="server" />
        </div>
    </div>
    <asp:Panel ID="pnlClientes" runat="server">
        <div class="form-group">
            <div class="row">
            <div class="col-md-3">
                <strong>NOMBRE:</strong>
            </div>
            <div class="col-md-3">
                <strong>CUIT:</strong>
            </div>
        </div>
            <div class="row">
                <div class="col-md-3">
                <asp:TextBox ID="txtBuscarNombre" runat="server"></asp:TextBox>
            </div>
                <div class="col-md-3">
                <asp:TextBox ID="txtBuscarCuit" runat="server"></asp:TextBox>
            </div>
                <div class="col-md-4">
                <div class="btn-group" role="group" aria-label="...">
                    <button id="btnDepo" class="btn btn-primary" type="button" value="" data-toggle="modal" data-target="#mdlNvoCliente">Nuevo Cliente</button>
                    <button id="btnLimpiarFiltro" type="button" class="btn btn-primary" data-dismiss="modal">Limpiar Filtro</button>
                    <asp:Button ID="Button1" runat="server" Text="Refrescar" />
                </div>
            </div>
            </div>
            <br />
            <div class="row">
                <div class="table-responsive">
                    <asp:GridView ID="grClientes" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="DSClientes">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID">
                                <ControlStyle CssClass="hiddencol" />
                                <FooterStyle CssClass="hiddencol" />
                                <HeaderStyle CssClass="hiddencol" />
                                <ItemStyle CssClass="hiddencol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CUIT" HeaderText="CUIT" SortExpression="CUIT" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                                <ControlStyle CssClass="imageButtons" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="DSClientes" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [CUIT], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDetalle" runat="server" Visible="False"></asp:Panel>
</asp:Content>
