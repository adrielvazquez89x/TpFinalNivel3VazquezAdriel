<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Vista.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formContainer">
        <div class="loginContainer">
            <h2 class="text-center mb-1">Registrate!</h2>
            <p class="text-center mb-4">(por ahora es gratis)</p>
            <div>
                <div class="mb-3">
                    <asp:Label runat="server" Text="E-mail:" CssClass="form-label" />
                    <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Ingrese su dirección de e-mail" />

                </div>
                <div class="mb-3">
                    <asp:Label runat="server" Text="Contraseña:" CssClass="form-label" />
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Ingrese una contraseña" TextMode="Password" />
                </div>
                <asp:Button Text="Registrarse" runat="server" CssClass="btn btn-primary w-100" />
            </div>
        </div>

    </div>
</asp:Content>
