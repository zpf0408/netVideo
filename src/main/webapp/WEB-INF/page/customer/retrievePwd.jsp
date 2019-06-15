<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/15
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/base.jsp" %>
<%
    pageContext.setAttribute("basePath", request.getContextPath());

%>

<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>找回密码</title>
    <link rel="icon" href="${basePath }/static/icons/favicon.ico" type="image/ico">
    <link href="${basePath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/animate.css" rel="stylesheet">
    <link href="${basePath }/static/css/style.min.css" rel="stylesheet">
    <style>
        .lyear-wrapper {
            position: relative;
        }
        .lyear-login {
            display: flex !important;
            min-height: 100vh;
            align-items: center !important;
            justify-content: center !important;
        }
        .login-center {
            background: #fff;
            min-width: 38.25rem;
            padding: 2.14286em 3.57143em;
            border-radius: 5px;
            margin: 2.85714em 0;
        }
        .login-header {
            margin-bottom: 1.5rem !important;
        }
        .login-center .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
        }
        .login-center .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }
        .login-center .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }
    </style>
</head>

<body>
<div class="row lyear-wrapper">
    <div class="lyear-login">
        <div class="login-center">
            <div class="login-header text-center">
                <a href="${basePath }/video/index"> <img alt="light year admin" class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg"> </a>
                <font size="6">教学视频系统</font>
            </div>
            <form action="${basePath }/customer/register" method="get" name="form1" id="form1">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入您的手机号码" class="form-control" name="idNumber" id="idNumber" form="form1"/>
                    <span class="mdi mdi-cellphone-iphone form-control-feedback" aria-hidden="true"></span>
                </div>

                <div class="form-group has-feedback feedback-left">
                    <input type="password" placeholder="请输入密码(字母和数字8-12位)" class="form-control" id="password" name="password" form="form1" />
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left row">
                    <div class="col-xs-7">
                        <input id="identify" type="text" name="captcha" class="form-control" placeholder="验证码">
                        <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="col-xs-5" id="idenRow">
                        <!-- <img src="images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha"> -->
                        <button class="btn btn-primary" type="button" style="width: 100px;" id="identifyBtn" disabled="disabled">获取验证码</button>

                    </div>
                </div>
                <div class="form-group">
                    <button class="btn btn-block btn-primary" type="button" id="back">找回密码</button>
                </div>
            </form>
            <hr>
            <footer class="col-sm-12 text-center">
                <p class="m-b-0">Copyright &copy; 2019 <a href="http://zpf.xyz">周鹏飞</a>. All right reserved</p>
            </footer>
        </div>
    </div>
</div>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>

<script type="text/javascript" src="${basePath }/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/lightyear.js"></script>
<script type="text/javascript">
    $(function(){
        $("#register").click(function(){
            if(login()==true){
                //表单提交
                $("#form1").submit();
            }
        });

        $("#idNumber").blur(function(){
            var idNumber = $("#idNumber").val();
            if($.isEmptyObject($.trim(idNumber))){
                lightyear.notify('手机号不能为空！', 'danger');
                return false;
            }
            var idExp = /^1[3456789]\d{9}$/;
            if(idExp.test($.trim(idNumber))==true){
                $("#identifyBtn").removeAttr("disabled");
            }else{
                lightyear.notify('手机号格式错误！', 'danger');
                $("#identifyBtn").attr("disabled","disabled");
            }
        });

    })

    function login(){
        //判断手机号不能为空
        var idNumber = $("#idNumber").val();
        if($.isEmptyObject($.trim(idNumber))){
            lightyear.notify('手机号不能为空！', 'danger');
            return false;
        }
        //判断手机号的格式
        var idExp = /^1[3456789]\d{9}$/;
        if(idExp.test($.trim(idNumber))==false){
            lightyear.notify('手机号格式错误！', 'danger');
            return false;
        }

        //判断密码不能为空
        var password = $("#password").val();
        if($.isEmptyObject($.trim(password))){
            lightyear.notify('密码不能为空！', 'danger');
            return false;
        }
        //判断密码格式
        var pwdReg = /^\w{6,12}$/;
        if(pwdReg.test($.trim(password))==false){
            lightyear.notify('密码格式错误！', 'danger');
            return false;
        }

        //判断验证码不能为空
        var identify = $("#identify").val();
        if($.isEmptyObject($.trim(identify))){
            lightyear.notify('验证码不能为空！', 'danger');
            return false;
        }
        //判断验证码格式
        var identifyReg = /^\d{4}$/;
        if(identifyReg.test($.trim(identify))==false){
            lightyear.notify('验证码格式错误！', 'danger');
            return false;
        }
        return true;
    }
    function idNumberReg(){

    }
    $("#identifyBtn").click(function(){
        var idNumber = $("#idNumber").val();
        var idExp = /^1[3456789]\d{9}$/;
        if(idExp.test($.trim(idNumber))==false){
            lightyear.notify('手机号格式错误！', 'danger');
            return false;
        }

        /* $("#identifyBtn").remove(); */
        /* $("#idenRow").append('<label id="txt">60</label>'); */
        $("#identifyBtn").attr("disabled","disabled");
        getRandomCode();
        /* $.ajax({
            type:'post',
            url:this.href,
            datatype:'json',
            contentType:"application/json;charset=utf-8",
            data:{},
            async:true,
            beforeSend:function(){
                //启动页面加载层
                lightyear.loading('show');
            },
            success:function(college){
                //隐藏加载层
                lightyear.loading('hide');
            },
             error:function(){
                lightyear.notify('获取验证码失败！', 'danger');
            }
        }); */
    });


    var time = 61; //倒计时
    function getRandomCode() {
        if (time === 0) {
            time = 60;
            $("#identifyBtn").removeAttr("disabled");
            $('#identifyBtn').text('获取验证码');
            return;
        } else {
            time--;
            $('#identifyBtn').text(time);
        }
        setTimeout(function() {
            getRandomCode();
        },1000);
    }
</script>
</body>
</html>
