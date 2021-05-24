$(document).ready(function () {
    var letterArray = new Array(26);//26个字母
    for (var j = 0; j < 26; j++) {
        letterArray[j] = String.fromCharCode((65 + j));
    }
    $("#SelFirst").change(function () {
        var a = $(this).val();
        if ($(this).val() == "3") {
            $("#TxtFirst").show();
        } else {
            $("#TxtFirst").hide();
        }
    });

    $("#SelMid").change(function () {
        if ($(this).val() == "2") {
            $("#TxtMid").show();
        } else {
            $("#TxtMid").hide();
        }
    });

    $("#SelLast").change(function () {
        if ($(this).val() == "1") {
            $("#TxtLast").show();
        } else {
            $("#TxtLast").hide();
        }
    });

    $("#BtnSerial").on("click", function () {
        var first;//前缀
        var mid;//分隔符
        var last;//后缀
        var start, newStart;//初始值，初始值索引
        var result = "";//生成序号

        start = $("#TbStart").val().trim().toUpperCase();
        if ($("#SelMid").val() == "1") {
            mid = "";
        } else {
            mid = $("#TxtMid").val();
        }
        var x = CheckNum();
        if (x == false) { return false;}
        var num = parseInt($("#Hold_Product_TbNum").val());//型腔数

        $("#msg").text("");
        $("#Hold_Product_TxtSerial").val("");
        if ($("#SelFirst").val() == "1" && $("#SelLast").val() == "1") { //前缀A-Z,后缀固定
            newStart = GetIndexofData(start);
            if (newStart + num > 26) { return false;}
            last = $("#TxtLast").val().trim().toUpperCase();
            for (var k = newStart; k < (num + newStart) ; k++) {
                if (k == newStart) {
                    result = letterArray[k] + mid + last;
                } else {
                    result = result + "|" + letterArray[k] + mid + last;
                }
            }
        } else if ($("#SelFirst").val() == "2" && $("#SelLast").val() == "1") { //前缀数字,后缀固定
            newStart = GetParseData(start);
            last = $("#TxtLast").val().trim().toUpperCase();
            for (var m = newStart; m < (num + newStart) ; m++) {
                if (m == newStart) {
                    result = m + mid + last;
                } else {
                    result = result + "|" + m + mid + last;
                }
            }
        } else if ($("#SelFirst").val() == "3" && $("#SelLast").val() == "2") { //前缀固定,后缀数字
            newStart = GetParseData(start);
            first = $("#TxtFirst").val().trim().toUpperCase();
            for (var n = newStart; n < (num + newStart) ; n++) {
                if (n == newStart) {
                    result = first + mid + n;
                } else {
                    result = result + "|" + first + mid + n;
                }
            }
        } else if ($("#SelFirst").val() == "3" && $("#SelLast").val() == "3") { //前缀固定,后缀字母
            newStart = GetIndexofData(start);
            if (newStart + num > 26) { return false; }
            first = $("#TxtFirst").val().trim().toUpperCase();
            for (var p = newStart; p < (num + newStart) ; p++) {
                if (p == newStart) {
                    result = first + mid + letterArray[p];
                } else {
                    result = result + "|" + first + mid + letterArray[p];
                }
            }
        } else if ($("#SelFirst").val() == "3" && $("#SelLast").val() == "1") { //前缀固定，后缀固定？？？

        } else {
            $("#msg").text("前缀和后缀必须有一项是固定");
            $("#SpnSerial").removeClass("glyphicon glyphicon-ok ").addClass("glyphicon glyphicon-remove");
            $("#divSerial").removeClass("has-success").addClass("has-error");
            return false;
        }

        $("#Hold_Product_TxtSerial").val(result);
        $("#SpnSerial").removeClass("glyphicon glyphicon-remove").addClass("glyphicon glyphicon-ok");
        $("#divSerial").removeClass("has-error").addClass("has-success");
        return false;
    });

    $("#Hold_Product_TbMold").focusout(function () {
        CheckMold();
    });

    $("#Hold_Product_TbMaktx").focusout(function () {
        CheckTbMaktx();
    });

    $("#Hold_Product_TbNum").focusout(function () {
        CheckNum();
    });

    $("#Hold_Product_Create,#Hold_Product_Update").click(function () {
        var array = [CheckMold(), CheckTbMaktx(), CheckNum(), CheckSerial()];
        var result = LoopData(array);
        if (result == false) { return false;}
    });

    //$(".nav-pills li").click(function () {
    //    $(".nav-pills li[class='active']").removeAttr("class");
    //    $(this).addClass("active");
    //});
    $("#LiCreate").click(function () {
        $("#Label1").text("复制产品编号");
        $("#Label2").text("复制模具编号");
        $("#DivCreate").css("display", "block");
        $("#DivSearch").css("display", "none");
    });
    $("#LiSearch").click(function () {
        $("#Label1").text("产品编号");
        $("#Label2").text("模具编号");
        $("#DivCreate").css("display", "none");
        $("#DivSearch").css("display", "blcok");
    });

    function GetParseData(start) {
        var newStart;
        var re = /^[0-9]*[1-9][0-9]*$/;
        if (start != "" && re.test(start)==true) {
            newStart = parseInt(start);
        } else {
            newStart = 1;
        }
        return newStart;
    }

    function GetIndexofData(start) {
        var newStart;
        if (start != "" && ((start >= "a" && start <= "z") || (start >= "A" && start <= "Z"))) {
            newStart = letterArray.indexOf(start.toUpperCase());
        } else {
            newStart = 0;
        }
        return newStart;
    }
});

