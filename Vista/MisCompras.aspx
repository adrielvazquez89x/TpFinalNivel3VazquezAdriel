<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="Vista.MisCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Mis compras</h1>
    <% if (MisComprasRealizadas.Count == 0 || MisComprasRealizadas == null)
        { %>
    <div class="mx-auto">
        <h3 class="text-center mt-5">Aún no has hecho compras</h3>
        <div class="wildCart">
            <img src="assets/images/CARRITOSALVAJE.png" />
        </div>
    </div>
    <%}
        else
        {%>
    <div class="container-fluid d-flex gap-5">
        <div class="col-6">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Fecha</th>
                        <th># Compra</th>
                        <th>Total</th>
                        <th>Enviado a</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="repeater">
                        <ItemTemplate>
                            <tr class="mb-3">
                                <td><%# Eval("Fecha") %></td>
                                <td><%# Eval("NroCompra") %></td>
                                <td>$ <%# Eval("Total") %></td>
                                <td><%# Eval("Direccion") %>, <%# Eval("Localidad") %>, CP: <%# Eval("CodigoPostal") %></td>
                                <td>
                                    <asp:LinkButton runat="server" ID="btnDetalle" OnClick="btnDetalle_Click" CommandArgument='<%#Eval("NroCompra") %>' CommandName="NroCompra">
                      <i class="fa fa-search" aria-hidden="true"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <div class="col-6">
            <%if (Spinner)
                {%>
            <div class="d-flex justify-content-center">
                <div class="spinner-container">
                    <div class="spinner"></div>
                </div>
            </div>
            <%}
                else if (VerDetalle)
                {%>
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th>Producto</th>
                        <th>Precio </th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>

                    </tr>
                </thead>
                <tbody>
                    <%foreach (var art in CompraDetallada.Productos)
                        { %>
                    <tr>
                        <td data-bs-toggle="tooltip" data-bs-custom-class="custom-tooltip" data-bs-html="true" title="<img src='<%:art.UrlImg %>' class='tooltipImg'/>"><i class="fa fa-picture-o" aria-hidden="true"></i></td>
                        <td><%: art.Fabricante.Nombre %> <%:art.Nombre %></td>
                        <td>$<%:art.Precio.ToString("0.##") %></td>
                        <td><%:art.Cantidad %></td>
                        <td>$<%:(art.Precio * art.Cantidad).ToString("0.##") %></td>
                        <td><a href="Detalle.aspx?id= <%:(art.Id)%>">Ver</a></td>

                    </tr>
                    <%  }%>
                </tbody>
            </table>
            <%}%>
        </div>
    </div>
    <%}%>
</asp:Content>
