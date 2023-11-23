using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class P_edit_visit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 3)
            {
                Response.Redirect("P_error.aspx");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_tour"] = DropDownList1.SelectedValue;
        }

        protected void GridView_visit_SelectedIndexChanged(object sender, EventArgs e)
        {            
            Session["id_visit"] = GridView_visit.SelectedRow.Cells[1].Text;
            Session["date_bigin"] = GridView_visit.SelectedRow.Cells[2].Text;
            Session["date_end"] = GridView_visit.SelectedRow.Cells[3].Text;
            Session["duree"] = GridView_visit.SelectedRow.Cells[4].Text;
            Session["id_status_visit"] = GridView_visit.SelectedRow.Cells[6].Text;
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            
        }

        protected void Button_new_visit_Click(object sender, EventArgs e)
        {
            if (TextBox_date_bigin.Text==""||TextBox_date_end.Text==""||
                TextBox_free_place.Text==""||
                Convert.ToString(DropDownList_id_tour.SelectedValue) =="") 
            {
                Label_error_new_visit.Text = "Уберите пустые значения"; 
                Label_error_new_visit.Visible = true; 
            }
            else 
            {
                try
                {
                    
                    SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
                    connection.Open();
                    SqlCommand command_insert_user = new SqlCommand("INSERT INTO [visit] ([date_bigin], [date_end], [free_place], [id_tour], [id_status_visit]) VALUES (@date_bigin, @date_end, @free_place, @id_tour, @id_status_visit)", connection);
                    command_insert_user.Parameters.Add(new SqlParameter("@date_bigin", Convert.ToString(TextBox_date_bigin.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@date_end", Convert.ToString(TextBox_date_end.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@free_place", Convert.ToInt32(TextBox_free_place.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@id_tour", Convert.ToInt32(DropDownList_id_tour.SelectedValue)));
                    command_insert_user.Parameters.Add(new SqlParameter("@id_status_visit", 1));
                    command_insert_user.ExecuteNonQuery();
                    connection.Close();
                    Response.Redirect("P_edit_visit.aspx");
                }
                catch 
                {
                    Label_error_new_visit.Text = "Ошибка при отправке данных";
                    Label_error_new_visit.Visible = true;
                }
            }
        }

        protected void DropDownList_id_tour_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_tour_d"] = DropDownList_id_tour.SelectedValue;
            SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
            connection.Open();
            SqlCommand command_aut = new SqlCommand("Select duree from tour WHERE id_tour=@ID_tour", connection);
            command_aut.Parameters.Add(new SqlParameter("@ID_tour", Convert.ToInt32(Session["ID_tour_d"])));
            SqlDataReader reader = command_aut.ExecuteReader();
            if (reader.Read())
            {
                Label_duree.Text = "Общая продложительность тура: " + reader[0] + " дней";
            }
            reader.Close();
        }
    }
}