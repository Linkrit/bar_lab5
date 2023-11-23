using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class P_new_profil_maker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 1)
            {
               Response.Redirect("P_error.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(TextBox_password.Text)=="" || Convert.ToString(TextBox_login.Text)=="" 
                || Convert.ToString(TextBox_email.Text) == "" || Convert.ToString(TextBox_numer_telephone.Text) == ""|| 
                Convert.ToString(TextBox_role.Text) == "" || Convert.ToString(TextBox_last_name.Text) == ""
                || Convert.ToString(TextBox_first_name.Text) == "" || Convert.ToString(TextBox_surname.Text) == "")
            {
                Label_insert.Text = "Пустые поля недопустимы!";
                Label_insert.Visible = true;
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
                    command_insert_user.Parameters.Add(new SqlParameter("@id_role", Convert.ToInt32(TextBox_role.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@last_name", Convert.ToString(TextBox_last_name.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@first_name", Convert.ToString(TextBox_first_name.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@surname", Convert.ToString(TextBox_surname.Text)));
                    command_insert_user.ExecuteNonQuery();
                    connection.Close();
                    TextBox_password.Text = ""; TextBox_login.Text = "";
                    TextBox_email.Text = ""; TextBox_numer_telephone.Text = ""; TextBox_role.Text = "";
                    TextBox_last_name.Text = ""; TextBox_first_name.Text = ""; TextBox_surname.Text = "";
                    Response.Redirect("P_new_profil_maker.aspx");
                }
                catch
                {
                    Label_insert.Text = "При добавлении произошла ошибка";
                    Label_insert.Visible = true;
                }
            }
        }


        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            Session["ID_user_deleted"] = Convert.ToInt32(GridView1.SelectedRow.Cells[9].Text);
        }
    }
}