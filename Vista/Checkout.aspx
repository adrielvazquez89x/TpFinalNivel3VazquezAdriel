<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Vista.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <h1 class="text-center mt-5" id="h1Confirmar">Confirmar Compra</h1>
    <%-- Primera mitad del formulario --%>
    <div class="d-flex gap-5">
        <div class="col-6">
            <div class="d-flex flex-column">
                <h3>Completa el formulario para finalizar la compra:</h3>
                <h3 class="text-danger">Esto es un simulador, no ingreses tus datos reales.</h3>
                <asp:TextBox ID="txtNombreConfirmar" ClientIDMode="Static" runat="server" placeholder="Nombre" CssClass="form-control my-1"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtNombreConfirmar" runat="server" />
                <span id="spanNombreConfirmar"></span>
                <asp:TextBox ID="txtDni" ClientIDMode="Static" runat="server" placeholder="Dni" CssClass="form-control my-1" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtDni" runat="server" />
                <span id="spanDni"></span>
                <asp:TextBox ID="txtDireccion" ClientIDMode="Static" runat="server" placeholder="Direccion" CssClass="form-control my-1"></asp:TextBox>
                <span id="spanDireccion"></span>
                <asp:RequiredFieldValidator ControlToValidate="txtDireccion" runat="server" />
                <asp:TextBox ID="txtLocalidad" ClientIDMode="Static" runat="server" placeholder="Localidad" CssClass="form-control my-1"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtLocalidad" runat="server" />
                <span id="spanLocalidad"></span>
                <asp:TextBox ID="txtCP" ClientIDMode="Static" runat="server" placeholder="Codigo postal" CssClass="form-control my-1" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtCP" runat="server" />
                <span id="spanCp"></span>
            </div>
            <div>
                <h4>Elija método de pago</h4>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="d-flex flex-column col-8">
                            <asp:DropDownList ID="ddlMetodoPago" ClientIDMode="Static" runat="server" AutoPostBack="true"
                                CssClass="form-control my-1">
                                <asp:ListItem Value="1">Efectivo</asp:ListItem>
                                <asp:ListItem Value="2">Tarjeta</asp:ListItem>
                            </asp:DropDownList>

                            <% if (ddlMetodoPago.SelectedItem.Value == "Tarjeta")
                                {%>
                            <asp:TextBox ID="txtTarjetaNumero"
                                runat="server"
                                placeholder="Ingrese número de tarjeta"
                                CssClass="form-control my-1" Text="1111-1111-1111-1111"></asp:TextBox>
                            <span class="text-danger">NO INGRESAR DATOS REALES DE TARJETA DE CREDITO</span>
                            <%}%>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="mt-5">
                    <asp:Button ID="btnConfirmarCompra" runat="server"
                        CssClass="btnComprar" Text="Confirmar datos"
                        OnClick="btnConfirmarCompra_Click"
                        OnClientClick="return validacionConfirmar()" />
                </div>

            </div>
        </div>

        <%-- Segunda mitad del formulario --%>
        <% if (FormularioAprobado)
            { %>
        <div class="col-6">
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
                    <%for (int x = 0; x < Carrito.Count; x++)
                        { %>
                    <tr>
                        <th scope="row"><%:x+1 %></th>
                        <td><%:Carrito[x].Fabricante %> <%:Carrito[x].Nombre %></td>
                        <td><%:Carrito[x].Cantidad %></td>
                        <td><%:Carrito[x].Cantidad * Carrito[x].Precio %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
            <div class="d-flex justify-content-end mt-5 ">
                <asp:Button ID="btnFinalizar" runat="server"
                    CssClass="btnComprar" Text="Realizar compra"
                    OnClick="btnFinalizar_Click" />
            </div>
        </div>
        <%}%>
    </div>
    <%if (Spiner)
        {%>
    <div class="d-flex justify-content-center">
        <div class="spinner-container">
            <div class="spinner"></div>
        </div>
    </div>
    <%} %>
</asp:Content>
