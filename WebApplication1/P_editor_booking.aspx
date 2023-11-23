<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_editor_booking.aspx.cs" Inherits="WebApplication1.P_editor_booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Вы на странице редакторо броней</h3>
    <p>Вам доступен список заявок от клиентов. Вы можете анализировать данные и либо подтверждать бронь, либо отменять ее.</p>    
    

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_booking" HeaderText="Номер брони" SortExpression="id_booking" />
            <asp:BoundField DataField="name_status" HeaderText="Статус брони" SortExpression="name_status" />
            <asp:BoundField DataField="id_user" HeaderText="Номер пользователя" SortExpression="id_user" />
            <asp:BoundField DataField="date_booking" HeaderText="Дата брони" SortExpression="date_booking" />
            <asp:BoundField DataField="numero_place" HeaderText="Число номеров к покупке" SortExpression="numero_place" />
            <asp:BoundField DataField="name_type_numer" HeaderText="Выбранный тип номеров" SortExpression="name_type_numer" />
            <asp:BoundField DataField="date_bigin" HeaderText="Дата начала поездки" SortExpression="date_bigin" />
            <asp:BoundField DataField="date_end" HeaderText="Дата конца поездки" SortExpression="date_end" />
            <asp:BoundField DataField="free_place" HeaderText="Свободно мест" SortExpression="free_place" />
            <asp:BoundField DataField="name_status_visit" HeaderText="name_status_visit" SortExpression="name_status_visit" />
            <asp:BoundField DataField="name_tour" HeaderText="name_tour" SortExpression="name_tour" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT booking.id_booking, status_booking.name_status, t_user.id_user, booking.date_booking, booking.numero_place, type_numer.name_type_numer, visit.date_bigin, visit.date_end, visit.free_place, status_visit.name_status_visit, tour.name_tour FROM booking JOIN t_user ON booking.id_user = t_user.id_user JOIN status_booking ON booking.id_status_booking = status_booking.id_status_booking  JOIN visit ON booking.id_visit = visit.id_visit  JOIN status_visit ON visit.id_status_visit = status_visit.id_status_visit JOIN tour ON visit.id_tour = tour.id_tour  JOIN type_numer ON booking.id_type_numer = type_numer.id_type_numer"></asp:SqlDataSource>
    <h4>
        <asp:Label ID="Label_edit" Visible="false" runat="server" Text="Вы выбрали:"></asp:Label></h4>
        <p>
            <asp:Label ID="Label_edit_about" runat="server" Text="Укажите новый статус"></asp:Label></p>
    <p>
            <asp:DropDownList ID="DropDownList1" Visible="false" runat="server" DataSourceID="SqlDataSource2" DataTextField="name_status" DataValueField="id_status_booking" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT * FROM [status_booking]"></asp:SqlDataSource>
    </p>
    <p>
            <asp:Button ID="Button_edit_new_status" Visible="false" runat="server" Text="Изменить" OnClick="Button_edit_new_status_Click" />
    </p>



    <p>
            <asp:Label ID="Label_error_edit" Visible="false" runat="server" Text="Итог операции:"></asp:Label>
    </p>

</asp:Content>
