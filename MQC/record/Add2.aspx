<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add2.aspx.cs" Inherits="MQC.record.Add2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.css"/>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <script type="text/javascript" src="../Scripts/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="../Scripts/record.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LbCavity" CssClass="col-md-2" runat="server" Text=""></asp:Label>
            <asp:Button ID="BtnError" CssClass="btn btn-default" runat="server" Text="堵腔" OnClick="BtnError_Click" />
            <asp:Button ID="BtnSubmit" CssClass="btn btn-default" runat="server" Text="提交" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="CavityNo" HeaderText="型腔号" SortExpression="CavityNo" />
                    <asp:BoundField DataField="RCId" HeaderText="id" SortExpression="RCId" />
                    <asp:BoundField DataField="No" HeaderText="序号" SortExpression="No" />
                    <asp:BoundField DataField="Type" HeaderText="检验类型" SortExpression="Type" />
                    <asp:BoundField DataField="Content" HeaderText="检验内容" SortExpression="Content" />
                    <asp:BoundField DataField="Tool" HeaderText="检验工具" SortExpression="Tool" />
                    <asp:BoundField DataField="L_Limit" HeaderText="判定下限" SortExpression="L_Limit" />
                    <asp:BoundField DataField="U_Limit" HeaderText="判定上限" SortExpression="U_Limit" />
                    <asp:BoundField DataField="Result" HeaderText="检验结果" SortExpression="Result" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
