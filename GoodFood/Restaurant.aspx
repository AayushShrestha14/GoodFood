<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Restaurant.aspx.cs" Inherits="GoodFood.Restaurant" Title="Restaurant Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RESTAURANT_CODE" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="RESTAURANT_CODE" HeaderText="RESTAURANT_CODE" ReadOnly="True" SortExpression="RESTAURANT_CODE" />
            <asp:BoundField DataField="AVAILABLE_RESTAURANT" HeaderText="AVAILABLE_RESTAURANT" SortExpression="AVAILABLE_RESTAURANT" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" DeleteCommand="DELETE FROM ADMIN.RESTAURANT WHERE (RESTAURANT_CODE = :PARAM1)" InsertCommand="INSERT INTO ADMIN.RESTAURANT(RESTAURANT_CODE, AVAILABLE_RESTAURANT) VALUES (:PARAM1, :PARAM2)" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT RESTAURANT_CODE, AVAILABLE_RESTAURANT FROM ADMIN.RESTAURANT" UpdateCommand="UPDATE ADMIN.RESTAURANT SET AVAILABLE_RESTAURANT = :PARAM1 WHERE (RESTAURANT_CODE = :PARAM2)">
        <DeleteParameters>
            <asp:Parameter Name="RESTAURANT_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RESTAURANT_CODE" Type="String" />
            <asp:Parameter Name="AVAILABLE_RESTAURANT" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AVAILABLE_RESTAURANT" Type="String" />
            <asp:Parameter Name="RESTAURANT_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="RESTAURANT_CODE" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            RESTAURANT_CODE:
            <asp:Label ID="RESTAURANT_CODELabel1" runat="server" Text='<%# Eval("RESTAURANT_CODE") %>' />
            <br />
            AVAILABLE_RESTAURANT:
            <asp:TextBox ID="AVAILABLE_RESTAURANTTextBox" runat="server" Text='<%# Bind("AVAILABLE_RESTAURANT") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            RESTAURANT_CODE:
            <asp:TextBox ID="RESTAURANT_CODETextBox" runat="server" Text='<%# Bind("RESTAURANT_CODE") %>' />
            <br />
            AVAILABLE_RESTAURANT:
            <asp:TextBox ID="AVAILABLE_RESTAURANTTextBox" runat="server" Text='<%# Bind("AVAILABLE_RESTAURANT") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
