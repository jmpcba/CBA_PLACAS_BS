<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CBA_PLACAS_BS._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            console.log($("#hfRol > input"))
            console.log($("#hfRol > input").val())
            
            if ($("input[id$=HFRol]").val() == "ENCARGADO"){
                var controles = [$("#liCar"), $("#dpReportes"), $("#dpClientes"), $("#liNvo"), $("#aCar"), $("#aNvo"), $("#liNvoProd"), $("#aNvoProd")]
                console.log(controles)
                inHabilitarControles(controles)
            }

            if ($("input[id$=HFRol]").val() == "GERENCIA") {
                var controles = [$("#liCar"), $("#aCar"), $("#liNvo"), $("#aNvo"), $("#liNvoProd"), $("#aNvoProd")]
                console.log(controles)
                inHabilitarControles(controles)
            }
        })
    </script>
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
            <div class="dropup">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpPedidos" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Pedidos
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu col-xs-12" aria-labelledby="dropdownMenu1">
                  <li id="liNvo"><a id="aNvo" href="/pedido/nuevoPedido"><h4>Nuevo</h4></a></li>
                  <li><a href="/pedido/panelPedidos"><h4>En Curso</h4></a></li>
                  <li><a href="/pedido/buscarPedido"><h4>Buscar</h4></a></li>
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
            <div class="dropup">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpClientes" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Clientes
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu col-xs-12" aria-labelledby="dropdownMenu1">
                <li><a href="/cliente/clientes"><h4>Lista de clientes</h4></a></li>
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
            <div class="dropup">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpProductos" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Productos
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu col-xs-12" aria-labelledby="dropdownMenu1">
                <li id="liNvoProd"><a id="aNvoProd" href="/producto/nuevoProducto"><h4>Nuevo Producto</h4></a></li>
                <li><a href="/producto/productos"><h4>Lista de Precios</h4></a></li>
                <li><a href="/producto/materiales"><h4>Materiales</h4></a></li>
                <li id="liCar"><a id="aCar" href="/producto/caracteristicas"><h4>Caracteristicas</h4></a></li>
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
            <div class="dropup">
              <button class="btn btn-primary btn-lg btn-block dropdown-toggle" type="button" id="dpReportes" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Reportes
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu col-xs-12" aria-labelledby="dropdownMenu1">
                <li><a href="/producto/productos"><h4>Lista de Precios</h4></a></li>
                <li><a href="/pedido/materiales"><h4>Materiales</h4></a></li>
                <li><a href="/pedido/caracteristicas"><h4>Caracteristicas</h4></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
