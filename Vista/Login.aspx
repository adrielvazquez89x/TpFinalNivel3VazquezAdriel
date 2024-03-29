﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="formContainer">
        <div class="loginContainer">
            <h2 class="text-center mb-4">Iniciar Sesión</h2>
            <div>
                <div class="mb-3">
                    <asp:Label runat="server" Text="Nombre de usuario:" CssClass="form-label" />
                    <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Ingrese su nombre de usuario" />
                    <small id="emailHelp" class="form-text text-muted"></small>
                </div>
                <div class="mb-3">
                    <asp:Label runat="server" Text="Contraseña:" CssClass="form-label" />
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Ingresá tu contraseña" TextMode="Password" />
                    <small id="passwordHelp" class="form-text text-muted"></small>
                </div>
                <asp:Button Text="Iniciar Sesión" ID="btnLogin" OnClick="btnLogin_Click" runat="server" CssClass="btn btn-primary w-100" />
               
            </div>
        </div>

    </div>

</asp:Content>
