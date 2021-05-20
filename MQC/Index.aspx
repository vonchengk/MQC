<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MQC.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <script type="text/javascript" src="../Scripts/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="../Scripts/script.js"></script>
    <script type="text/javascript" src="../Scripts/product.js"></script>
    <style>
        .form-signin{
            max-width:450px;
            padding:15px;
            margin:auto;
        }
    </style>
    <title></title>
</head>
<body>
    <%--<div class="container">
        <form id="form1" class="form-signin" runat="server">
            <div class="form-group">
                <label class="col-md-2 control-label">用户名</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" id="UserName" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">密码</label>
                <div class="col-md-3">
                    <input type="password" class="form-control" id="Password" runat="server"/>
                </div>
            </div>
           <div id="DivMsg" class="form-group has-error" runat="server">
                <label  class="col-md-offset-2 control-label" runat="server">用户名或密码错误</label>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-sm-10">
                    <asp:Button ID="SignIn" CssClass="btn btn-default" runat="server" Text="登录" OnClick="SignIn_Click" />
                </div>
            </div>
        </form>
    </div>--%>

    <div class="container" style="margin-top:50px;">

      <form class="form-signin" runat="server">
        <label>用户名</label>
        <input type="text" id="UserName" class="form-control" placeholder="Email address" runat="server" />
        <label>密码</label>
        <input type="password" id="Password" class="form-control" placeholder="Password" runat="server"/>
        <div id="DivMsg" class="form-group has-error" runat="server">
            <label for="inputPassword" runat="server">用户名或密码错误</label>
        </div>
        <br />
        <asp:Button ID="SignIn" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="登录" OnClick="SignIn_Click" />
      </form>

    </div>
        
</body>
</html>
