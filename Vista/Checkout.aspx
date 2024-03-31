<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Vista.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <h1>Confirmar Compra</h1>

    <h3>Completa el formulario para finalizar la compra:</h3>
    <div>
        <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
        <asp:TextBox ID="txtDni" runat="server" placeholder="Dni"></asp:TextBox>
        <asp:TextBox ID="txtDireccion" runat="server" placeholder="Direccion"></asp:TextBox>
        <asp:TextBox ID="txtLocalidad" runat="server" placeholder="Localidad"></asp:TextBox>
        <asp:TextBox ID="txtCP" runat="server" placeholder="Codigo postal"></asp:TextBox>
    </div>
    <div>
        <h4>Elija método de pago</h4>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="ddlMetodoPago" runat="server" AutoPostBack="true">
                    <asp:ListItem> - </asp:ListItem>
                    <asp:ListItem>Efectivo</asp:ListItem>
                    <asp:ListItem>Tarjeta</asp:ListItem>
                </asp:DropDownList>

                <% if (ddlMetodoPago.SelectedItem.Value == "Tarjeta")
                    {%>
                <asp:TextBox ID="txtTarjetaNumero" runat="server" placeholder="Ingrese número de tarjeta"></asp:TextBox>
                <%}%>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <p>ESPINER</p>

    <asp:Button ID="btnConfirmarCompra" runat="server" CssClass="btnComprar" Text="Confirmar compra" />

</asp:Content>
