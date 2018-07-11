using NKCH.myclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NKCH
{
    public partial class taomatkhau : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != "admin")
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}