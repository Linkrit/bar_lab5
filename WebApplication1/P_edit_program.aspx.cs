using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class P_edit_program : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 3)
            {
                Response.Redirect("P_error.aspx");
            }
        }

        protected void DropDownList_tour_select_id_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_tour"] = DropDownList_tour_select_id.SelectedValue;            
            SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
            connection.Open();
            SqlCommand command_aut = new SqlCommand("Select duree from tour WHERE id_tour=@ID_tour", connection);
            command_aut.Parameters.Add(new SqlParameter("@ID_tour", Convert.ToInt32(Session["ID_tour"])));            
            SqlDataReader reader = command_aut.ExecuteReader();
            if (reader.Read()) 
            {
                Label_numer_day_all.Text = "Общая продложительность тура: " + reader[0] + " дней";
            }
            reader.Close();

        }

        protected void Button_add_program_Click(object sender, EventArgs e)
        {
            if (TextBox_numer_list.Text == "" || TextBox_numero_dey.Text == "")
            {
                Label_error_add.Text = "Уберите пустые значения";
                Label_error_add.Visible = true;
            }
            else
            {
                try
                {

                    SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
                    connection.Open();
                    SqlCommand command_insert_user = new SqlCommand("INSERT INTO [program_tour] ([numer_list], [numer_day], [id_hotel], [id_tour]) VALUES (@numer_list, @numer_day, @id_hotel, @id_tour)", connection);
                    command_insert_user.Parameters.Add(new SqlParameter("@numer_list", Convert.ToInt32(TextBox_numer_list.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@numer_day", Convert.ToInt32(TextBox_numero_dey.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@id_hotel", Convert.ToInt32(DropDownList_hotel.SelectedValue)));
                    command_insert_user.Parameters.Add(new SqlParameter("@id_tour", Convert.ToInt32(Session["ID_tour"])));                    
                    command_insert_user.ExecuteNonQuery();
                    connection.Close();
                    Response.Redirect("P_edit_program.aspx");
                }
                catch(Exception)
                {                   
                    Label_error_add.Text = "Ошибка при выполнении запроса";
                    Label_error_add.Visible = true;
                }
            }
        }

        protected void DropDownList_hotel_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_hotel"] = DropDownList_hotel.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_id_program_tour"] = GridView1.SelectedRow.Cells[1].Text;
            Session["numer_list"] = GridView1.SelectedRow.Cells[2].Text;
            Session["numer_day"] = GridView1.SelectedRow.Cells[3].Text;
            Session["id_hotel"] = GridView1.SelectedRow.Cells[4].Text;
            Session["id_tour"] = GridView1.SelectedRow.Cells[6].Text;
        }
    }
}