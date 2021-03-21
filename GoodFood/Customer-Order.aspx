<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Customer-Order.aspx.cs" Inherits="GoodFood.Customer_Order" Title="Customer-Order Detail Form" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:DropDownList ID="ddlCustomerOrder" runat="server" DataSourceID="SqlDataSource1" DataTextField="CUSTOMER_NAME" DataValueField="CUSTOMER_CODE"></asp:DropDownList>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT &quot;CUSTOMER_CODE&quot;, &quot;CUSTOMER_NAME&quot; FROM &quot;CUSTOMER&quot;"></asp:SqlDataSource>
    <asp:Label ID="errMsg" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</asp:Content>
