<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tests.aspx.vb" Inherits="CBA_PLACAS_BS.tests" Theme="default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">

         $(document).ready(function () {
             console.log("cargado")
             $("#Button1").click(function () {
                 console.log("click en boton")
                 $("#" + '<%= FileUpload1.ClientID %>').click()
             })
         })
         
     </script>
    
</asp:Content>
