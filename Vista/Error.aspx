<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Vista.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 class="text-center my-5">Hubo un problema</h1>
    <div class="d-flex flex-column align-items-center">
        <asp:Label ID="lblMensaje" Text="" runat="server" />
        <asp:Image runat="server" ID="imgError" />
    </div>
</asp:Content>
