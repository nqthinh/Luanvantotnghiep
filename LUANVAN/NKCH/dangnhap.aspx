<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="NKCH.dangnhap" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/img/ctut1.png">
    <title>Hệ Thống Quản Lý Nghiên Cứu Khoa Học</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
  </head>
  <body class="be-splash-screen">
    <div class="be-wrapper be-login">
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="splash-container">
            <div class="panel panel-default panel-border-color panel-border-color-primary">
              <div class="panel-heading"><img src="assets/img/ctut1.png" alt="logo" width="102" height="27" class="logo-img"><span class="splash-description"><b>ĐĂNG NHẬP TRANG QUẢN TRỊ</b></span></div>
              <div class="panel-body">
                <form method="get" runat="server">
                  <div class="form-group">
                    <asp:TextBox ID="txttk" runat="server" placeholder="Tài khoản" class="form-control">nvab@ctuet.edu.vn</asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tài khoản không được để trống" ControlToValidate="txttk" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                  </div>
                  <div class="form-group">
                    <asp:TextBox ID="txtmk" runat="server" CssClass="form-control" placeholder="Mật khẩu" TextMode="Password">12345678</asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mật khẩu không được để trống" ControlToValidate="txtmk" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                  </div>
                  <div class="form-group login-submit">
                    <asp:Button ID="btndangnhap" runat="server" Text="Đăng Nhập"  class="btn btn-primary btn-xl" OnClick="btndangnhap_Click"/>
                  </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="SELECT * FROM [DANGNHAP]"></asp:SqlDataSource>
    <script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/main.js" type="text/javascript"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //initialize the javascript
            App.init();
        });

    </script>
  </body>
</html>
