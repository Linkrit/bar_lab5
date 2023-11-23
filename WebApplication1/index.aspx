<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    Main Page<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_tour" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id_tour" HeaderText="id_tour" ReadOnly="True" SortExpression="id_tour" />
            <asp:BoundField DataField="information" HeaderText="information" SortExpression="information" />
            <asp:BoundField DataField="id_type_tour" HeaderText="id_type_tour" SortExpression="id_type_tour" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="duree" HeaderText="duree" SortExpression="duree" />
            <asp:BoundField DataField="name_tour" HeaderText="name_tour" SortExpression="name_tour" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT * FROM [tour]"></asp:SqlDataSource>
</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
</asp:Content>
