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
    public partial class linhvuc : System.Web.UI.Page
    {
        taoma tm = new taoma();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnthem_Click(object sender, EventArgs e)
        {
            TaoMoiAnButton();
            ResetNoiDung();
            txtid.Text = tm.taomangaunhien("LV");
        }
        private void TaoMoiAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = false;
            btnthem.Visible = false;
            txtid.ReadOnly = true;
            txtten.ReadOnly = false;
        }
        protected void btncapnhat_Click(object sender, EventArgs e)
        {

            if (btnthem.Visible == false && btnxoa.Visible == false)
            {
                Sqldslinhvuc.Insert();
            }
            else
            {
                Sqldslinhvuc.Update();
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
            btnthem.Visible = true;
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
            Sqldslinhvuc.Delete();
            ResetNoiDung();
            XoaAnButton();
        }
        private void XoaAnButton()
        {
            btncapnhat.Visible = false;
            btnhuy.Visible = false;
            btnxoa.Visible = false;
            btnthem.Visible = true;
            txtid.ReadOnly = true;
            txtten.ReadOnly = true;
        }

        private void ChonAnButton()
        {
            btncapnhat.Visible = true;
            btnhuy.Visible = true;
            btnxoa.Visible = true;
            btnthem.Visible = false;
            txtid.ReadOnly = true;
            txtten.ReadOnly = false;
        }

        protected void GVDSLinhvuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow rowSelected = ((Sqldslinhvuc.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GVDSLinhvuc.SelectedIndex];
            //Gan noi dung den tung text box
            txtid.Text = rowSelected.ItemArray[0].ToString();
            txtten.Text = rowSelected.ItemArray[1].ToString();
            ChonAnButton();
        }
    }
}