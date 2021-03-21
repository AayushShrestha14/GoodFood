<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Delivery_Address.aspx.cs" Inherits="GoodFood.Delivery_Address" Title="Delivery Address Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DELIVERY_ADDRESS_ID" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="DELIVERY_ADDRESS_ID" HeaderText="DELIVERY_ADDRESS_ID" ReadOnly="True" SortExpression="DELIVERY_ADDRESS_ID" />
            <asp:BoundField DataField="DELIVERY_ADDRESS" HeaderText="DELIVERY_ADDRESS" SortExpression="DELIVERY_ADDRESS" />
            <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
            <asp:BoundField DataField="LONGITUDE" HeaderText="LONGITUDE" SortExpression="LONGITUDE" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" DeleteCommand="DELETE FROM ADMIN.DELIVERY_ADDRESS WHERE (DELIVERY_ADDRESS_ID = :PARAM1)" InsertCommand="INSERT INTO ADMIN.DELIVERY_ADDRESS(DELIVERY_ADDRESS_ID, DELIVERY_ADDRESS, LATITUDE, LONGITUDE) VALUES (:PARAM1, :PARAM2, :PARAM3, :PARAM4)" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT DELIVERY_ADDRESS_ID, DELIVERY_ADDRESS, LATITUDE, LONGITUDE FROM ADMIN.DELIVERY_ADDRESS" UpdateCommand="UPDATE ADMIN.DELIVERY_ADDRESS SET DELIVERY_ADDRESS = :PARAM1, LATITUDE = :PARAM2, LONGITUDE = :PARAM3 WHERE (DELIVERY_ADDRESS_ID = :PARAM4)">
        <DeleteParameters>
            <asp:Parameter Name="DELIVERY_ADDRESS_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DELIVERY_ADDRESS_ID" Type="String" />
            <asp:Parameter Name="DELIVERY_ADDRESS" Type="String" />
            <asp:Parameter Name="LATITUDE" Type="String" />
            <asp:Parameter Name="LONGITUDE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DELIVERY_ADDRESS" Type="String" />
            <asp:Parameter Name="LATITUDE" Type="String" />
            <asp:Parameter Name="LONGITUDE" Type="String" />
            <asp:Parameter Name="DELIVERY_ADDRESS_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="DELIVERY_ADDRESS_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            DELIVERY_ADDRESS_ID:
            <asp:Label ID="DELIVERY_ADDRESS_IDLabel1" runat="server" Text='<%# Eval("DELIVERY_ADDRESS_ID") %>' />
            <br />
            DELIVERY_ADDRESS:
            <asp:TextBox ID="DELIVERY_ADDRESSTextBox" runat="server" Text='<%# Bind("DELIVERY_ADDRESS") %>' />
            <br />
            LATITUDE:
            <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
            <br />
            LONGITUDE:
            <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            DELIVERY_ADDRESS_ID:
            <asp:TextBox ID="DELIVERY_ADDRESS_IDTextBox" runat="server" Text='<%# Bind("DELIVERY_ADDRESS_ID") %>' />
            <br />
            DELIVERY_ADDRESS:
            <asp:TextBox ID="DELIVERY_ADDRESSTextBox" runat="server" Text='<%# Bind("DELIVERY_ADDRESS") %>' />
            <br />
            LATITUDE:
            <asp:TextBox ID="LATITUDETextBox" runat="server" Text='<%# Bind("LATITUDE") %>' />
            <br />
            LONGITUDE:
            <asp:TextBox ID="LONGITUDETextBox" runat="server" Text='<%# Bind("LONGITUDE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>