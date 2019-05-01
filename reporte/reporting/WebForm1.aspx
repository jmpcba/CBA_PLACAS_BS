<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WebForm1.aspx.vb" Inherits="CBA_PLACAS_BS.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server"></rsweb:ReportViewer>
</asp:Content>
