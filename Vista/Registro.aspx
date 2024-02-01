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
                    <asp:TextBox runat="server" ID="txtUserName" ClientIDMode="Static" CssClass="form-control" placeholder="Ingrese su dirección de e-mail" />
                    <span id="spanValidatorEmail"></span>
                  <asp:RegularExpressionValidator ControlToValidate="txtUserName"
                        ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="txtUserName" runat="server"/>  
                </div>
                <div class="mb-3">
                    <asp:Label runat="server" Text="Contraseña:" CssClass="form-label" />
                    <asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" CssClass="form-control" placeholder="Ingrese una contraseña" TextMode="Password" />
                    <span id="spanValidatorPass"></span>
                    <asp:RequiredFieldValidator  ControlToValidate="txtPassword" runat="server"/>

                    <asp:Label Text="El correo ingresado ya está registrado." ID="lblCorreoExistente" CssClass="text-danger" Visible="false"  runat="server" />
                </div>
                <asp:Button Text="Registrarse" runat="server" ID="btnRegistrar" OnClientClick="return validar()"  OnClick="btnRegistrar_Click" CssClass="btn btn-primary w-100" /> 
                
            </div>
        </div>

    </div>
</asp:Content>
