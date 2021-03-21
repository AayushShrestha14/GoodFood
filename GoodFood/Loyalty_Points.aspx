<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Loyalty_Points.aspx.cs" Inherits="GoodFood.Loyalty_Points" Title="Loyalty Points Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="POINTS_ID" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="POINTS_ID" HeaderText="POINTS_ID" ReadOnly="True" SortExpression="POINTS_ID" />
            <asp:BoundField DataField="LOYALTY_POINTS" HeaderText="LOYALTY_POINTS" SortExpression="LOYALTY_POINTS" />
            <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
            <asp:BoundField DataField="END_DATE" HeaderText="END_DATE" SortExpression="END_DATE" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:admin %>" DeleteCommand="DELETE FROM ADMIN.LOYALTY_POINTS WHERE (POINTS_ID = :PARAM1)" InsertCommand="INSERT INTO ADMIN.LOYALTY_POINTS(POINTS_ID, LOYALTY_POINTS, START_DATE, END_DATE) VALUES (:PARAM1, :PARAM2, :PARAM3, :PARAM4)" ProviderName="<%$ ConnectionStrings:admin.ProviderName %>" SelectCommand="SELECT POINTS_ID, LOYALTY_POINTS, START_DATE, END_DATE FROM ADMIN.LOYALTY_POINTS" UpdateCommand="UPDATE ADMIN.LOYALTY_POINTS SET LOYALTY_POINTS = :PARAM1, START_DATE = :PARAM2, END_DATE = :PARAM3 WHERE (POINTS_ID = :PARAM4)">
        <DeleteParameters>
            <asp:Parameter Name="POINTS_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="POINTS_ID" Type="String" />
            <asp:Parameter Name="LOYALTY_POINTS" Type="String" />
            <asp:Parameter Name="START_DATE" Type="DateTime" />
            <asp:Parameter Name="END_DATE" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LOYALTY_POINTS" Type="String" />
            <asp:Parameter Name="START_DATE" Type="DateTime" />
            <asp:Parameter Name="END_DATE" Type="DateTime" />
            <asp:Parameter Name="POINTS_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="POINTS_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            POINTS_ID:
            <asp:Label ID="POINTS_IDLabel1" runat="server" Text='<%# Eval("POINTS_ID") %>' />
            <br />
            LOYALTY_POINTS:
            <asp:TextBox ID="LOYALTY_POINTSTextBox" runat="server" Text='<%# Bind("LOYALTY_POINTS") %>' />
            <br />
            START_DATE:
            <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
            <br />
            END_DATE:
            <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            POINTS_ID:
            <asp:TextBox ID="POINTS_IDTextBox" runat="server" Text='<%# Bind("POINTS_ID") %>' />
            <br />
            LOYALTY_POINTS:
            <asp:TextBox ID="LOYALTY_POINTSTextBox" runat="server" Text='<%# Bind("LOYALTY_POINTS") %>' />
            <br />
            START_DATE:
            <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
            <br />
            END_DATE:
            <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
