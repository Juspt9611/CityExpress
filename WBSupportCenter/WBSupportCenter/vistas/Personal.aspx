<%@ Page Title="" Language="C#" MasterPageFile="~/Blog.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="WBSupportCenter.vistas.Personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />--%>

    <style>
        .panel-default {
            border-color: #ddd;
        }

        .panel {
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .panel-default > .panel-heading {
            color: #333;
            background-color: #f5f5f5;
            border-color: #ddd;
            border-top-left-radius:30px;
            border-top-right-radius:30px;
        }

        .panel-heading {
            padding: 10px 15px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
        }

        .panel-body {
            padding: 15px;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="panel panel-default col-12">
        <div class="panel-heading">Título del panel con estilo normal</div>
        <div class="panel-body" style="border-color:#000 !important;">
            Contenido del panel
        </div>
    </div>

</asp:Content>
