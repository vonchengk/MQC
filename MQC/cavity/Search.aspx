<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MQC.cavity.Search" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-2").addClass("active");
            $(".nav3 li").click(function () {
                $(".nav3 li[class='active']").removeAttr("class");
                $(this).addClass("active");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
 <%--       <form id="formSearch" runat="server">--%>
<%--            <div class="form-group">
                <div class="col-md-3">
                    <a class="btn btn-default" href="add.aspx">创建主数据</a>
                </div>
            </div>  --%>
        <div class="col-md-offset-2">
            <ul class="nav nav-pills nav3">
                <li id="LiCreate" role="presentation" class="active"><a href="#">新建</a></li>
                <li id="LiCopy" role="presentation"><a href="#">复制</a></li>
                <li id="LiSearch" role="presentation"><a href="#">查询/修改</a></li>
            </ul>
        </div>
        
        <br /><br />
        <div class="form-group display-control" style="display:none">
            <label id="Label1" class="col-md-2 control-label">复制产品编号</label>
            <div id="DivMaktx">
                <div class="col-md-3 has-feedback">
                    <input id="TbSearchMaktx" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMaktx" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMaktx" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group display-control" style="display:none">
            <label id="Label2" class="col-md-2 control-label">复制模具编号</label>
            <div id="DivMold">
                <div class="col-md-3 has-feedback">
                    <input id="TbSearchMold" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMold" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                 <label id="LbMold" class="col-md-2 control-label"></label>
            </div>
        </div>
        
        <div class="form-group">
            <div id="DivCreate" class="col-md-2 col-md-offset-2" style="display:block">
                <asp:Button ID="Create_btn" CssClass="btn btn-default" runat="server" Text="新建" OnClick="Create_btn_Click" />
            </div>
            <div id="DivSearch" class="col-md-2 col-md-offset-2" style="display:none">
                <asp:Button ID="Search_btn" CssClass="btn btn-default" runat="server" Text="查询" OnClick="Search_btn_Click" />
            </div>
            <div id="DivMsg" class="form-group" runat="server">
                <asp:Label ID="LbMsg" CssClass="col-md-4  control-label" runat="server"></asp:Label>
            </div>
        </div>
<%--    </form>--%>
</asp:Content>
