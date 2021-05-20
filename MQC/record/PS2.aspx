<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PS2.aspx.cs" Inherits="MQC.record.PS2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" href="../css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group" style="margin-top:20px">
            <label id="LbBatch" runat="server" class="col-md-12 control-label" ruant="server"></label>
        </div>
        <div class="form-group">
            <label class="col-md-1 control-label">备注:</label>
            <div class="col-md-11">
                <textarea id="TxtPs" class="form-control" rows="5" runat="server"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-3">
                <asp:Button ID="SubmitPs" CssClass="btn btn-default" runat="server" Text="提交" OnClick="SubmitPs_Click" />
            </div>
        </div>
    </form>
</body>
</html>
