<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mauGiaHan.aspx.cs" Inherits="NKCH.mauGiaHan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 278px;
            text-align: left;
        }
        .auto-style2 {
            width: 278px;
            text-align: center;
        }
        .auto-style3 {
            width: 74px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            font-size: large;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            text-align: right;
            width: 322px;
            height: 23px;
        }
        .auto-style10 {
            height: 23px;
            width: 322px;
        }
        .auto-style11 {
            width: 322px;
        }
        .auto-style13 {
            width: 486px;
            height: 23px;
        }
        .auto-style14 {
            width: 100%;
        }
        .auto-style16 {
            width: 268px;
        }
        .auto-style17 {
            width: 268px;
            text-align: center;
        }
        .auto-style18 {
            width: 256px;
            text-align: center;
        }
        .auto-style19 {
            width: 256px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style2">UBND THÀNH PHỐ CẦN THƠ<br />
                        <strong>TRƯỜNG ĐẠI HỌC<br />
                        KỸ THUẬT - CÔNG NGHỆ CẦN THƠ</strong></td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4"><strong>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
                        Độc lập - Tự Do - Hạnh phúc</strong></td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">Cần Thơ,
                        <asp:Label ID="lbNgayThang" runat="server" Text="lbNgayThang"></asp:Label>
                    </td>
                </tr>
                </table>
        </div>
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style4"><strong><span class="auto-style5">ĐƠN XIN GIA HẠN</span><br class="auto-style5" />
                    <span class="auto-style5">ĐỀ TÀI NCKH CẤP TRƯỜNG&nbsp;</span></strong></td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style9"><strong><em>Kính gửi:</em></strong></td>
                <td class="auto-style8"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ban Giám Hiệu&nbsp;</strong></td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phòng NCKH-HTQT-DA&nbsp;</strong></td>
            </tr>
        </table>
        <br />
        <br />
        <table class="auto-style14">
            <tr>
                <td class="auto-style13">- <strong>Họ tên chủ nhiệm đề tài:</strong>
                    <asp:Label ID="lbCanBo" runat="server" Text="lbCanBo"></asp:Label>
                </td>
                <td class="auto-style8">MSCB:
                    <asp:Label ID="lbCBID" runat="server" Text="lbCBID"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style8">- <strong>Đơn vị:</strong>
                    <asp:Label ID="lbDonVi" runat="server" Text="lbDonVi"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2"><strong>- Tên đề tài: </strong>
                    <asp:Label ID="lbTenDeTai" runat="server" Text="lbTenDeTai"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2"><strong>- Thời gian đăng ký thực hiện: </strong>
                    <asp:Label ID="lbTGTH" runat="server" Text="lbTGTH"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2"><strong>- Thời gian gia hạn: </strong>
                    <asp:Label ID="lbTGGH" runat="server" Text="lbTGGH"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2"><strong>- Nội dung phần xin gia hạn: </strong>
                    <asp:Label ID="lbNoiDung" runat="server" Text="lbNoiDung"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2"><strong>- Lý do: </strong>
                    <asp:Label ID="lbLyDo" runat="server" Text="lbLyDo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2"><strong>- Kinh phí theo phần gia hạn (nếu có): </strong>
                    <asp:Label ID="lbKinhPhi" runat="server" Text="lbKinhPhi"></asp:Label>
                </td>
            </tr>
            </table>
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style17"><strong>Ban Giám Hiệu</strong></td>
                <td class="auto-style18"><strong>Phòng NCKH-HTQT-DA</strong></td>
                <td class="auto-style4"><strong>Chủ nhiệm Đề tài</strong></td>
            </tr>
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lbCB" runat="server" Text="lbCB"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
