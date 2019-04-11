<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CBA_PLACAS_BS._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h1 class="text-center">MG Placas SRL<br /><small>
        <asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></small></h1>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-2 text-center">
        <div class="img-responsive center-block">
          <img src="images/carro.png" alt="Pedidos">
          <div class="caption">
           <br />
            <div class="dropdown">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpPedidos" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Pedidos
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="/pedido/nuevoPedido">Nuevo</a></li>
                <li><a href="/pedido/panelPedidos">En Curso</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4 text-center">
        <div class="img-responsive">
          <img src="images/cliente.png" alt="clientes">
          <div class="caption">
            <br />
            <div class="dropdown">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpClientes" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Clientes
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="/cliente/clientes">Lista de clientes</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br />
    <!--SEGUNDA COLUMNA-->
    <div class="row">
      <div class="col-md-4 col-md-offset-2 text-center">
        <div class="img-responsive center-block">
          <img src="images/produccion.png" alt="Pedidos">
          <div class="caption">
            <br />
            <div class="dropdown">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpProductos" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Productos
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="/producto/productos">Lista de Precios</a></li>
                <li><a href="/producto/materiales">Materiales</a></li>
                <li><a href="/producto/caracteristicas">Caracteristicas</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4 text-center">
        <div class="img-responsive">
          <img src="images/grafico.png" class="tb" alt="Reportes">
          <div class="caption">
            <br />
            <div class="dropdown">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpReportes" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Reportes
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="/producto/productos">Lista de Precios</a></li>
                <li><a href="/pedido/materiales">Materiales</a></li>
                <li><a href="/pedido/caracteristicas">Caracteristicas</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
