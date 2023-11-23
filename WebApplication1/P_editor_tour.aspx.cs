using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class P_editor_tour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 3)
            {
                Response.Redirect("P_error.aspx");
            }
        }

        protected void Button_new_tour_add_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(TextBox_inf_tour_add.Text)==""|| Convert.ToString(Session["ID_type_tour_add"])==""||
                Convert.ToString(TextBox_prace_add.Text)==""|| Convert.ToString(TextBox_duree_add.Text)==""||
                Convert.ToString(TextBox_name_tour_add.Text)=="") 
            {
                Label_Error.Text = "Не все поля заполнены";
                Label_Error.Visible = true;
            }
            else {
                try
                {
                    SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
                    connection.Open();
                    SqlCommand command_insert_user = new SqlCommand("INSERT INTO [tour] ([information], [id_type_tour], [price], [duree], [name_tour]) VALUES (@information, @id_type_tour, @price, @duree, @name_tour)", connection);
                    command_insert_user.Parameters.Add(new SqlParameter("@information", Convert.ToString(TextBox_inf_tour_add.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@id_type_tour", Convert.ToInt32(Session["ID_type_tour_add"])));
                    command_insert_user.Parameters.Add(new SqlParameter("@price", Convert.ToInt32(TextBox_prace_add.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@duree", Convert.ToInt32(TextBox_duree_add.Text)));
                    command_insert_user.Parameters.Add(new SqlParameter("@name_tour", Convert.ToString(TextBox_name_tour_add.Text)));
                    command_insert_user.ExecuteNonQuery();
                    connection.Close();
                    Response.Redirect("P_editor_tour.aspx");
                }
                catch 
                {
                    Label_Error.Text = "Ошибка при обработке запроса";
                    Label_Error.Visible = true;
                }
            }
        }

        protected void DropDownList_id_type_tour_add_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_type_tour_add"]=DropDownList_id_type_tour_add.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["id_tour"] = GridView1.SelectedRow.Cells[1].Text;
            Session["information"] = GridView1.SelectedRow.Cells[2].Text;
            Session["price"] = GridView1.SelectedRow.Cells[4].Text;
            Session["duree"] = GridView1.SelectedRow.Cells[5].Text;
            Session["name_tour"] = GridView1.SelectedRow.Cells[6].Text;
        }
    }
}