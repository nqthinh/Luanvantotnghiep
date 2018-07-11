<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.Master" AutoEventWireup="true" CodeBehind="dexuatdetaicapnhat.aspx.cs" Inherits="NKCH.dexuatdetaicapnhat" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="panel panel-default">

		<div class="panel-heading">
			Đề xuất đề tài	
			<br />
			<div style="padding: 10px 0px 0px 0px;">
				<p class="text-left">
					<asp:Button ID="btnluu" runat="server" Text="Lưu đề tài" class="btn btn-space btn-success" OnClick="btnluu_Click" />
					<asp:Button ID="btndanhsach" runat="server" Text="Đến danh sách đề tài" class="btn btn-space btn-danger hover" OnClick="btndanhsach_Click" />
				</p>
			</div>
		</div>

		<div class="tab-container">

			<ul class="nav nav-tabs nav-tabs-success">
				<li class="active"><a href="#tab1" data-toggle="tab">Tổng quan</a></li>
				<li><a href="#tab2" data-toggle="tab">Tính cấp thiết</a></li>
				<li><a href="#tab3" data-toggle="tab">Mục tiêu</a></li>
				<li><a href="#tab4" data-toggle="tab">Nội dung</a></li>
				<li><a href="#tab5" data-toggle="tab">Sản phẩm & Hiệu quả</a></li>
				<li><a href="#tab6" data-toggle="tab">Thành viên</a></li>
				<li><a href="#tab7" data-toggle="tab">Kinh phí</a></li>
			 </ul>

			<div class="tab-content">
				<div id="tab1" class="tab-pane active cont">
					<div class="panel panel-default">
						<div class="form-horizontal group-border-dashed">
							<div class="form-group">
								<label class="col-sm-3 control-label">Mã đề tài</label>
								<div class="col-sm-6">
									<asp:TextBox ID="txtMaDeTai" class="form-control input-sm" runat="server" Width="100%" ReadOnly="True"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Tên đề tài</label>
								<div class="col-sm-6">
									<asp:TextBox ID="txtTenDeTai" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Thời gian thực hiện</label>
								<div class="col-sm-6">
									<asp:TextBox ID="txtThoiGianThucHien" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Lĩnh vực nghiên cứu</label>
								<div class="col-sm-6">
									<asp:CheckBoxList ID="chkLVNC" runat="server" DataSourceID="sqldsLVNC" CellPadding="35" CellSpacing="25" CssClass="be-checkbox" DataTextField="LV_TEN" DataValueField="LV_ID" RepeatColumns="2" OnDataBinding="chkLVNC_DataBinding" OnDataBound="chkLVNC_DataBound"></asp:CheckBoxList>
								</div>
								<asp:SqlDataSource ID="sqldsLVNC" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommandType="StoredProcedure" SelectCommand="LINHVUC_NC_SELECT_ALL"></asp:SqlDataSource>
							</div>
						</div>
					</div>
				</div>
				<div id="tab2" class="tab-pane cont">
					<CKEditor:CKEditorControl ID="ckeTinhCapThiet" runat="server" Toolbar="Maximize|Bold|Italic|Underline|Strike|-|Subscript|Superscript|NumberedList|BulletedList|-|Outdent|Indent|JustifyLeft|JustifyRight|JustifyBlock|Print|SpellChecker|Undo|Redo|-|Find|Replace|
						/
						Styles|Format|Font|FontSize|TextColor|BGColor" Height="350px" DefaultLanguage="vi" FullPage="True" Language="vi" ResizeMinHeight="450"></CKEditor:CKEditorControl>
				</div>
				<div id="tab3" class="tab-pane cont">
					<CKEditor:CKEditorControl ID="ckeMucTieu" runat="server" Toolbar="Maximize|Bold|Italic|Underline|Strike|-|Subscript|Superscript|NumberedList|BulletedList|-|Outdent|Indent|Print|SpellChecker|Undo|Redo|-|Find|Replace|
						/
						Styles|Format|Font|FontSize|TextColor|BGColor" Height="350px" DefaultLanguage="vi" FullPage="True" Language="vi" ResizeMinHeight="450"></CKEditor:CKEditorControl>
				</div>
				<div id="tab4" class="tab-pane cont">
					<CKEditor:CKEditorControl ID="ckeNoiDung" runat="server" Toolbar="Maximize|Bold|Italic|Underline|Strike|-|Subscript|Superscript|NumberedList|BulletedList|-|Outdent|Indent|Print|SpellChecker|Undo|Redo|-|Find|Replace|
						/
						Styles|Format|Font|FontSize|TextColor|BGColor" Height="350px" DefaultLanguage="vi" FullPage="True" Language="vi" ResizeMinHeight="450"></CKEditor:CKEditorControl>
				</div>
				<div id="tab5" class="tab-pane cont">
					<div class="panel panel-default">
						<div class="form-horizontal group-border-dashed">
							<div role="alert" class="alert alert-success alert-icon alert-dismissible">
								<div class="icon"><span class="mdi mdi-info-outline"></span></div>
								<div class="message">
									<strong>Sản phẩm</strong>
								</div>
							</div>
							<CKEditor:CKEditorControl ID="ckeSanPham" runat="server" Toolbar="Maximize|Bold|Italic|Underline|Strike|-|Subscript|Superscript|NumberedList|BulletedList|-|Outdent|Indent|Print|SpellChecker|Undo|Redo|-|Find|Replace|
								/
								Styles|Format|Font|FontSize|TextColor|BGColor"  DefaultLanguage="vi" FullPage="True" Language="vi" ResizeMinHeight="450"></CKEditor:CKEditorControl>
						</div>
						<hr />
						<div class="form-horizontal group-border-dashed">
							<div role="alert" class="alert alert-success alert-icon alert-dismissible">
								<div class="icon"><span class="mdi mdi-info-outline"></span></div>
								<div class="message">
									<strong>Hiệu quả dự kiến</strong>
								</div>
							</div>
							<CKEditor:CKEditorControl ID="ckeHieuQua" runat="server" Toolbar="Maximize|Bold|Italic|Underline|Strike|-|Subscript|Superscript|NumberedList|BulletedList|-|Outdent|Indent|Print|SpellChecker|Undo|Redo|-|Find|Replace|
								/
								Styles|Format|Font|FontSize|TextColor|BGColor" DefaultLanguage="vi" FullPage="True" Language="vi" ResizeMinHeight="450"></CKEditor:CKEditorControl>
						</div>
					</div>
				</div>

				<div id="tab6" class="tab-pane cont">
					<%--<div class="panel panel-default">
						<div class="form-horizontal group-border-dashed">
							<div class="form-group">
								<label class="col-sm-3 control-label">Mã CB/GV/SV</label>
								<div class="col-sm-6">
									<asp:TextBox ID="txtMaCB" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Họ tên</label>
								<div class="col-sm-6">
									<asp:TextBox ID="txtHoTen" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Email: </label>
								<div class="col-sm-6">
									<asp:TextBox ID="txtemail" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Vị trí</label>
								<div class="col-sm-6">
									<asp:DropDownList ID="ddlVitri" runat="server" class="form-control input-sm">
										<asp:ListItem Selected="True">Chủ nhiệm đề tài</asp:ListItem>
										<asp:ListItem>Thành viên</asp:ListItem>
									</asp:DropDownList>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"></label>
							<div class="col-sm-6">
									<asp:Button ID="btnthem" runat="server" Text="Thêm" Width="100%" class="btn btn-space btn-primary" OnClick="btnthem_Click" />
							</div>
						</div>
					</div>
					<hr />--%>
					<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaNV" Font-Size="Medium" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" GridLines="None" Width="100%" OnRowDeleting="GridView1_RowDeleting">
						<Columns>
							<asp:BoundField DataField="MaNV" HeaderText="Mã CB/GV/SV" />
							<asp:BoundField DataField="HoTen" HeaderText="Họ tên" />
							<asp:BoundField DataField="vitri" HeaderText="Vị trí" />
							<asp:BoundField DataField="Email" HeaderText="Email" />
							<asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-space btn-danger" DeleteText="Xóa" ShowDeleteButton="True" />
						</Columns>
						
					</asp:GridView>
				</div>

				<div id="tab7" class="tab-pane cont">
					<div class="form-horizontal group-border-dashed">
						<div class="form-group">
							<label class="col-sm-3 control-label">Giờ NCKH</label>
							<div class="col-sm-6">
								<asp:TextBox ID="txtGioNCKH" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Kinh phí</label>
							<div class="col-sm-6">
								<asp:TextBox ID="txtKinhPhi" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Ngân sách trường</label>
							<div class="col-sm-6">
								<asp:TextBox ID="txtNganSachTruong" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Các nguồn kinh phí khác</label>
							<div class="col-sm-6">
								<asp:TextBox ID="txtCacNguonKPKhac" class="form-control input-sm" runat="server" Width="100%"></asp:TextBox>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
</asp:Content>
