<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Customer.aspx.cs" Inherits="GoodFood.Customer" Title="Customer Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CUSTOMER_CODE" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CUSTOMER_CODE" HeaderText="CUSTOMER_CODE" ReadOnly="True" SortExpression="CUSTOMER_CODE" />
            <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="CUSTOMER_NAME" SortExpression="CUSTOMER_NAME" />
            <asp:BoundField DataField="TOTAL_LOYALTY_POINTS" HeaderText="TOTAL_LOYALTY_POINTS" SortExpression="TOTAL_LOYALTY_POINTS" />
        </Columns>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" DeleteCommand="DELETE FROM ADMIN.CUSTOMER WHERE (CUSTOMER_CODE = :PARAM1)" InsertCommand="INSERT INTO ADMIN.CUSTOMER(CUSTOMER_CODE, CUSTOMER_NAME, TOTAL_LOYALTY_POINTS) VALUES (:PARAM1, :PARAM2, :PARAM3)" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT CUSTOMER_CODE, CUSTOMER_NAME, TOTAL_LOYALTY_POINTS FROM ADMIN.CUSTOMER" UpdateCommand="UPDATE ADMIN.CUSTOMER SET CUSTOMER_NAME = :PARAM1, TOTAL_LOYALTY_POINTS = :PARAM2 WHERE (CUSTOMER_CODE = :PARAM3)">
        <DeleteParameters>
            <asp:Parameter Name="CUSTOMER_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CUSTOMER_CODE" Type="String" />
            <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
            <asp:Parameter Name="TOTAL_LOYALTY_POINTS" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
            <asp:Parameter Name="TOTAL_LOYALTY_POINTS" Type="Decimal" />
            <asp:Parameter Name="CUSTOMER_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CUSTOMER_CODE" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            CUSTOMER_CODE:
            <asp:Label ID="CUSTOMER_CODELabel1" runat="server" Text='<%# Eval("CUSTOMER_CODE") %>' />
            <br />
            CUSTOMER_NAME:
            <asp:TextBox ID="CUSTOMER_NAMETextBox" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' />
            <br />
            TOTAL_LOYALTY_POINTS:
            <asp:TextBox ID="TOTAL_LOYALTY_POINTSTextBox" runat="server" Text='<%# Bind("TOTAL_LOYALTY_POINTS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            CUSTOMER_CODE:
            <asp:TextBox ID="CUSTOMER_CODETextBox" runat="server" Text='<%# Bind("CUSTOMER_CODE") %>' />
            <br />
            CUSTOMER_NAME:
            <asp:TextBox ID="CUSTOMER_NAMETextBox" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' />
            <br />
            TOTAL_LOYALTY_POINTS:
            <asp:TextBox ID="TOTAL_LOYALTY_POINTSTextBox" runat="server" Text='<%# Bind("TOTAL_LOYALTY_POINTS") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>