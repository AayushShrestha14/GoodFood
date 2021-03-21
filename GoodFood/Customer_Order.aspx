<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Customer_Order.aspx.cs" Inherits="GoodFood.Customer_order" Title="Customer-Order Detail Form"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name:"></asp:Label>
    <asp:DropDownList ID="ddlCustomerOrder" runat="server" DataSourceID="SqlDataSource1" DataTextField="CUSTOMER_NAME" DataValueField="CUSTOMER_CODE">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" DeleteCommand="DELETE FROM ADMIN.CUSTOMER" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT CUSTOMER_CODE, CUSTOMER_NAME FROM ADMIN.CUSTOMER" UpdateCommand="UPDATE ADMIN.CUSTOMER SET"></asp:SqlDataSource>
    <asp:Label ID="lblPreferredDeliveryAddress" runat="server" Text="Preferred Delivery Address:"></asp:Label>
    <asp:DropDownList ID="ddlDeliveryAddress" runat="server" DataSourceID="SqlDataSource2" DataTextField="DELIVERY_ADDRESS" DataValueField="DELIVERY_ADDRESS_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT DELIVERY_ADDRESS_ID, DELIVERY_ADDRESS FROM ADMIN.DELIVERY_ADDRESS"></asp:SqlDataSource>
    <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />
    <asp:Label ID="errMsg" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
</asp:Content>
