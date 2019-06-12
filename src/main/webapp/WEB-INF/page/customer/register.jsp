<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/13
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/base.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>注册页面</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());

    %>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath}/static/css/animate.css" rel="stylesheet">
    <link href="${basePath}/static/css/style.min.css" rel="stylesheet">
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
                <a href="${basePath}/course/index"> <img alt="light year admin" class="img-avatar img-avatar-48 m-r-10" src="${basePath}/static/images/log2.jpg"> </a>
                <font size="6">教学视频系统</font>
            </div>
            <form action="${basePath}/customer/register" method="post" name="form1" id="form1">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入您的手机号码" value="${telephone}" class="form-control" name="idNumber" id="idNumber" form="form1"/>
                    <span class="mdi mdi-cellphone-iphone form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入用户名(字母和数字6-12位)" value="${username}" class="form-control" name="username" id="username" form="form1"/>
                    <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="password" placeholder="请输入登录密码(字母和数字8-12位)" class="form-control" id="password" name="password" form="form1" />
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
                    <button class="btn btn-block btn-primary" type="button" id="register">立即注册</button>
                </div>
            </form>
            <hr>
            <footer class="col-sm-12 text-center">
                <p class="m-b-0">Copyright &copy; 2019 <a href="http://zpf.xyz">周鹏飞</a>. All right reserved</p>
            </footer>
        </div>
    </div>
</div>
<script type="text/javascript" src="${basePath}/static/js/jquery.min.js"></script>

<script type="text/javascript" src="${basePath}/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath}/static/js/lightyear.js"></script>
<script type="text/javascript">
    $(function(){

        var err = '${error}';
        if(err!=null&&err!=''){
            lightyear.notify(err, 'danger');
        }

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
            if(idExp.test($.trim(idNumber))==false){
                lightyear.notify('手机号格式错误！', 'danger');
                $("#identifyBtn").attr("disabled","disabled");
                return false;
            }
            var b = regTele();
            if(b == false){
                $("#identifyBtn").attr("disabled","disabled");
            }else{
                $("#identifyBtn").removeAttr("disabled");
            }
        });

    })
        function regTele(){
            var b = false;
            var idNumber = $("#idNumber").val();
            $.ajax({
                type:'post',
                url:'${APP_PATH }/customer/getCustomerByTelephone',
                datatype:'json',
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify({telephone:idNumber}),
                async:false,
                beforeSend:function(){
                    //启动页面加载层
                    lightyear.loading('show');
                },
                success:function(count){
                    //隐藏加载层
                    lightyear.loading('hide');
                    if(count==1){
                        lightyear.notify('手机号已存在，请直接登录！', 'danger');
                        b = false;
                    }else{
                        b =  true;
                    }
                },
                error:function(){
                    lightyear.loading('hide');
                    lightyear.notify('验证手机号失败！！！', 'danger');
                    b = false;
                }
            });
            return b;
        }
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
        //手机号是否存在
        var b = regTele();

        if(b==false){
            return b;
        }
        //判断用户名不能为空
        var username = $("#username").val();
        if($.isEmptyObject($.trim(username))){
            lightyear.notify('用户名不能为空！', 'danger');
            return false;
        }
        //判断用户名格式
        var userReg = /^\w{6,12}$/;
        if(userReg.test($.trim(username))==false){
            lightyear.notify('用户名格式错误！', 'danger');
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

    $("#identifyBtn").click(function(){
        var idNumber = $("#idNumber").val();
        var idExp = /^1[3456789]\d{9}$/;
        if(idExp.test($.trim(idNumber))==false){
            lightyear.notify('手机号格式错误！', 'danger');
            return false;
        }

        /* $("#identifyBtn").remove(); */
        /* $("#idenRow").append('<label id="txt">60</label>'); */


        var b = generateNote();
        if(b==true){
            $("#identifyBtn").attr("disabled","disabled");
            getRandomCode();
        }


    });
    //启动发送短信
    function generateNote(){
        var b = false;
        var idNumber = $("#idNumber").val();
        $.ajax({
            type:'post',
            url:'${APP_PATH }/customer/generateNote',
            datatype:'json',
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify({telephone:idNumber}),
            async:false,
            beforeSend:function(){
                //启动页面加载层
                lightyear.loading('show');
            },
            success:function(messageResult){
                //隐藏加载层
                lightyear.loading('hide');
                if(messageResult.code=='0'){
                    b = true;
                }else{
                    lightyear.notify(messageResult.message, 'danger');
                    b =  false;
                }
            },
            error:function(){
                lightyear.notify('获取验证码失败！！！', 'danger');
                b = false;
            }
        });
        return b;
    }

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
