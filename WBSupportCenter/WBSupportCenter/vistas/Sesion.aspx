<%@ Page Title="" Language="C#" MasterPageFile="~/Sesion.Master" AutoEventWireup="true" CodeBehind="Sesion.aspx.cs" Inherits="WBSupportCenter.vistas.Sesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-container">
       <a style="text-align:center;">
          <h2 style="color:#FFF;">Support<span style="color:#fcea1d;">Center</span></h2>
       </a>
        <br />
        <img id="profile-img" class="profile-img-card" src="../recursos/StyleLogin/img/Login.png" />
        <p id="profile-name" class="profile-name-card"></p>
        <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Usuario" required autofocus style="background-color:rgba(0, 0, 0, 0.72);border-color:#77DAD5; color:#fff;"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Contraseña" required style="background-color:rgba(0, 0, 0, 0.72); border-color:#77DAD5; color:#fff;"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Aceptar" class="btn btn-lg btn-primary btn-block btn-signin"/>

    </div>

</asp:Content>
