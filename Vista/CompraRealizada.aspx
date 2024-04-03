<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CompraRealizada.aspx.cs" Inherits="Vista.CompraRealizada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Compra finalizada</h1>


<%--    <div class="col-6">
    <h3>Tu compra:</h3>
        <h3 class="text-center">Carrito</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Producto</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <%for (int x = 0; x < Usuario.Carrito.Count; x++)
                    { %>
                <tr>
                    <th scope="row"><%:x+1 %></th>
                    <td><%:Usuario.Carrito[x].Fabricante %> <%:Usuario.Carrito[x].Nombre %></td>
                    <td><%:Usuario.Carrito[x].Cantidad %></td>
                    <td><%:Usuario.Carrito[x].Cantidad * Usuario.Carrito[x].Precio %></td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>--%>
        <a href="Default.aspx">Volver</a>

</asp:Content>
