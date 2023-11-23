<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_editor_tour.aspx.cs" Inherits="WebApplication1.P_editor_tour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Вы на странице редактирвоания туров</h3>
    <h4>Редактор туров</h4>
    <p>Вы можете добавить тур или изменить имеющийся. </p>
    <table>
        <tr>
            <td>
                Информация по туру
            </td>
            <td>
                <asp:TextBox ID="TextBox_inf_tour_add" runat="server"></asp:TextBox>
            </td>
        </tr>     
        <tr>
            <td>
                Тип тура
            </td>
            <td>
                <asp:DropDownList ID="DropDownList_id_type_tour_add" runat="server" DataSourceID="SqlDataSource2" DataTextField="name_type_tour" DataValueField="id_type_tour" OnSelectedIndexChanged="DropDownList_id_type_tour_add_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT * FROM [type_tour]"></asp:SqlDataSource>
            </td>
        </tr>    
        <tr>
            <td>
                Стоимость за человека
            </td>
            <td>
                <asp:TextBox ID="TextBox_prace_add" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Продолжительность
            </td>
            <td>
                <asp:TextBox ID="TextBox_duree_add" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Название тура
            </td>
            <td>
                <asp:TextBox ID="TextBox_name_tour_add" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="Label_Error" runat="server" Visible="false" Text="error"></asp:Label></p>
    <p>
        <asp:Button ID="Button_new_tour_add" runat="server" Text="Добавить новый тур" OnClick="Button_new_tour_add_Click" />
    </p>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_tour" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateEditButton="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="id_tour" HeaderText="id_tour" ReadOnly="True" SortExpression="id_tour" InsertVisible="False" />
            <asp:BoundField DataField="information" HeaderText="information" SortExpression="information" />
            <asp:BoundField DataField="id_type_tour" HeaderText="id_type_tour" SortExpression="id_type_tour" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="duree" HeaderText="duree" SortExpression="duree" />
            <asp:BoundField DataField="name_tour" HeaderText="name_tour" SortExpression="name_tour" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>"  SelectCommand="SELECT * FROM [tour]" UpdateCommand="UPDATE tour SET information =@information , price =@price , duree =@duree , name_tour =@name_tour where id_tour=@id_tour" >
        <UpdateParameters>
            <asp:SessionParameter Name="information" SessionField="information" Type="String"/>
            <asp:SessionParameter Name="price" SessionField="price" Type="Int32"/>
            <asp:SessionParameter Name="duree" SessionField="duree" Type="Int32"/>
            <asp:SessionParameter Name="free_place" SessionField="name_tour" Type="String"/>
            <asp:SessionParameter Name="id_tour" SessionField="id_tour" Type="Int32"/>
        </UpdateParameters>       
    </asp:SqlDataSource>
    
   
</asp:Content>
