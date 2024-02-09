<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Vista.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Favoritos</h1>
    <div class="row justify-content-center">
        <asp:Repeater runat="server" ID="ripiter">
            <ItemTemplate>

                <div class="card mb-3 col-6" style="max-width: 540px;">
                    <div class="row g-0">

                        <div class="col-md-4 favImg py-3">
                            <a href="Detalle.aspx?id=<%#Eval("Id") %>">
                                <img src="<%#Eval("UrlImg") %>" onerror="this.src='https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg'" class="img-fluid rounded-start" alt="imagen de <%#Eval("Nombre") %>">
                            </a>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <p class="card-text"><small class="text-body-secondary">$ <%#Eval("Precio") %> </small></p>
                            </div>
                        </div>

                        <div class="d-flex col-md-1 justify-content-center align-items-center">
                            <asp:LinkButton runat="server" ID="bntEliminar" CssClass="btnDelete"
                                OnClick="bntEliminar_Click" CommandArgument='<%#Eval("Id") %>' CommandName="ArticuloId">
                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                            </asp:LinkButton>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
