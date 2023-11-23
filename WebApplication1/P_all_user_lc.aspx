<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_all_user_lc.aspx.cs" Inherits="WebApplication1.P_admin_lc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        Вы находитесь в Личном кабинете.
    </h2>
    <h3>
        <asp:Label ID="Label_bonjour" runat="server" Text="Label" ></asp:Label>
    </h3>
    <h3>Ваши данные:</h3>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
            <Columns>
                <asp:BoundField DataField="pasword" HeaderText="pasword" SortExpression="pasword" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:BoundField DataField="numer_telephone" HeaderText="numer_telephone" SortExpression="numer_telephone" />
                <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:tour_firmConnectionString %>" SelectCommand="SELECT [pasword], [login], [mail], [numer_telephone], [last_name], [first_name], [surname] FROM [t_user] WHERE ([id_user] = @id_user)" UpdateCommand="UPDATE [t_user] SET [pasword]=@pasword, [login]=@login, [mail]=@mail, [numer_telephone]=@numer_telephone, [last_name]=@last_name, [first_name]=@first_name, [surname]=@surname WHERE ([id_user] = @id_user)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_user" SessionField="ID_user" Type="Int32" />                
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="id_user" SessionField="ID_user" Type="Int32" />                
                <asp:SessionParameter Name="pasword" SessionField="PR_pasword" Type="String" />
                <asp:SessionParameter Name="login" SessionField="PR_login" Type="String" />
                <asp:SessionParameter Name="mail" SessionField="PR_mail" Type="String" />
                <asp:SessionParameter Name="numer_telephone" SessionField="PR_numer_telephone" Type="String" />
                <asp:SessionParameter Name="last_name" SessionField="PR_last_name" Type="String" />
                <asp:SessionParameter Name="first_name" SessionField="PR_first_name" Type="String" />
                <asp:SessionParameter Name="surname" SessionField="PR_surname" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>        
    </p>
    <p>
        Вы можете изменить любые свои данные, но не делайте этого без необходимости.        
    </p>
</asp:Content>
