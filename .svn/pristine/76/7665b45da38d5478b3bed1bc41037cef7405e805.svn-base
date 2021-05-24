<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MQC.check.Search" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-3").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
<%--    <form id="formSearch" runat="server">   --%>  
        <div class="form-group">
            <label id="Label1" class="col-md-2 control-label" runat="server">产品编号</label>
            <div id="DivMaktx">
                <div class="col-md-3 has-feedback">
                    <input id="TbSearchMaktx" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMaktx" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <div class="col-md-1">
                    <button id="SearchMaktx" class="btn btn-default">查询模具号</button>
                </div>
                <label id="LbMaktx" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label2" class="col-md-2 control-label" runat="server">模具号</label>
            <div id="DivMold">
                <div class="col-md-3 has-feedback">
                    <input id="TbMold" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMold" class="form-control-feedback" aria-hidden="true"></span> 
                    <select id="SelMold" name="Select" class="form-control input-sm" style="display:none"></select> 
                </div>
                <label id="LbMold" class="col-md-2 control-label"></label>
            </div>
        </div>
<%--        <div id="DivMsg" class="form-group has-feedback">
            <div class="col-md-2"></div>
            
        </div>--%>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-1">
                <asp:Button ID="SearchCheck_btn" CssClass="btn btn-default" runat="server" Text="查询" OnClick="Search_btn_Click"  />
            </div>
        </div>


 <%--   </form>--%>
</asp:Content>
