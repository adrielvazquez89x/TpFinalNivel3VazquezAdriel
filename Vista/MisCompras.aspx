<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="Vista.MisCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Mis compras</h1>
    <h3>Aún no haz realizado ninguna compra.</h3>
    <div class="col-8">
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Fecha</th>
                    <th>Número de Compra</th>
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
                            <td>Compra N° <%# Eval("NroCompra") %></td>
                            <td>Total: $ <%# Eval("Total") %></td>
                            <td><%# Eval("Direccion") %>, <%# Eval("Localidad") %>, CP: <%# Eval("CodigoPostal") %></td>
                            <td>
                                <asp:LinkButton Text="text" runat="server">
                            <i class="fa fa-search" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>


</asp:Content>
