<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_users_tour.aspx.cs" Inherits="WebApplication1.P_users_tour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Список приобретенных туров</h2>
    <p>На данной странице Вы можете увидеть полный список Ваших туров, отсортировать их по необходимости или просмотреть какие туры Вы уже посещали.</p>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name_status" DataValueField="id_status_booking" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT * FROM [status_booking]"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name_status_visit" DataValueField="id_status_visit" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT * FROM [status_visit]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />            
            <asp:BoundField DataField="name_tour" HeaderText="Название тура" SortExpression="name_tour" />
            <asp:BoundField DataField="name_status" HeaderText="Статус брони" SortExpression="name_status" />
            <asp:BoundField DataField="numero_place" HeaderText="Число номеров" SortExpression="numero_place" />
            <asp:BoundField DataField="name_type_numer" HeaderText="Типы номеров" SortExpression="name_type_numer" />
            <asp:BoundField DataField="date_booking" HeaderText="Дата обращения" SortExpression="date_booking" />
            <asp:BoundField DataField="date_bigin" HeaderText="Дата начала тура" SortExpression="date_bigin" />
            <asp:BoundField DataField="date_end" HeaderText="Дата конца тура" SortExpression="date_end" />
            <asp:BoundField DataField="duree" HeaderText="Продолжительность" SortExpression="duree" />
            <asp:BoundField DataField="name_status_visit" HeaderText="Статус поездки" SortExpression="name_status_visit" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT name_tour, [numero_place], [date_booking], [name_status],[name_type_numer],[date_bigin],[date_end],[name_status_visit],[duree] FROM [booking] join status_booking on status_booking.id_status_booking=booking.id_status_booking join type_numer on type_numer.id_type_numer=booking.id_type_numer join visit on visit.id_visit=booking.id_visit join status_visit on status_visit.id_status_visit=visit.id_status_visit join tour on visit.id_tour=tour.id_tour WHERE (booking.id_status_booking = @id_status_booking) and (visit.id_status_visit = @id_status_visit)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="id_status_booking" SessionField="ID_status_booking" Type="Int32" />
            <asp:SessionParameter DefaultValue="1" Name="id_status_visit" SessionField="ID_status_visit" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h3>Подробная информация:</h3>
    <p>Чтобы увидеть подробную информацию по поездке, нажмите "Выбор"</p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource5">
        <Columns>
            <asp:BoundField DataField="name_tour" HeaderText="Название тура" SortExpression="name_tour" />
            <asp:BoundField DataField="numer_list" HeaderText="Порядок посещения" SortExpression="numer_list" />
            <asp:BoundField DataField="numer_day" HeaderText="Дней на месте" SortExpression="numer_day" />
            <asp:BoundField DataField="name_hotel" HeaderText="Название отеля" SortExpression="name_hotel" />
            <asp:BoundField DataField="name_place" HeaderText="Город" SortExpression="name_place" />
            <asp:BoundField DataField="name_country" HeaderText="Страна" SortExpression="name_country" />            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [information], [name_tour],numer_list,numer_day,name_hotel,name_place,name_country FROM [tour]  join program_tour on tour.id_tour=program_tour.id_tour join hotel on hotel.id_hotel=program_tour.id_hotel join place on place.id_place=hotel.id_place join country on country.id_country=place.id_country WHERE ([name_tour] = @name_tour)">
        <SelectParameters>
            <asp:SessionParameter Name="name_tour" SessionField="NAME_tour" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h2>Вы можете просмотреть полный список</h2>
    <p>Для навигации по нему используйте сортировку.</p>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="name_tour" HeaderText="Название тура" SortExpression="name_tour" />
            <asp:BoundField DataField="name_status" HeaderText="Статус брони" SortExpression="name_status" />
            <asp:BoundField DataField="numero_place" HeaderText="Число номеров" SortExpression="numero_place" />
            <asp:BoundField DataField="name_type_numer" HeaderText="Типы номеров" SortExpression="name_type_numer" />
            <asp:BoundField DataField="date_booking" HeaderText="Дата обращения" SortExpression="date_booking" />
            <asp:BoundField DataField="date_bigin" HeaderText="Дата начала тура" SortExpression="date_bigin" />
            <asp:BoundField DataField="date_end" HeaderText="Дата конца тура" SortExpression="date_end" />
            <asp:BoundField DataField="duree" HeaderText="Продолжительность" SortExpression="duree" />
            <asp:BoundField DataField="name_status_visit" HeaderText="Статус поездки" SortExpression="name_status_visit" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT  name_tour,[numero_place], [date_booking], [name_status],[name_type_numer],[date_bigin],[date_end],[name_status_visit],[duree] FROM [booking] join status_booking on status_booking.id_status_booking=booking.id_status_booking join type_numer on type_numer.id_type_numer=booking.id_type_numer join visit on visit.id_visit=booking.id_visit join status_visit on status_visit.id_status_visit=visit.id_status_visit join tour on visit.id_tour=tour.id_tour">
    </asp:SqlDataSource>

</asp:Content>
