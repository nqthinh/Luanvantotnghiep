<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mauThuyetMinh.aspx.cs" Inherits="NKCH.mauThuyetMinh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<style type="text/css">
		.auto-style2 {
			width: 330px;
			text-align: center;
		}
		.auto-style3 {
			text-align: right;
		}
		.auto-style4 {
			text-align: center;
			height: 65px;
			font-size: large;
		}
		.auto-style5 {
			width: 365px;
		}
		.auto-style6 {
			width: 365px;
			height: 51px;
		}
		.auto-style7 {
			height: 51px;
		}
		.auto-style8 {
			width: 365px;
			height: 82px;
		}
		.auto-style9 {
			height: 82px;
		}
		.auto-style10 {
			width: 100%;
		}
		.auto-style11 {
			text-align: center;
			height: 207px;
		}
		.auto-style12 {
			width: 365px;
			text-align: center;
			height: 71px;
		}
		.auto-style13 {
			text-align: center;
			height: 71px;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        	<table style="width:100%;">
				<tr>
					<td class="auto-style2"><strong>TRƯỜNG ĐẠI HỌC
						<br />
						KỸ THUẬT – CÔNG NGHỆ CẦN THƠ
						<br />
						ĐƠN VỊ:</strong> <strong>
						<asp:Label ID="lbDonVi" runat="server" Text="lbDonVi"></asp:Label>
						</strong></td>
					<td>&nbsp;</td>
					<td class="auto-style3"><strong>CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
						Độc lập - Tự do - Hạnh phúc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
				</tr>
				<tr>
					<td class="auto-style4" colspan="3"><strong>THUYẾT MINH ĐỀ TÀI KHOA HỌC VÀ CÔNG NGHỆ CẤP CƠ SỞ</strong></td>
				</tr>
			</table>
        </div>
    	<table class="auto-style10" border="1">
			<tr>
				<td class="auto-style6" style="border: 1px solid #000000; vertical-align: top"><strong>1. TÊN ĐỀ TÀI (In đậm, viết thường)<br />
					<asp:Label ID="lbTenDeTai" runat="server" Text="lbTenDeTai"></asp:Label>
					</strong></td>
				<td class="auto-style7" style="border: 1px solid #000000; vertical-align: top"><strong>2. MÃ SỐ:</strong></td>
			</tr>
			<tr>
				<td class="auto-style8" style="border: 1px solid #000000; vertical-align: top"><strong>3. LĨNH VỰC NGHIÊN CỨU
					<asp:CheckBoxList ID="chkLVNC" runat="server" DataSourceID="SqlDataSource1" DataTextField="LV_TEN" DataValueField="LV_ID" Enabled="False" RepeatColumns="2" OnDataBound="chkLVNC_DataBound">
					</asp:CheckBoxList>
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="LINHVUC_NC_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
					</strong></td>
				<td class="auto-style9" style="border: 1px solid #000000; vertical-align: top"><strong>4. LOẠI HÌNH NGHIÊN CỨU<asp:CheckBoxList ID="chkLHNC" runat="server" DataSourceID="SqlDataSource2" DataTextField="LH_TEN" DataValueField="LH_ID" Enabled="False" RepeatColumns="1" OnDataBound="chkLHNC_DataBound">
					</asp:CheckBoxList>
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="LOAIHINH_NC_SELECT_ALL" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>5. THỜI GIAN THỰC HIỆN:
					</strong>
					<asp:Label ID="lbTGTH" runat="server" Text="lbTGTH"></asp:Label>
					</td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>6. CƠ QUAN CHỦ TRÌ ĐỀ TÀI </strong>
					<br />
					Tên cơ quan: <strong>
					<asp:Label ID="lbCQCT" runat="server" Text="lbCQCT"></asp:Label>
					</strong>
					<br />
					Điện thoại: <strong>
					<asp:Label ID="lbDTCQCT" runat="server" Text="lbDTCQCT"></asp:Label>
					</strong>
					<br />
					Địa chỉ: <strong>
					<asp:Label ID="lbDCCQCT" runat="server" Text="lbDCCQCT"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border-style: solid solid none solid; border-width: 1px; border-color: #000000; vertical-align: top" colspan="2"><strong>7. CHỦ NHIỆM ĐỀ TÀI </strong></td>
			</tr>
			<tr>
				<td class="auto-style5" style="border-style: none none solid solid; border-width: 1px; border-color: #000000; vertical-align: top">Họ và tên: <strong>
					<asp:Label ID="lbTenCNDT" runat="server" Text="lbTenCNDT"></asp:Label>
					</strong>
					<br />
					Chức danh khoa học: <strong>
					<asp:Label ID="lbChucDanh" runat="server" Text="lbChucDanh"></asp:Label>
					</strong>
					<br />
					Đơn vị công tác: <strong>
					<asp:Label ID="lbDVCT" runat="server" Text="lbDVCT"></asp:Label>
					</strong>
					<br />
					E-mail: <strong>
					<asp:Label ID="lbEmail" runat="server" Text="lbEmail"></asp:Label>
					</strong></td>
				<td style="border-style: none solid solid none; border-width: 1px; border-color: #000000; vertical-align: top">Học vị: <strong>
					<asp:Label ID="lbHocVi" runat="server" Text="lbHocVi"></asp:Label>
					</strong>
					<br />
					Năm sinh: <strong>
					<asp:Label ID="lbNamSinh" runat="server"></asp:Label>
					</strong>
					<br />
					Số điện thoại: <strong>
					<asp:Label ID="lbSDT" runat="server" Text="lbSDT"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>8. NHỮNG THÀNH VIÊN THAM GIA NGHIÊN CỨU ĐỀ TÀI</strong><br />
					<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="DKDT_THANHVIEN_SELECTDETAI_CHITIET" SelectCommandType="StoredProcedure">
						<SelectParameters>
							<asp:SessionParameter Name="TMDT_ID" SessionField="mathuyetminh" Type="String" />
						</SelectParameters>
					</asp:SqlDataSource>
					<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
						<AlternatingRowStyle BackColor="#CCCCCC" />
						<Columns>
							<asp:BoundField DataField="DKDTTV_MANV" HeaderText="Mã" SortExpression="DKDTTV_MANV" />
							<asp:BoundField DataField="DKDTTV_HOTEN" HeaderText="Họ tên" SortExpression="DKDTTV_HOTEN" />
							<asp:BoundField DataField="DKDTTV_EMAIL" HeaderText="Email" SortExpression="DKDTTV_EMAIL" />
							<asp:BoundField DataField="DKDTTV_VITRI" HeaderText="Vị trí" SortExpression="DKDTTV_VITRI" />
						</Columns>
						<FooterStyle BackColor="#CCCCCC" />
						<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
						<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
						<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
						<SortedAscendingCellStyle BackColor="#F1F1F1" />
						<SortedAscendingHeaderStyle BackColor="#808080" />
						<SortedDescendingCellStyle BackColor="#CAC9C9" />
						<SortedDescendingHeaderStyle BackColor="#383838" />
					</asp:GridView>
				</td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>9. TỔNG QUAN TÌNH HÌNH NGHIÊN CỨU THUỘC LĨNH VỰC CỦA ĐỀ TÀI Ở TRONG VÀ NGOÀI NƯỚC </strong>
					<br />
					9.1. Ngoài nước (phân tích, đánh giá mức độ thành công, hạn chế của các công trình có liên quan ngoài nước và những kết quả nghiên cứu mới nhất trong lĩnh vực nghiên cứu của đề tài, liệt kê danh mục các công trình nghiên cứu, tài liệu có liên quan đến đề tài được trích dẫn)
					<br />
					<strong>
					<asp:Label ID="lbNgoaiNuoc" runat="server" Text="lbNgoaiNuoc"></asp:Label>
					</strong>
					<br />
					9.2. Trong nước (phân tích, đánh giá tình hình nghiên cứu thuộc lĩnh vực của đề tài ở Việt Nam, liệt kê danh mục các công trình nghiên cứu, tài liệu có liên quan đến đề tài được trích dẫn)
					<br />
					<strong>
					<asp:Label ID="lbTrongNuoc" runat="server" Text="lbTrongNuoc"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>10. TÍNH CẤP THIẾT CỦA ĐỀ TÀI (</strong>Trên cơ sở tổng quan tình hình NC hạn chế của các công trình đã có, vấn đề các công trình chưa đề cập đến của phần Tổng quan, nêu sự cần thiết tính cấp bách, ý nghĩa lý luận và thực tiễn của đề tài, nêu rõ cơ sở cho việc cụ thể hoá mục tiêu và những định hướng nội dung chính cần thực hiện trong đề tài)<br />
					<strong>
					<asp:Label ID="lbTinhCapThiet" runat="server" Text="lbTinhCapThiet"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>11. MỤC TIÊU ĐỀ TÀI</strong> (cần ghi một cách cụ thể, rõ ràng, có thể định lượng hoặc định tính được; có tính khả thi; không viết mục tiêu quá rộng hoặc quá nhiều mục tiêu trong một đề tài)<br />
					<strong>
					<asp:Label ID="lbMucTieu" runat="server" Text="lbMucTieu"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>12. ĐỐI TƯỢNG, PHẠM VI NGHIÊN CỨU </strong>
					<br />
					12.1. Đối tượng nghiên cứu
					<br />
					<strong>
					<asp:Label ID="lbDTNC" runat="server" Text="lbDTNC"></asp:Label>
					</strong>
					<br />
					12.2. Phạm vi nghiên cứu
					<br />
					<strong>
					<asp:Label ID="lbPVNC" runat="server" Text="lbPVNC"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>13. CÁCH TIẾP CẬN, PHƯƠNG PHÁP NGHIÊN CỨU </strong>
					<br />
					13.1. Cách tiếp cận (Nêu rõ cách tiếp cận nghiên cứu đề tài. VD: (1) nghiên cứu lý thuyết-thử nghiệm-ứng dụng; (2) Giải pháp công nghệ (sản phẩm tiêu chuẩn) - thiết kế quy trình công nghệ - chế tạo; (3) Lý thuyết-thực trạng =&gt; giải pháp; (4) Thực trạng-lý thuyết =&gt; giải pháp)
					<br />
					<strong>
					<asp:Label ID="lbCachTC" runat="server" Text="lbCachTC"></asp:Label>
					</strong>
					<br />
					13.2. Phương pháp nghiên cứu (Nêu rõ phương pháp nghiên cứu: Điều tra, thống kê, tổng hợp, phân tích, so sánh, chuyên gia,…và kỹ thuật sử dụng các phương pháp)
					<br />
					<strong>
					<asp:Label ID="lbPPNC" runat="server" Text="lbPPNC"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>15. NỘI DUNG NGHIÊN CỨU VÀ TIẾN ĐỘ THỰC HIỆN
					<br />
					</strong>Nội dung nghiên cứu (trình bày dưới dạng đề cương nghiên cứu chi tiết) Xác định những nội dung nghiên cứu rõ ràng, có tính hệ thống, logíc, phù hợp cần thực hiện để đạt được mục tiêu đề ra)
					<br />
					<strong>
					<asp:Label ID="lbNoiDung" runat="server" Text="lbNoiDung"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>16. SẢN PHẨM (đánh dấu vào bảng phân loại sản phẩm)
					<br />
					</strong>16.1. Sản phẩm khoa học
					<asp:CheckBoxList ID="chkspkh" runat="server" RepeatColumns="2" CssClass="be-checkbox" Width="90%" >
										<asp:ListItem>Sách chuyên</asp:ListItem>
										<asp:ListItem>Sách tham khảo</asp:ListItem>
										<asp:ListItem>Giáo trình</asp:ListItem>
										<asp:ListItem>BB đăng tạp chí nước ngoài</asp:ListItem>
										<asp:ListItem>BB đăng tạp chí trong nước</asp:ListItem>
										<asp:ListItem>BB đăng kỷ yếu HN, HTQT</asp:ListItem>
									</asp:CheckBoxList>
					16.2. Sản phẩm đào tạo&nbsp;
					<asp:CheckBoxList ID="chkspdt" runat="server" RepeatColumns="2" CssClass="be-checkbox" >
										<asp:ListItem>Nghiên cứu sinh</asp:ListItem>
										<asp:ListItem>Cao học</asp:ListItem>
										<asp:ListItem>Đại học</asp:ListItem>
									</asp:CheckBoxList>
					16.3. Sản phẩm ứng dụng
					<asp:CheckBoxList ID="chkspud" runat="server" RepeatColumns="2" CssClass="be-checkbox" >
										<asp:ListItem>Nghiên cứu sinh</asp:ListItem>
										<asp:ListItem>Cao học</asp:ListItem>
										<asp:ListItem>Đại học</asp:ListItem>
									</asp:CheckBoxList>
					</td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>17. HIỆU QUẢ (giáo dục và đào tạo, kinh tế - xã hội)
					<br />
					<asp:Label ID="lbHieuQua" runat="server" Text="lbHieuQua"></asp:Label>
					<br />
					18. PHƯƠNG THỨC CHUYỂN GIAO KẾT QUẢ NGHIÊN CỨU VÀ ĐỊA CHỈ ỨNG DỤNG
					<br />
					<asp:Label ID="lbChuyenGiao" runat="server" Text="lbChuyenGiao"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td style="border: 1px solid #000000; vertical-align: top" colspan="2"><strong>19. KINH PHÍ THỰC HIỆN ĐỀ TÀI VÀ NGUỒN KINH PHÍ </strong>
					<br />
					Tổng kinh phí: <strong>
					<asp:Label ID="lbKInhPhi" runat="server" Text="lbKInhPhi"></asp:Label>
					</strong>
					<br />
					Trong đó:
					<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ngân sách Nhà nước: <strong>
					<asp:Label ID="lbNSNN" runat="server" Text="lbNSNN"></asp:Label>
					</strong>&nbsp;&nbsp;&nbsp;&nbsp; Các nguồn kinh phí khác: <strong>
					<asp:Label ID="lbKPKKHAC" runat="server" Text="lbKPKKHAC"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td class="auto-style12" style="border-style: solid none none solid; border-width: 1px; border-color: #000000; vertical-align: top"><em>Ngày&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tháng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; năm </em><strong>
					<br />
					Trưởng Đơn vị
					<br />
					</strong>(ký, họ và tên) </td>
				<td style="border-style: solid solid none none; border-width: 1px; border-color: #000000; vertical-align: top" class="auto-style13"><em>Ngày&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tháng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; năm </em><strong>
					<br />
					Chủ nhiệm đề tài
					<br />
					</strong>(ký, họ và tên)&nbsp; </td>
			</tr>
			<tr>
				<td class="auto-style12" style="border-style: none none none solid; border-width: 1px; border-color: #000000; vertical-align: top">&nbsp;</td>
				<td style="border-style: none solid none none; border-width: 1px; border-color: #000000; vertical-align: bottom" class="auto-style13"><strong>
					<asp:Label ID="lbTenCN" runat="server" Text="lbTenCN"></asp:Label>
					</strong></td>
			</tr>
			<tr>
				<td class="auto-style11" style="border-style: none solid solid solid; border-width: 1px; border-color: #000000; vertical-align: top" colspan="2"><em>Ngày&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tháng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; năm </em><strong>
					<br />
					HIỆU TRƯỞNG </strong></td>
			</tr>
		</table>
    </form>
</body>
</html>
