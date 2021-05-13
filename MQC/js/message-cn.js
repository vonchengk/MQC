$(document).ready(function () {
    valid("#form1");
    
});
function valid(form) {
    $(form).validate({
        onfocusout: function(element){
            $(element).valid();
        },      
        rules: {
            ctl00$ctl00$Hold$Product$Standard: {
               required: true,
           },
            ctl00$ctl00$Hold$Product$Version: {
                required: true,
            },
            ctl00$ctl00$Hold$Product$Maktx: {
                required: true,
            },
            ctl00$ctl00$Hold$Product$Matnr: {
                required: true,
            }
        },
        messages:{
            ctl00$ctl00$Hold$Product$Standard: {
               required: "请输入检验规范",
           },
            ctl00$ctl00$Hold$Product$Version: {
                required: "请输入检验规范版本",
            },
            ctl00$ctl00$Hold$Product$Maktx: {
                required: "请输入产品编号",
            },
            ctl00$ctl00$Hold$Product$Matnr: {
                required: "请输入物料编号",
            }
        }
    }); 
}
