<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MQC.product.Search" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-1").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
<%--    <form id="formSearch" runat="server">--%>
    <div class="form-group">
        <div class="col-md-3">
            <a class="btn btn-default" href="add.aspx">创建产品主数据</a>
        </div>
    </div>    
    <div style="border-top:2px solid #0094ff"></div>
    <h3>修改/查询</h3>
    <div class="form-group">
        <label id="Label1" class="col-md-2 control-label" runat="server">产品编号</label>
        <div class="col-md-3">
            <input id="TbMaktx" type="text" class="form-control input-sm" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label id="Label2" class="col-md-2 control-label" runat="server">Sap编号</label>
        <div class="col-md-3">
            <input id="TbMatnr" type="text" class="form-control input-sm" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label id="Label3" class="col-md-2 control-label" runat="server">产品系列</label>
        <div class="col-md-3">
            <input id="TbSeries" type="text" class="form-control input-sm" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label id="Label4" class="col-md-2 control-label" runat="server">客户</label>
        <div class="col-md-3">
            <input id="TbCustomer" type="text" class="form-control input-sm" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label id="Label5" class="col-md-2 control-label" runat="server">检验规范</label>
        <div class="col-md-3">
        <input id="TbStandard" type="text" name="standard" class="form-control input-sm" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-2"></div>
        <div class="col-md-3">
            <asp:Button ID="Search_btn" CssClass="btn btn-default" runat="server" Text="查询" OnClick="Search_btn_Click"  />
        </div>
    </div>
<%--    </form>--%>
</asp:Content>
