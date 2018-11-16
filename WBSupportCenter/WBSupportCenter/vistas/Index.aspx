<%@ Page Title="" Language="C#" MasterPageFile="~/general.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SupportCenter.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="input-group input-group-lg">
	            <%--<span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>--%>
	            <div class="icon-addon addon-lg">
                    <asp:TextBox ID="TextBox1" runat="server" type="text" placeholder="Email" class="form-control"></asp:TextBox>
		            <%--<input type="text" placeholder="Email" class="form-control">--%>
                    <asp:Label ID="Label1" runat="server" class="glyphicon glyphicon-search" rel="tooltip" title="Buscar"></asp:Label>
		            <%--<label for="email" class="glyphicon glyphicon-search" rel="tooltip" title="Buscar"></label>--%>
	            </div>
	            <span class="input-group-btn">
                    <asp:Button ID="Button1" runat="server" Text="Buscar!" class="btn btn-default"/>
		            <%--<button class="btn btn-default" type="button">Buscar!</button>--%>
	            </span>
            </div>
        </div>
        <div class="col-md-4"></div>

    </div>

    

   

    
    

</asp:Content>
