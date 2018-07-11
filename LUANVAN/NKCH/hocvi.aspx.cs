using NKCH.myclass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NKCH
{
    public partial class hocvi1 : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            TaoMoiAnButton();
            ResetNoiDung();
            txtHVID.Text = tm.taomangaunhien("HV");
        }

        private void TaoMoiAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = false;
            btnthem.Visible = false;
            txtHVTen.ReadOnly = false;
            txtHVID.ReadOnly = true;
        }

        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            if(btnthem.Visible ==false && btnxoa.Visible == false)
            {
                sqldsHocVi.Insert();
            }
            else
            {
                sqldsHocVi.Update();
            }
            XoaAnButton();
            ResetNoiDung();
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            sqldsHocVi.Delete();
            ResetNoiDung();
            XoaAnButton();
        }

        private void XoaAnButton()
        {
            btncapnhat.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtHVTen.ReadOnly = true;
            txtHVID.ReadOnly = true;
        }

        protected void btnhuy_Click(object sender, EventArgs e)
        {
            ResetNoiDung();
            HuyAnButton();
        }

        private void HuyAnButton()
        {
            btncapnhat.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtHVTen.ReadOnly = true;
            txtHVID.ReadOnly = true;
        }

        private void ResetNoiDung()
        {
            txtHVID.Text = "";
            txtHVTen.Text = "";
        }

        protected void gvDSGiangVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvDSHocVi.SelectedRow;
            txtHVID.Text = row.Cells[1].Text;
            txtHVTen.Text = row.Cells[2].Text;
            ChonAnButton();
        }

        private void ChonAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = true;
            btnthem.Visible = false;
            txtHVTen.ReadOnly = false;
            txtHVID.ReadOnly = true;
        }
    }
}