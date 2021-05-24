$(document).ready(function () {
    $("#Hold_Product_Version").focusout(function () {

    });

    $("#Hold_Product_Maktx").focusout(function () {
        CheckTaMaktx();
    });

    $("#Hold_Product_Matnr").focusout(function () {
        var array = CheckMatnr();
        var result = LoopData(array);
        if (result == false) { return false; }
    });

    $("#Hold_Product_Save").click(function () {
        var array = [CheckTaMaktx(), CheckMatnr()];
        var result = LoopData(array);
        if (result == false) { return false; }
    });

});



