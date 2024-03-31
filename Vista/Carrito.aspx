<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Vista.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% if (ListaCompras.Count != 0 && ListaCompras != null)
        {%>
    <%-- AKABALATABILITA --%>
    <h3 class="text-center mt-5">Mi carrito </h3>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col"> </th>
                <th scope="col">PRODUCTO</th>
                <th scope="col">CANTIDAD</th>
                <th scope="col">SUBTOTAL</th>
                <th scope="col"> </th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater runat="server" ID="repeater">
                <ItemTemplate>
                    <tr>
                        <th scope="row"><%  %></th>
                        <td>
                            <img src=" <%#Eval("UrlImg") %>" alt=" <%#Eval("Nombre") %>" class="img-Cart" />
                        </td>
                        <td><%#Eval("Fabricante") %> <%#Eval("Nombre") %> </td>
                        <td><%#Eval("Cantidad") %></td>
                        <td>$<%# Convert.ToDecimal( Eval("Precio")) * Convert.ToInt32( Eval("Cantidad")) %></td>
                        <td>
                            <div>
                                <!-- Botonera de acciones -->
                                <div class="d-flex justify-content-around px-3">
                                    <!-- Agregar o disminuir cantidad -->
                                    <!-- Btn Aumentar -->
                                    <asp:LinkButton Text="text" runat="server" ID="btnAumentar"
                                        OnClick="btnAumentar_Click" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId"
                                        CssClass="text-secondary">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                                    </asp:LinkButton>
                                    <!-- Btn Disminuir -->
                                    <asp:LinkButton Text="text" runat="server" ID="btnDisminuir"
                                        OnClick="btnDisminuir_Click" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId"
                                        CssClass="text-secondary">
                                  <i class="fa fa-minus" aria-hidden="true"></i>
                                    </asp:LinkButton>
                                </div>
                                <!-- Eliminar producto del carrito -->
                                <div class="d-flex justify-content-center px-3 mt-5">
                                    <asp:LinkButton Text="text" runat="server" ID="btnEliminar"
                                        OnClick="btnEliminar_Click" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId"
                                        CssClass="text-danger">
                                       <i class="fa fa-trash" aria-hidden="true"></i>
                                    </asp:LinkButton>
                                </div>

                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="5"></td>
                <!-- Colspan para ocupar todas las columnas -->
                <td class="text-right">El total a pagar es de: $<%:TotalAPagar%></td>
                <!-- Agregar el total a pagar -->
            </tr>

        </tbody>
    </table>
    <div class="d-flex justify-content-around">
        <asp:Button runat="server" ID="btnVaciarCarrito" OnClick="btnVaciarCarrito_Click" CssClass="btnVaciar" Text="Vaciar carrito" />
        <asp:Button runat="server" ID="btnRealizarCompra" CssClass="btnComprar" Text="Realizar compra" />
    </div>


    <%}
        else
        {  %>
    <div class="mx-auto">
        <h3 class="text-center mt-5">No hay elementos en el carrito</h3>
        <div class="wildCart">
            <img src="assets/images/CARRITOSALVAJE.png" />
        </div>
    </div>

    <%} %>
</asp:Content>

