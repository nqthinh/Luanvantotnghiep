using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NKCH.myclass;

namespace NKCH
{
    public partial class loaihinh : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            TaoMoiAnButton();
            ResetNoiDung();
            txtid.Text = tm.taomangaunhien("LH");
        }
        private void TaoMoiAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = false;
            btnThem.Visible = false;
            txtid.ReadOnly = true;
            txtten.ReadOnly = false;
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            if (btnThem.Visible == false && btnxoa.Visible == false)
            {
                Sqldsloaihinh.Insert();
            }
            else
            {
                Sqldsloaihinh.Update();
            }
            XoaAnButton();
            ResetNoiDung();
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
            btnThem.Visible = true;
            txtid.ReadOnly = true;
            txtten.ReadOnly = true;
        }

        private void ResetNoiDung()
        {
            txtid.Text = "";
            txtten.Text = "";
        }
        protected void btnxoa_Click(object sender, EventArgs e)
        {
            Sqldsloaihinh.Delete();
            ResetNoiDung();
            XoaAnButton();
        }
        private void XoaAnButton()
        {
            btncapnhat.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnThem.Visible = true;
            txtid.ReadOnly = true;
            txtten.ReadOnly = true;
        }

        private void ChonAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = true;
            btnThem.Visible = false;
            txtid.ReadOnly = true;
            txtten.ReadOnly = false;
        }

        protected void GVDSLoaihinh_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow rowSelected = ((Sqldsloaihinh.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GVDSLoaihinh.SelectedIndex];
            //Gan noi dung den tung text box
            txtid.Text = rowSelected.ItemArray[0].ToString();
            txtten.Text = rowSelected.ItemArray[1].ToString();
            ChonAnButton();
        }
    }
}