using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        //при закгрузке страницы
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 0)
            {
                Label1.Visible = false;
                Label2.Text = "Здравствуй, " + Convert.ToString(Session["Name_User"]) + "!";
                Label2.Visible = true;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                LinkButton3.Visible = true;
                Button1.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                LinkButton8.Visible = false;
                if (Convert.ToInt32(Session["ID_role"]) == 1)
                {
                    LinkButton7.Visible = true;
                }
                if (Convert.ToInt32(Session["ID_role"]) == 2)
                {
                    LinkButton4.Visible = true;
                }
                if (Convert.ToInt32(Session["ID_role"]) == 3)
                {
                    LinkButton5.Visible = true;
                    LinkButton6.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                }
            }
            else 
            {
                Label1.Visible = false;                
                Label2.Visible = false;
                Label2.Text = "Прощай";
                TextBox1.Visible = true;
                TextBox2.Visible = true;
                LinkButton3.Visible = false;
                Button1.Visible = true;
                Label3.Visible = true;
                Label4.Visible = true;
                LinkButton8.Visible = true;
                LinkButton4.Visible = false;
                LinkButton5.Visible = false;
                LinkButton6.Visible = false;
                LinkButton7.Visible = false;
                LinkButton9.Visible = false;
                LinkButton10.Visible = false;
            }
        }
        //кнопка к главной
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_news.aspx");            
        }
        //ЛК кнопка
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_all_user_lc.aspx");
        }
        //кнопка к турам
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_tour.aspx");
        }
        //Кнопка вход
        protected void Button1_Click(object sender, EventArgs e)
        {
            String text_logein = TextBox1.Text;
            String text_pssword = TextBox2.Text;
            SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
            connection.Open();
            if (text_logein != "" && text_pssword != "")
            {
                SqlCommand command_aut = new SqlCommand("Select * from t_user WHERE login=@text_logein and pasword=@text_pssword",connection);
                command_aut.Parameters.Add(new SqlParameter("@text_logein", text_logein));
                command_aut.Parameters.Add(new SqlParameter("@text_pssword", text_pssword));
                SqlDataReader reader = command_aut.ExecuteReader();
                if (reader.Read())
                {
                    try
                    {
                        Session["Name_User"] = reader[7];
                        Session["ID_role"] = reader[5];
                        Session["ID_user"] = reader[0];
                        Label1.Visible = false;
                        Label2.Text = "Здравствуй, " + Convert.ToString(Session["Name_User"]) + "!";
                        Label2.Visible = true;
                        TextBox1.Visible = false;
                        TextBox2.Visible = false;
                        LinkButton3.Visible = true;
                        Button1.Visible = false;
                        Label3.Visible = false;
                        Label4.Visible = false;
                        LinkButton8.Visible = false;
                        if(Convert.ToInt32(Session["ID_role"])==1)
                        {
                            LinkButton7.Visible = true;
                        }
                        if (Convert.ToInt32(Session["ID_role"]) == 2)
                        {
                            LinkButton4.Visible = true;                            
                        }
                        if (Convert.ToInt32(Session["ID_role"]) == 3)
                        {
                            LinkButton5.Visible = true;
                            LinkButton6.Visible = true;
                            LinkButton9.Visible = true;
                            LinkButton10.Visible = true;
                        }
                    }
                    catch
                    {
                        Label1.Text = "Ошибка поиска";
                        Label1.Visible = true;
                    }

                }
                else 
                {
                    Label1.Text = "Пользователь не найдет";
                    Label1.Visible = true;
                }
            }
            else 
            {
                Label1.Text = "Данные не введены!";
                Label1.Visible = true;
            }
            connection.Close();
            Response.Redirect("P_news.aspx");
        }
        //Кнопка выход
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Name_User"] = "NULL";
            Session["ID_role"] = 0;
            Session["ID_user"] = 0;
            Response.Redirect("P_news.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_users_tour.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_new_profil_maker.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_editor_tour.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_editor_booking.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_regist.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_edit_visit.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("P_edit_program.aspx");
        }
    }
}