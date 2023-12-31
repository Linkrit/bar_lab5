﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_edit_visit.aspx.cs" Inherits="WebApplication1.P_edit_visit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h4>Редактор поездок</h4>
    <p>Вы можете добавить или изменить любую поездку</p>
    <table>
        <tr>
            <td>Дата начала</td>
            <td>
                <asp:TextBox ID="TextBox_date_bigin" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Дата конца</td>
            <td>
                <asp:TextBox ID="TextBox_date_end" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Мест всего</td>
            <td>
                <asp:TextBox ID="TextBox_free_place" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Относиться к туру</td>
            <td>
                <asp:DropDownList ID="DropDownList_id_tour" runat="server" DataSourceID="SqlDataSource3" DataTextField="name_tour" DataValueField="id_tour" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_id_tour_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [id_tour], [name_tour] FROM [tour]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
     <asp:Label ID="Label_duree" runat="server"  Text="Продолжительность тура: 15 дней"></asp:Label>
     <br />
    <tb />
    <asp:Button ID="Button_new_visit" runat="server" Text="Добавить" OnClick="Button_new_visit_Click" />
    <asp:Label ID="Label_error_new_visit" Visible="false" runat="server" Text="error"></asp:Label>
    <p>Отображить только поездки, что относяться к турам:</p>    
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name_tour" DataValueField="id_tour" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [id_tour], [name_tour] FROM [tour]"></asp:SqlDataSource>
    <asp:GridView ID="GridView_visit" runat="server" AutoGenerateColumns="False" DataKeyNames="id_visit" DataSourceID="SqlDataSource5" AutoGenerateEditButton="True" OnSelectedIndexChanged="GridView_visit_SelectedIndexChanged" AutoGenerateDeleteButton="True">
        <Columns>
            <asp:BoundField DataField="id_visit" HeaderText="ID визита" ReadOnly="True" SortExpression="id_visit" />
            <asp:BoundField DataField="date_bigin" HeaderText="Дата начала" SortExpression="date_bigin" />
            <asp:BoundField DataField="date_end" HeaderText="Дата конца" SortExpression="date_end" />
            <asp:BoundField DataField="free_place" HeaderText="Всего мест" SortExpression="free_place" />
            <asp:BoundField DataField="id_tour" HeaderText="Номер тура" ReadOnly="True" SortExpression="id_tour" />
            <asp:BoundField DataField="id_status_visit" HeaderText="Номер статуса" SortExpression="id_status_visit" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" DeleteCommand="Delete from visit where id_visit=@id_visit" SelectCommand="SELECT * FROM [visit] WHERE ([id_tour] = @id_tour) and id_status_visit=1" UpdateCommand="UPDATE visit SET date_bigin =@date_bigin, date_end =@date_end, free_place =@free_place, id_status_visit =@id_status_visit where id_visit=@id_visit">
        <SelectParameters>
            <asp:SessionParameter Name="id_tour" SessionField="ID_tour" Type="Int32" DefaultValue="0"  />
        </SelectParameters>    
        <UpdateParameters>
            <asp:SessionParameter Name="id_visit"  SessionField="ID_tour" Type="Int32"/>
            <asp:SessionParameter Name="date_bigin"  SessionField="date_bigin" Type="String"/>
            <asp:SessionParameter Name="date_end" SessionField="date_end" Type="String"/>
            <asp:SessionParameter Name="free_place" SessionField="free_place" Type="Int32"/>
            <asp:SessionParameter Name="id_status_visit" SessionField="id_status_visit" Type="Int32"/>
        </UpdateParameters>
        <DeleteParameters>
            <asp:SessionParameter Name="id_visit"  SessionField="ID_tour" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>    
</asp:Content>
