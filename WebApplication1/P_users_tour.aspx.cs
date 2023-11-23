using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class P_users_tour : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_role"]) != 2)
            {
                Response.Redirect("P_error.aspx");
            }
        }
        //select status booking
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_status_booking"] = DropDownList1.SelectedValue;
        }
        //stlect status visit
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID_status_visit"] = DropDownList2.SelectedValue;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["NAME_tour"] = GridView1.SelectedRow.Cells[1].Text;
        }
    }
}