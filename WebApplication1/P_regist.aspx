<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="P_regist.aspx.cs" Inherits="WebApplication1.P_regist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Заполните поля для Регистрации:</h3>
    <p>При заполнении полей будте вниматлеьны – билеты будут оформляться по указанным данным!</p>
    <table border="0">
        <tr>
            <td>
                <p>Имя</p> 
            </td>
            <td>
                <asp:TextBox ID="TextBox_first_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p>Фамилия</p> 
            </td>
            <td>
                <asp:TextBox ID="TextBox_last_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p>Очество</p>
            </td>
            <td>
                <asp:TextBox ID="TextBox_surname" runat="server"></asp:TextBox>
            </td>
        </tr>        
        <tr>
            <td>
                <p>Номер телефона</p>
            </td>
            <td>
                <asp:TextBox ID="TextBox_numer_telephone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p>Почта (email)</p>
            </td>
            <td>
                <asp:TextBox ID="TextBox_email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p>Логин</p>
            </td>
            <td>
                <asp:TextBox ID="TextBox_login" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <p>Пароль  </p>
            </td>
            <td>                
                <asp:TextBox ID="TextBox_password" runat="server" AutoPostBack="True" OnDataBinding="TextBox_password_true_TextChanged" OnTextChanged="TextBox_password_true_TextChanged"></asp:TextBox>
            </td>            
        </tr>
        <tr>
            <td>
                <p>Пароль Повторно </p>
            </td>
            <td>
                <asp:TextBox ID="TextBox_password_true" runat="server" AutoPostBack="True" OnTextChanged="TextBox_password_true_TextChanged" OnDataBinding="TextBox_password_true_TextChanged" ></asp:TextBox>
            </td>
            <td>
                <asp:Label  Visible="False" ID="Label_error_password" runat="server" Text="Пароли не совпадают!" ForeColor="#990000"></asp:Label>
            </td>
        </tr>
    </table> 
    <h4>
        <asp:Label ID="Label_error_or_good" Visible="false" runat="server" Text="Результат/ошибка"></asp:Label></h4>            
    <asp:Button ID="Button_regist" runat="server" Text="Зарегистрироваться" OnClick="Button_regist_Click" />
    
</asp:Content>
