using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class P_admin_lc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) == 0) 
            {
                Response.Redirect("P_error.aspx");
            }
            String user_role;
            if (Convert.ToInt32(Session["ID_role"]) == 1)
            {
                user_role = "администратор";
            }
            else if (Convert.ToInt32(Session["ID_role"]) == 3)
            {
                user_role = "менеджер";
            }
            else 
            {
                user_role = "пользователь";
            }
            Label_bonjour.Text = "Здравствуй, " + user_role + "!";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["PR_pasword"] = GridView1.SelectedRow.Cells[1].Text;
            Session["PR_login"] = GridView1.SelectedRow.Cells[2].Text;
            Session["PR_mail"] = GridView1.SelectedRow.Cells[3].Text;
            Session["PR_numer_telephone"] = GridView1.SelectedRow.Cells[4].Text;
            Session["PR_last_name"] = GridView1.SelectedRow.Cells[5].Text;
            Session["PR_first_name"] = GridView1.SelectedRow.Cells[6].Text;
            Session["PR_surname"] = GridView1.SelectedRow.Cells[7].Text;
        }
    }
}