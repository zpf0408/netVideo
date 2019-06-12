$(function(){
    $("#btn01").click(function(){
        var cname = $("#q").val();

        if($.isEmptyObject($.trim(cname))){
            lightyear.notify('搜索框不能为空！', 'danger');
            return false;
        }
        $("#form1").submit();
    });
})