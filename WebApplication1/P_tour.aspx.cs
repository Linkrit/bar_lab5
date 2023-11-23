using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class P_tour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idTour = GridView1.SelectedRow.Cells[1].Text;
            Session.Add("valueName", idTour);
            //Убераем что относилось для брони ранее выранного тура
            DropDownList1.Visible = true;
            Label_edit_id_visit.Visible = false;            
            Label7.Visible = false;
            DropDownList2.Visible = false;
            Label8.Visible = false;
            TextBox_numero_value_buy.Visible = false;
            Button_add_visit.Visible = false;
            Label_error_booking.Visible = false;
            Session["Prace_tour"]= GridView1.SelectedRow.Cells[3].Text;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["name_status_visit"]= DropDownList1.SelectedValue;
        }
        //Оформление брони
        protected void  Button1_Click(object sender, EventArgs e)
        {
            DateTime dateTime_booking = new DateTime();
            dateTime_booking = DateTime.Now;
            int numero_place = Convert.ToInt32(TextBox_numero_value_buy.Text);            
            int id_user_booking = Convert.ToInt32(Session["ID_user"]);            
            SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
            connection.Open();            
            try
            {
                SqlCommand command_new_visit = new SqlCommand("INSERT INTO booking (id_status_booking, id_visit, id_type_numer,id_user,numero_place,date_booking) VALUES (@id_status_booking, @id_visit, @id_type_numer, @id_user,@numero_place,@date_booking)", connection);
                command_new_visit.Parameters.Add(new SqlParameter("@id_status_booking", 1));
                command_new_visit.Parameters.Add(new SqlParameter("@id_visit", Convert.ToInt32(Session["ID_visit"])));
                command_new_visit.Parameters.Add(new SqlParameter("@id_type_numer", Convert.ToInt32(Session["ID_type_numer"])));
                command_new_visit.Parameters.Add(new SqlParameter("@id_user", Convert.ToInt32(Session["ID_user"])));
                command_new_visit.Parameters.Add(new SqlParameter("@numero_place", numero_place));
                command_new_visit.Parameters.Add(new SqlParameter("@date_booking", dateTime_booking));
                command_new_visit.ExecuteNonQuery();
                Label_error_booking.Text = "Бронь принята. Ожидайте ответа";
                Label_error_booking.Visible = true;
            }
            catch 
            {
                Label_error_booking.Text = "Ошибка при отправке запроса. Обратитесь по телефону.";
                Label_error_booking.Visible = true;
            }
            connection.Close();            

        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) == 2)
            {
                Session.Add("ID_visit", Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text));
                //Нужно проверить какой тип сейчас у этапа визита?..
                String test = Convert.ToString(Session["ID_visit"]);
                string help_string = Convert.ToString(GridView2.SelectedRow.Cells[5].Text);
                Session["Day_max"] = Convert.ToString(GridView2.SelectedRow.Cells[4].Text);
                if (Convert.ToString(GridView2.SelectedRow.Cells[5].Text) == "Бронь открыта")
                {
                    Label_edit_id_visit.Text = "Выбранный Вами тур имеет номер: " + Convert.ToString(Session["ID_visit"]);
                    Label_edit_id_visit.Visible = true;                    
                    Label7.Visible = true;
                    DropDownList2.Visible = true;
                    Label8.Visible = true;
                    TextBox_numero_value_buy.Visible = true;
                    Button_add_visit.Visible = true;                    
                }
                else
                {
                    Label_error_booking.Text = "Бронь на тур недоступна";
                    Label_error_booking.Visible = true;
                }
            }
            else 
            {
                Label_edit_id_visit.Text = "Вы не можете бронировать туры. Авторизуйтесь или зайдите с другого акаунта.";
                Label_edit_id_visit.Visible = true;
            }
        }

        protected void TextBox_numero_value_buy_TextChanged(object sender, EventArgs e)
        {                      
            SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
            connection.Open();
            SqlCommand command_id_status_visit = new SqlCommand("select * from type_numer where name_type_numer=@name_type_numer", connection);
            String name_type_numer = DropDownList2.SelectedValue;
            command_id_status_visit.Parameters.Add(new SqlParameter("@name_type_numer", name_type_numer));
            SqlDataReader reader = command_id_status_visit.ExecuteReader();
            if (reader.Read())
            {
                Session["ID_type_numer"] = reader[0];
            }
            reader.Close();
            connection.Close();
            int numero_place = Convert.ToInt32( Convert.ToInt32(TextBox_numero_value_buy.Text) * Convert.ToInt32(Session["ID_type_numer"]));
            Label_prace.Text ="Расчетная стоимость: "+Convert.ToString(Convert.ToInt32(Session["Prace_tour"]) * Convert.ToInt32(TextBox_numero_value_buy.Text) * Convert.ToInt32(Session["ID_type_numer"]));
            Label_prace.Visible = true;
            if (numero_place > Convert.ToInt32(Session["Day_max"]))
            {
                Label_error_booking.Text = "Вы пытаетесь забронировать больше билетов чем доступно! Вы можете это сделать, но мы не гарантируем, что сможем добавить еще мест.";
                Label_error_booking.Visible = true;
            }
            else
            {
                Label_error_booking.Visible = false;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
                TextBox_numero_value_buy.Text = "";
                Label_prace.Visible = false;
        }
    }
}