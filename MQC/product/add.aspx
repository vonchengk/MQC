<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MQC.product.add" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-1").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
    <%--<form id="form1" runat="server">--%>
        <div class="form-group">
            <label id="Label1" class="col-md-2 control-label" runat="server">客户</label>
            <div class="col-md-3">
                <asp:DropDownList ID="Customer" CssClass="form-control input-sm" runat="server" DataSourceID="LinqDataSourceToCustomer" DataValueField="Name">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSourceToCustomer" runat="server" ContextTypeName="MQC.DbAppDataContext" EntityTypeName="" Select="new (Name)" TableName="Customer">
                </asp:LinqDataSource>
            </div>
        </div>
        <div class="form-group">
            <label id="Label2" class="col-md-2 control-label" runat="server">产品系列</label>
            <div class="col-md-3">
                <input id="Series" type="text" class="form-control input-sm" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label3" class="col-md-2 control-label" runat="server">检验规范</label>
            <div class="col-md-3">
                <input id="Standard" type="text" name="standard" class="form-control input-sm" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label4" class="col-md-2 control-label" runat="server">检验规范版本</label>
            <div id="DivVer">
                <div class="col-md-3 has-feedback">
                    <input id="Version" type="text" name="version" class="form-control" runat="server" />
                    <span  id="SpnVer" class="form-control-feedback" aria-hidden="true"></span> 
                </div>                
                <label id="LbVer" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label5" class="col-md-2 control-label" runat="server">产品编号</label>
            <div id="DivMaktx">
                <div class="col-md-3 has-feedback">
                    <textarea id="Maktx" name="maktx" class="form-control" runat="server"></textarea>
                    <span  id="SpnMaktx" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMaktx" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label6" class="col-md-2 control-label" runat="server">Sap产品编号</label>
            <div id="DivMatnr">
                <div class="col-md-3 has-feedback" >
                    <textarea id="Matnr" name="matnr" class="form-control" runat="server"></textarea>
                    <span  id="SpnMatnr" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMaknr" class="col-md-2 control-label"></label>
             </div>
        </div>
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Button ID="Save" CssClass="btn btn-default" runat="server" Text="保存"  OnClick="Save_Click" />
            </div>
        </div>
<%--    </form>--%>
</asp:Content>
