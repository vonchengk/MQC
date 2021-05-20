<%@ Page Title="" Language="C#" MasterPageFile="~/mould/Product.master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MQC.cavity.Add" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mainMenu2").addClass("active");
            $("#subMenu2-2").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Product" runat="server">
<%--    <form id="formMold" runat="server">--%>
        <div class="form-group">
            <label id="Label1" class="col-md-2 control-label" runat="server">工装模具编号</label>
            <div id="DivMold">
                <div class="col-md-3 has-feedback">
                    <input id="TbMold" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMold" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMold" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label2" class="col-md-2 control-label" runat="server">产品编号</label>
            <div id="DivMaktx">
                <div class="col-md-3 has-feedback">
                    <input id="TbMaktx" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnMaktx" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbMaktx" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label3" class="col-md-2 control-label" runat="server">数据组(型腔数)</label>
            <div id="DivNum">
                <div class="col-md-3 has-feedback">
                    <input id="TbNum" type="text" class="form-control input-sm" runat="server" />
                    <span  id="SpnNum" class="form-control-feedback" aria-hidden="true"></span> 
                </div>
                <label id="LbNum" class="col-md-2 control-label"></label>
            </div>
        </div>
        <div class="form-group">
            <label id="Label4" class="col-md-2 control-label" runat="server">工装模具备注</label>
            <div class="col-md-3">
                <input id="TbPs" type="text" class="form-control input-sm" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label5" class="col-md-2 control-label" runat="server">型腔编码</label>
        </div>
        <div class="form-group">
            <label id="Label6" class="col-md-2 control-label" runat="server">前缀</label>
            <div class="col-md-2">
                <select id="SelFirst" class="form-control input-sm">
                    <option value="1">可变(A-Z)</option>
                    <option value="2">可变(数字)</option>
                    <option value="3">固定</option>
                </select>
            </div>
            <div class="col-md-1">
                <input id="TxtFirst" style="display:none" type="text" class="form-control input-sm"/>
            </div>
        </div>
        <div class="form-group">
            <label id="Label7" class="col-md-2 control-label" runat="server">分隔符</label>
            <div class="col-md-2">
                <select id="SelMid" class="form-control input-sm">
                    <option value="1">无</option>
                    <option value="2">固定</option>
                </select>
            </div>
            <div class="col-md-1">
                <input id="TxtMid" style="display:none" type="text" class="form-control input-sm" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label8" class="col-md-2 control-label">后缀</label>
            <div class="col-md-2">
                <select id="SelLast" class="form-control input-sm">
                    <option value="1">固定</option>
                    <option value="2">可变(数字)</option>
                    <option value="3">可变(A-Z)</option>       
                </select>
            </div>
            <div class="col-md-1">
                <input id="TxtLast" type="text" class="form-control input-sm" />
            </div>
        </div>
        <div class="form-group">
            <label id="Label12" class="col-md-2 control-label" runat="server">初始字母(或数字)</label>
            <div class="col-md-3">
                <input id="TbStart" type="text" class="form-control input-sm" />
            </div>
        </div>
        <div id="divSerial" class="form-group">
            <label id="Label10" class="col-md-2 control-label" runat="server"></label>
            <div class="col-md-2" >
                <button id="BtnSerial" class="btn btn-default">生成型腔序号</button>
                <span  id="SpnSerial" class="form-control-feedback" aria-hidden="true"></span> 
            </div>
            <label id="msg" class="col-md-3 control-label"></label>
        </div>
        <div class="form-group">
            <label id="Label9" class="col-md-2 control-label" runat="server">型腔序号</label>
            <div id="DivSerial">
                <div class="col-md-3 has-feedback">
                    <textarea id="TxtSerial" class="form-control" rows="5" runat="server"></textarea>
                    <span  id="SpnTxtSerial" class="form-control-feedback" aria-hidden="true"></span>
                </div>
                <label id="LbSerial" class="col-md-2 control-label"></label>
            </div>

        </div>
        <div id="DivBtn" class="form-group">
            <label id="Label11" class="col-md-2 control-label" runat="server"></label>
            <div class="col-md-2">
                <asp:Button ID="Create" CssClass="btn btn-default" runat="server" Text="创建" OnClick="Save_Click" />
                <asp:Button ID="Update" CssClass="btn btn-default" runat="server" Text="更新" OnClick="Update_Click"/>
                <span  id="SpnBtn" class="form-control-feedback" aria-hidden="true"></span> 
            </div>
            <label id="LbBtn" class="col-md-3 control-label" runat="server"></label>
        </div>
<%--    </form>--%>
    
</asp:Content>
