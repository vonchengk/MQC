$(document).ready(function () {
    //add
    $("#Hold_Product_TbNo").focusout(function () {
        CheckNo();
    });
    $("#Hold_Product_TbType").focusout(function () {
        CheckType();
    });
    $("#Hold_Product_TbContent").focusout(function () {

        CheckContent();
    });
    $("#Hold_Product_TbTool").focusout(function () {
        CheckTool();
    });

    $("#Hold_Product_TbL_Toler").focusout(function () {
        CheckL_Toler();
    });

    $("#Hold_Product_TbU_Toler").focusout(function () {
        CheckU_Toler();
    });

    $("#Hold_Product_TbL_Limit1").focusout(function () {

        CheckL_Limit1();
    });

    $("#Hold_Product_TbU_Limit1").focusout(function () {

        CheckU_Limit1();
    });

    $("#Hold_Product_CheckSave").click(function () {
        var array = [CheckNo(), CheckType(), CheckContent(), CheckTool(), CheckL_Toler(), CheckU_Toler(), CheckL_Limit1(), CheckU_Limit1()];
        var result = LoopData(array);
        if (result == false) { return false; }
    });


    //Search
    $("#SearchMaktx").click(function () {
        var maktx = $("#Hold_Product_TbSearchMaktx").val().trim().toUpperCase();
        SearchData(maktx);
        return false;
    });

    $("#Hold_Product_SearchCheck_btn").click(function () {
        var array = [CheckTbMaktx(), CheckSearchMold()];
        var result = LoopData(array);
        if (result == false) { return false; }
    });
   
});