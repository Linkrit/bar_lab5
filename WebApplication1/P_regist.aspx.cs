using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class P_regist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 0)
            {
                Response.Redirect("P_error.aspx");
            }
        }

        protected void Button_regist_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(TextBox_password.Text) == "" || Convert.ToString(TextBox_login.Text) == ""
                || Convert.ToString(TextBox_email.Text) == "" || Convert.ToString(TextBox_numer_telephone.Text) == "" ||
                Convert.ToString(TextBox_last_name.Text) == "" || Convert.ToString(TextBox_first_name.Text) == ""
                || Convert.ToString(TextBox_surname.Text) == "")
            {
                Label_error_or_good.Text = "Пустые поля недопустимы!";
                Label_error_or_good.Visible = true;
            }
            else if (Label_error_password.Text != "Пароли совпадают") 
            {
                Label_error_or_good.Text = "Пороли не совпадают – ошибка!";
                Label_error_or_good.Visible = true;
            }
            else
            {
                try
                {
                    SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
                    connection.Open();
                    SqlCommand command_insert_user = new SqlCommand("INSERT INTO [t_user] ([pasword], [login], [mail], [numer_telephone], [id_role], [first_name], [last_name], [surname]) VALUES (@pasword, @login, @mail, @numer_telephone, @id_role, @first_name, @last_name, @surname)", connection);
                    command_insert_user.Parameters.Add(new SqlParameter("@pasword", Convert.ToString(TextBox_password.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@login", Convert.ToString(TextBox_login.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@mail", Convert.ToString(TextBox_email.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@numer_telephone", Convert.ToString(TextBox_numer_telephone.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@id_role", 2));//задаем сразу айди пользователя
                    command_insert_user.Parameters.Add(new SqlParameter("@last_name", Convert.ToString(TextBox_last_name.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@first_name", Convert.ToString(TextBox_first_name.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@surname", Convert.ToString(TextBox_surname.Text)));
                    command_insert_user.ExecuteNonQuery();
                    connection.Close();
                    TextBox_password.Text = ""; TextBox_login.Text = "";
                    TextBox_email.Text = ""; TextBox_numer_telephone.Text = "";
                    TextBox_last_name.Text = ""; TextBox_first_name.Text = ""; TextBox_surname.Text = "";TextBox_password_true.Text = "";                    
                    Label_error_or_good.Text = "Регистрация успешна!";
                    Label_error_or_good.Visible = true;
                }
                catch
                {
                    Label_error_or_good.Text = "При добавлении произошла ошибка";
                    Label_error_or_good.Visible = true;
                }
            }
        }
        //passwor == passworDublle ?
        protected void TextBox_password_true_TextChanged(object sender, EventArgs e)
        {
            if (TextBox_password.Text != TextBox_password_true.Text)
            {
                Label_error_password.Text = "Пароли не совпадают!";
                Label_error_password.Visible = true;
            }
            else 
            {
                Label_error_password.Text = "Пароли совпадают";                
            }
        }
    }
}