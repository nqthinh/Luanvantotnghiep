using NKCH.myclass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NKCH
{
    public partial class mainpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["dangnhap"] == null)
                {
                    Response.Redirect("~/dangnhap.aspx");
                }
                lbuser.Text = ((dangnhapnguoidung)Session["dangnhap"]).cb_hoten;
                if (((dangnhapnguoidung)Session["dangnhap"]).vaitro.Equals("Cán bộ"))
                {
                    hpdsdetai.Visible = true;
                    hpthoigiandangky.Visible = true;
                    hpdsthuyetminh.Visible = true;
                    hpdsgiahan.Visible = true;
                    hpdsdungthuchien.Visible = true;
                }
                else if (((dangnhapnguoidung)Session["dangnhap"]).vaitro.Equals("Giảng viên"))
                {
                    hpdexuatdetai.Visible = true;
                    hpdetaicanhan.Visible = true;
                    hpthuyetminhdetai.Visible = true;
                }
                else
                {
                    hpdskhoa.Visible = true;
                    hphocvi.Visible = true;
                    hpdschucvu.Visible = true;
                    hpdslinhvuc.Visible = true;
                    hpdsloaihinh.Visible = true;
                    hpdsgiangvien.Visible = true;
                }
            }   
        }

        protected void btndangxuat_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Session.Remove("hoten");
            Response.Redirect("~/dangnhap.aspx");
        }
    }
}