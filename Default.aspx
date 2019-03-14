<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CBA_PLACAS_BS._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1 class="text-center">MG Placas SRL<br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-2">
        <div class="thumbnail">
          <img src="images/stock.png" alt="Pedidos">
          <div class="caption">
            <h3>Pedidos</h3>
            <p>Controle el estado e ignrese nuevos pedidos</p>
            <p><a href="Pedido/nuevo.aspx" class="btn btn-primary" role="button">Nuevo</a> <a href="Pedido/panelPedido.aspx" class="btn btn-default" role="button">Existente</a></p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="thumbnail">
          <img src="images/cliente.png" alt="clientes">
          <div class="caption">
            <h3>Clientes</h3>
            <p>Liste, modifique e ingrese nuevos clientes</p>
            <p><a href="cliente/clientes.aspx" class="btn btn-primary" role="button">Clientes</a></p>
          </div>
        </div>
      </div>
    </div>
    <!--SEGUNDA COLUMNA-->
    <div class="row">
      <div class="col-md-4 col-md-offset-2">
        <div class="thumbnail">
          <img src="images/produccion.png" alt="Pedidos">
          <div class="caption">
            <h3>Productos</h3>
            <p>Productos disponibles</p>
            <p><a href="Pedido/nuevo.aspx" class="btn btn-primary" role="button">Nuevo</a> <a href="Pedido/panelPedido.aspx" class="btn btn-default" role="button">Existente</a></p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="thumbnail">
          <img src="images/grafico.png" class="tb" alt="Reportes">
          <div class="caption">
            <h3>Reportes</h3>
            <p>Reportes historicos</p>
            <p><a href="cliente/clientes.aspx" class="btn btn-primary" role="button">Clientes</a></p>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
