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
    public partial class P_editor_booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 3)
            {
                Response.Redirect("P_error.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_booking"]= GridView1.SelectedRow.Cells[1].Text;
            Label_edit.Text = "Вы выбрали заявку на бронь №" + Convert.ToString(Session["ID_booking"]);
            Label_edit.Visible = true;
            Label_edit_about.Visible = true;
            DropDownList1.Visible = true;
            Button_edit_new_status.Visible = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_status"]= DropDownList1.SelectedValue;
        }

        protected void Button_edit_new_status_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-DP46M5TA;Initial Catalog=tour_firm;Integrated Security=True");
                connection.Open();
                SqlCommand command = new SqlCommand("UPDATE [booking] SET [id_status_booking]=@ID_status WHERE ([ID_booking] = @ID_booking)", connection);
                command.Parameters.Add(new SqlParameter("@ID_status", Convert.ToInt32(Session["ID_status"]))); 
                command.Parameters.Add(new SqlParameter("@ID_booking", Convert.ToInt32(Session["ID_booking"])));            
                command.ExecuteNonQuery();
                connection.Close();


                Label_error_edit.Text = "Статус успешно изменен";                
                Label_error_edit.Visible = true;
                Response.Redirect("P_editor_booking.aspx");

            }
            catch 
            {
            Label_error_edit.Text = "ОШибка при выполнении запроса!";
            Label_error_edit.Visible = true;
            }
        }
    }    
}