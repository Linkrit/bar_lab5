<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_tour.aspx.cs" Inherits="WebApplication1.P_tour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Туры</h3>
    <p>Вы можете просмотреть все предлогаемые нашей фурмой туры. Если Вам понравился тур, но поездок по нему ближайших нет, то напишите или позвоните нам - мы сообщим Вам при начале продаж</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="id_tour" HeaderText="ID тура" SortExpression="id_tour" Visible="true" />
            <asp:BoundField DataField="name_tour" HeaderText="Название тура" SortExpression="name_tour" />
            <asp:BoundField DataField="price" HeaderText="Цена" SortExpression="price" />            
            <asp:BoundField DataField="duree" HeaderText="Длительность" SortExpression="duree" />            
            <asp:BoundField DataField="name_type_tour" HeaderText="Тип тура" SortExpression="name_type_tour" />
            
            <asp:BoundField DataField="information" HeaderText="Дполонительная информация" SortExpression="information" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT tour.[id_tour],  [price], [name_tour], [duree], [information],[name_type_tour] FROM [tour] join [type_tour] on [tour].[id_type_tour]=[type_tour].[id_type_tour]  "></asp:SqlDataSource>
    <h3>Подробрная информация</h3>
    <p>Чтобы отобразить подробную информацию выделите тур<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="numer_list" HeaderText="Порядок посещения" SortExpression="numer_list" />
            <asp:BoundField DataField="numer_day" HeaderText="Дней на месте" SortExpression="numer_day" />
            <asp:BoundField DataField="name_country" HeaderText="Страна" SortExpression="name_country" />
            <asp:BoundField DataField="name_place" HeaderText="Город" SortExpression="name_place" />
            <asp:BoundField DataField="name_hotel" HeaderText="Отель" SortExpression="name_hotel" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [numer_list], [numer_day],[name_country], [name_place],[name_hotel] FROM [program_tour] join hotel on hotel.id_hotel=program_tour.id_hotel join place on place.id_place=hotel.id_place join country on country.id_country=place.id_country WHERE ([id_tour] = @id_tour)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_tour" SessionField="valueName" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>

    <h3>Полный список поездок</h3>
    <p>Чтобы отобразить все поездки что были, воспользуйтесь списком. Чтобы осуществить бронь, нажмите "Выбор" и заполните нужные данные для брони поля</p>
    <asp:DropDownList ID="DropDownList1" Visible="false" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="name_status_visit" DataValueField="name_status_visit" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [name_status_visit] FROM [status_visit]"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="id_visit" AllowSorting="True" AutoGenerateSelectButton="True" AllowPaging="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="id_visit" HeaderText="ID Визита" SortExpression="id_visit" />
            <asp:BoundField DataField="date_bigin" HeaderText="Дата вылета" SortExpression="date_bigin" />
            <asp:BoundField DataField="date_end" HeaderText="Дата приезда" SortExpression="date_end" />
            <asp:BoundField DataField="free_place" HeaderText="Свободных мест" SortExpression="free_place" />            
            <asp:BoundField DataField="name_status_visit" HeaderText="Статус поездки" SortExpression="name_status_visit" />            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [date_bigin], [date_end], [free_place], [name_status_visit], [id_visit] FROM [visit] join status_visit on status_visit.id_status_visit=visit.id_status_visit WHERE ([id_tour] = @id_tour) and ([name_status_visit]=@name_status_visit)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="id_tour" SessionField="valueName" Type="Int32" />
            <asp:SessionParameter DefaultValue="Бронь открыта" Name="name_status_visit" SessionField="name_status_visit" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h3><asp:Label ID="Label_edit_id_visit" Visible="false" Font-Bold="True" runat="server" Text="Вот этот тур выбран:"></asp:Label></h3>        
    <p>
    <asp:Label ID="Label7" Visible="false" Font-Bold="True" runat="server" Text="Преоритетный тип номера:"></asp:Label>
    </p>
    <asp:DropDownList ID="DropDownList2" runat="server" Visible="false" DataSourceID="SqlDataSource5" DataTextField="name_type_numer" DataValueField="name_type_numer" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server"  ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [name_type_numer] FROM [type_numer]"></asp:SqlDataSource>        
    <p>
    <asp:Label ID="Label8" Font-Bold="True" Visible="false" runat="server" Text="Число номеров к покупке:"></asp:Label>
    </p>
    <asp:TextBox ID="TextBox_numero_value_buy" Visible="false" runat="server" OnDataBinding="TextBox_numero_value_buy_TextChanged" OnTextChanged="TextBox_numero_value_buy_TextChanged" AutoPostBack="True"></asp:TextBox>    
    <p><asp:Button ID="Button_add_visit" runat="server" Visible="false" Text="Оформить бронь" OnClick="Button1_Click" /></p>
    <h3>
        <asp:Label ID="Label_prace" Visible="false" runat="server" Text="Расчетная стоимость:"></asp:Label>
    </h3>
    <h3>
    <asp:Label ID="Label_error_booking" Visible="false" Font-Bold="True" runat="server" Text="Ошибка при бронировании"></asp:Label>
    </h3>
</asp:Content>
