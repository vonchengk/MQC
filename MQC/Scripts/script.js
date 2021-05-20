
//product
function CheckVersion() {
    var txt = $("#Hold_Product_Version");
    var lb = $("#LbVer");
    var spn = $("#SpnVer");
    var div = $("#DivVer");

    if (txt.val() == "") {
        lb.text("请输入检验规范版本");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckMatnr() {
    var txt = $("#Hold_Product_Matnr");
    var lb = $("#LbMaknr");
    var spn = $("#SpnMatnr");
    var div = $("#DivMatnr");
    if (txt.val() == "") {
        lb.text("请输入Sap编号");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
        CheckMatnrAndMaktx();
    }
}

function CheckMatnrAndMaktx() {
    var txtMaktx = $("#Hold_Product_Maktx");
    var txtMatnr = $("#Hold_Product_Matnr");
    var lb = $("#LbMaknr");
    var spn = $("#SpnMatnr");
    var div = $("#DivMatnr");
    var arrayMaktx = txtMaktx.val().split(",");
    var arrayMatnr = txtMatnr.val().split(",");
    if (arrayMaktx.length != arrayMatnr.length) {
        lb.text("产品编号数量与Sap编号数量不相同");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckTaMaktx() {
    var txt = $("#Hold_Product_Maktx");
    var lb = $("#LbMaktx");
    var spn = $("#SpnMaktx");
    var div = $("#DivMaktx");
    if (txt.val() == "") {
        lb.text("请输入产品编号");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

//cavity

function CheckMold() {
    var txt = $("#Hold_Product_TbMold");
    var lb = $("#LbMold");
    var spn = $("#SpnMold");
    var div = $("#DivMold");
    if (txt.val() == "") {
        lb.text("请输入模具号");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckTbMaktx() {
    var txt = $("#Hold_Product_TbMaktx");
    var lb = $("#LbMaktx");
    var spn = $("#SpnMaktx");
    var div = $("#DivMaktx");
    if (txt.val() == "") {
        lb.text("请输入产品编号");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckNum() {
    var txt = $("#Hold_Product_TbNum");
    var lb = $("#LbNum");
    var spn = $("#SpnNum");
    var div = $("#DivNum");
    var re = /^[0-9]*[1-9][0-9]*$/;
    if (txt.val().trim() == "") {
        lb.text("请输入型腔数");
        ErrorCheck(spn, div);
        return false;
    }else if(re.test(txt.val().trim())==false){
        lb.text("型腔数必须是数字");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
   
}

function CheckSerial() {
    var txt = $("#Hold_Product_TxtSerial");
    var lb = $("#LbSerial");
    var spn = $("#SpnTxtSerial");
    var div = $("#DivSerial");
    var num = $("#Hold_Product_TbNum").val().trim();
    var str = txt.val().trim().split("|");
    if (txt.val() == "") {
        lb.text("请生成型腔序号");
        ErrorCheck(spn, div);
        return false;
    }else if(str.length!=parseInt(num)){
        lb.text("型腔数与型腔序号个数不匹配");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}
 
//check
function CheckNo() {
    var txt = $("#Hold_Product_TbNo");
    var lb = $("#LbNo");
    var spn = $("#SpnNo");
    var div = $("#DivNo");
    var re = /^[0-9]+(.[0-9]{1,3})?$/;
    if (txt.val().trim() == "") {
        lb.text("请输入序号");
        ErrorCheck(spn, div);
        return false;
    } else if (re.test(txt.val().trim()) == false) {
        lb.text("必须是数字");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckType() {
    var txt = $("#Hold_Product_TbType");
    var lb = $("#LbType");
    var spn = $("#SpnType");
    var div = $("#DivType");
    if (txt.val() == "") {
        lb.text("请输入类型");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckContent() {
    var txt = $("#Hold_Product_TbContent");
    var lb = $("#LbContent");
    var spn = $("#SpnContent");
    var div = $("#DivContent");
    if (txt.val() == "") {
        lb.text("请输入检验内容");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckTool() {
    var txt = $("#Hold_Product_TbTool");
    var lb = $("#LbTool");
    var spn = $("#SpnTool");
    var div = $("#DivTool");
    if (txt.val() == "") {
        lb.text("请输入检验工具");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckL_Toler() {
    var txt = $("#Hold_Product_TbL_Toler");
    var lb = $("#LbL_Toler");
    var spn = $("#SpnL_Toler");
    var div = $("#DivL_Toler");
    var re = /^[0-9]+(.[0-9]{1,3})?$/;
    if (txt.val() == "") {
        lb.text("请输入下公差");
        ErrorCheck(spn, div);
        return false;
    } else if (re.test(txt.val().trim()) == false) {
        lb.text("输入类型必须是数字");
        ErrorCheck(spn, div);
        return false;
    }
    else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckU_Toler() {
    var txt = $("#Hold_Product_TbU_Toler");
    var lb = $("#LbU_Toler");
    var spn = $("#SpnU_Toler");
    var div = $("#DivU_Toler");
    var re = /^[0-9]+(.[0-9]{1,3})?$/;
    if (txt.val() == "") {
        lb.text("请输入上公差");
        ErrorCheck(spn, div);
        return false;
    } else if (re.test(txt.val().trim()) == false) {
        lb.text("输入类型必须是数字");
        ErrorCheck(spn, div);
        return false;
    }
    else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckL_Limit1() {
    var txt = $("#Hold_Product_TbL_Limit1");
    var lb = $("#LbL_Limit1");
    var spn = $("#SpnL_Limit1");
    var div = $("#DivL_Limit1");
    var re = /^[0-9]+(.[0-9]{1,3})?$/;
    if (re.test(txt.val().trim()) == false && txt.val().trim()!="") {
        lb.text("输入类型必须是数字");
        ErrorCheck(spn, div);
        return false;
    }
    else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckU_Limit1() {
    var txt = $("#Hold_Product_TbU_Limit1");
    var lb = $("#LbU_Limit1");
    var spn = $("#SpnU_Limit1");
    var div = $("#DivU_Limit1");
    var re = /^[0-9]+(.[0-9]{1,3})?$/;
    if (re.test(txt.val().trim()) == false && txt.val().trim() != "") {
        lb.text("输入类型必须是数字");
        ErrorCheck(spn, div);
        return false;
    }
    else {
        SuccessCheck(lb, spn, div);
    }
}

function SearchData(maktx) {
    var lb = $("#LbMaktx");
    $.post("Server.ashx", { "maktx": maktx },
    function (data) {
        if (data == "[]") {
            lb.text("没有找到产品号");
            $("#Hold_Product_SelMold").css("display", "none").empty();
            $("#Hold_Product_TbMold").css("display", "blcok");
        } else {
            var mold = $.parseJSON(data);
            lb.text("");
            $("#SelMold").css("display", "block");
            $("#Hold_Product_TbMold").css("display", "none").text("");
            for (var i = 0; i < mold.length; i++)
            {
                $("#SelMold").append("<option value='" + mold[i].Name + "'>" + mold[i].Name + "</option>");
            }
        }
    });
}

function CheckTbMaktx() {
    var txt = $("#Hold_Product_TbSearchMaktx");
    var lb = $("#LbMaktx");
    var spn = $("#SpnMaktx");
    var div = $("#DivMaktx");
    if (txt.val() == "") {
        lb.text("请输入产品编号");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

function CheckSearchMold() {
    var txt = $("#Hold_Product_TbMold");
    var lb = $("#LbMold");
    var spn = $("#SpnMold");
    var div = $("#DivMold");
    if (txt.val() == "" && txt.css("display")!='none') {
        lb.text("请输入模具号");
        ErrorCheck(spn, div);
        return false;
    } else {
        SuccessCheck(lb, spn, div);
    }
}

//all
function LoopData(array) {
    for (var i = 0; i < array.length; i++) {
        if (array[i] == false) {
            return false;
        }
    }

}

function SuccessCheck(lb, spn, div) {
    lb.text("");
    spn.removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
    div.removeClass("has-error").addClass("has-success");
}

function ErrorCheck(spn, div) {
    spn.removeClass("glyphicon glyphicon-ok").addClass("glyphicon glyphicon-remove");
    div.removeClass("has-success").addClass("has-error");

}

$(".nav-pills li").click(function () {
    $(".nav-pills li[class='active']").removeAttr("class");
    $(this).addClass("active");
});