<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dish.aspx.cs" Inherits="GoodFood.Dish" Title="Dish Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DISH_CODE" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" ReadOnly="True" SortExpression="DISH_CODE" />
            <asp:BoundField DataField="DISH_NAME" HeaderText="DISH_NAME" SortExpression="DISH_NAME" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" DeleteCommand="DELETE FROM ADMIN.DISH WHERE (DISH_CODE = :PARAM1)" InsertCommand="INSERT INTO ADMIN.DISH(DISH_CODE, DISH_NAME) VALUES (:PARAM1, :PARAM2)" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT * FROM &quot;DISH&quot;" UpdateCommand="UPDATE ADMIN.DISH SET DISH_NAME = :PARAM1 WHERE (DISH_CODE = :PARAM2)">
        <DeleteParameters>
            <asp:Parameter Name="DISH_CODE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DISH_CODE" Type="String" />
            <asp:Parameter Name="DISH_NAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DISH_NAME" Type="String" />
            <asp:Parameter Name="DISH_CODE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="DISH_CODE" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            DISH_CODE:
            <asp:Label ID="DISH_CODELabel1" runat="server" Text='<%# Eval("DISH_CODE") %>' />
            <br />
            DISH_NAME:
            <asp:TextBox ID="DISH_NAMETextBox" runat="server" Text='<%# Bind("DISH_NAME") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            DISH_CODE:
            <asp:TextBox ID="DISH_CODETextBox" runat="server" Text='<%# Bind("DISH_CODE") %>' />
            <br />
            DISH_NAME:
            <asp:TextBox ID="DISH_NAMETextBox" runat="server" Text='<%# Bind("DISH_NAME") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>