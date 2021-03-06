﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NKCH
{
	public partial class danhsachgiahandetai : System.Web.UI.Page
	{
		int vitri;
		protected void Page_Load(object sender, EventArgs e)
        {
            AnButton();
        }

        private void AnButton()
        {
            btnChiTiet.Visible = false;
            btnXoa.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow rowSelected = ((SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView).ToTable()).Rows[GridView1.SelectedIndex];
            vitri = GridView1.SelectedIndex;
            txtid.Text = rowSelected.ItemArray[0].ToString();
            txtidtm.Text = rowSelected.ItemArray[1].ToString();
            txtTenDetai.Text = rowSelected.ItemArray[8].ToString();
            btnChiTiet.Visible = true;
            btnXoa.Visible = true;
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            XoaTest();
        }

        private void XoaTest()
        {
            txtid.Text = "";
            txtidtm.Text = "";
            txtTenDetai.Text = "";
        }

        protected void btnChiTiet_Click(object sender, EventArgs e)
        {
            Session["mauGiaHan"] = txtidtm.Text;
            Response.Redirect("mauGiaHan.aspx");
        }
    }
}