<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Administrar.aspx.vb" Inherits="CBA_PLACAS_BS.Administrar" theme="default"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center">Pedidos En Produccion</h2>
    <hr />
    <asp:Panel ID="pnlPedidos" runat="server" CssClass="row">
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                <strong>ESTADOS:</strong>
                <asp:DropDownList ID="DPFiltroEstados" runat="server" DataSourceID="DSestados" DataTextField="nombre" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="DSestados" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [estados]"></asp:SqlDataSource>
            </div>
            <div class="col-md-3 text-right">
                <strong>CLIENTES:</strong>
                <asp:DropDownList ID="DPFiltroClientes" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT [ID], [NOMBRE] FROM [CLIENTES]"></asp:SqlDataSource>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-1 col-md-offset-3">
                <asp:ImageButton ID="btnRefreshNv" runat="server" ImageUrl="~/images/refresh-button-icon.png" ImageAlign="Middle" ToolTip="Refrescar" CssClass="imageButtons img-circle" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <asp:GridView ID="grPedidos" runat="server" AutoGenerateColumns="False" DataSourceID="dsNvos" ToolTip="Pedidos en estado RECIBIDO" DataKeyNames="ID" CssClass="table-condensed"><Columns>
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
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    <asp:BoundField DataField="FECHA_RECIBIDO" HeaderText="Recibido" SortExpression="FECHA_RECIBIDO" DataFormatString="{0:d}" />
                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/images/zoom_in.png" ShowSelectButton="True">
                    <ControlStyle CssClass="imageButtons" />
                    </asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsNvos" runat="server" ConnectionString="<%$ ConnectionStrings:cbaPlacasConnectionString1 %>" SelectCommand="SELECT * FROM [VW_PEDIDOS_EN_CURSO]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDetalle" CssClass="row" runat="server" Visible="false">
        <div class="row">
            <h4>Detalle Pedido</h4>    
        </div>
        <div class="row">
            <hr />
            <div class="btn-group" role="group" aria-label="...">
                <asp:Button ID="btnVolver" runat="server" Text="Volver" />
                <asp:Button ID="Button2" runat="server" Text="Button" />
                <asp:Button ID="Button3" runat="server" Text="Button" />
                <asp:Button ID="Button4" runat="server" Text="Button" />
            </div>
            <hr />
        </div>
        <div class="row">
            <div class="panel-group" id="accordion">
                  <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#detalle">
                    Detalle</a>
                  </h4>
                </div>
                <div id="detalle" class="panel-collapse collapse in">
                  <div class="panel-body">
                      <asp:GridView ID="grDetalle" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                            <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                            <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                            <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                            <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                            <asp:BoundField DataField="MANO" HeaderText="MANO" />
                            <asp:BoundField DataField="CANT" HeaderText="CANT" >
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCols" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                        </EmptyDataTemplate>
                    </asp:GridView>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#stock">
                    Stock</a>
                  </h4>
                </div>
                <div id="stock" class="panel-collapse collapse">
                  <div class="panel-body">
                      <asp:GridView ID="grStock" runat="server" AutoGenerateColumns="False" ToolTip="Detalle pedido" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LINEA" HeaderText="LINEA" />
                            <asp:BoundField DataField="MADERA" HeaderText="MADERA" />
                            <asp:BoundField DataField="HOJA" HeaderText="HOJA" />
                            <asp:BoundField DataField="MARCO" HeaderText="MARCO" />
                            <asp:BoundField DataField="CHAPA" HeaderText="CHAPA" />
                            <asp:BoundField DataField="MANO" HeaderText="MANO" />
                            <asp:BoundField DataField="CANT" HeaderText="CANT" >
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCols" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CANT" HeaderText="CANT" >
                            <ControlStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" CssClass="numCols" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                        </EmptyDataTemplate>
                    </asp:GridView>
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#materiales">
                    Materiales</a>
                  </h4>
                </div>
                <div id="materiales" class="panel-collapse collapse">
                  <div class="panel-body">CONTENIDO MATERIALES</div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#deposito">
                    Deposito</a>
                  </h4>
                </div>
                <div id="deposito" class="panel-collapse collapse">
                  <div class="panel-body">CONTENIDO DEPOSITO</div>
                </div>
              </div>
            </div>  
        </div>
    </asp:Panel>
</asp:Content>
