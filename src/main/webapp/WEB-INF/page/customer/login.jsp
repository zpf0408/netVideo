<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/11
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/base.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>登录页面</title>

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
        <div class="login-center" style="width: 460px">
            <div class="login-header text-center">
                <a href="${basePath }/video/index"> <img alt="light year admin" class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg"> </a>
                <font size="6">教学视频系统</font>
            </div>
            <form action="${basePath }/customer/login" method="post" id="form1" name="form1">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入您的手机号" class="form-control" value="${userName}" name="username" id="username" form="form1" />
                    <span class="mdi mdi-cellphone-iphone form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="password" placeholder="请输入密码" class="form-control"  id="password" name="password" form="form1" />
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <!-- <div class="form-group has-feedback feedback-left row">
                  <div class="col-xs-7">
                    <input type="text" name="captcha" class="form-control" placeholder="验证码">
                    <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
                  </div>
                  <div class="col-xs-5">
                    <img src="images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" onclick="this.src=this.src+'?d='+Math.random();" title="点击刷新" alt="captcha">
                  </div>
                </div> -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-lg-12" style="text-align: right">
                            <a href="${basePath }/customer/retrievePwd">忘记密码?</a>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <!-- class="btn btn-block btn-primary" -->
                    <input id="login1" class="btn btn-block btn-primary" type="button" form="form1" name="login1" value="立即登录">
                </div>
                <div class="form-group">

                    <label class="lyear-checkbox checkbox-primary m-t-10">
                        <input type="checkbox" checked="" name="remember" value="remember"><span>记住密码</span>
                    </label>
                </div>
                <div class="form-group" >
                    <div class="col-lg-5 text-left">
                        <a href="${basePath }/customer/register">验证登录</a>
                    </div>
                    <div class="col-lg-7 text-right">
                        还没有账号，<a href="${basePath }/customer/register">立即注册</a>
                    </div>

                    <!-- <button class="btn btn-w-md btn-primary" onclick="localtion.href=register.html" type="button">注册</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-w-md btn-primary" onclick="localtion.href=loginIdentify.html" type="button">验证码登录</button> -->
                </div>
            </form>
            <hr>
            <footer class="col-sm-12 text-center">
                <p class="m-b-0">Copyright © 2019 <a href="http://www.earlymorning.cn">周鹏飞</a>. All right reserved</p>
            </footer>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/lightyear.js"></script>
<script type="text/javascript">



    $(function(){

        var err = '${error}';
        if(err!=null&&err!=''){
            lightyear.notify(err, 'danger');
        }
        function login(){
            var username = $("#username").val();
            if($.isEmptyObject($.trim(username))){

                lightyear.notify('手机号不能为空！', 'danger');
                return false;
            }
            var idExp = /^1[3456789]\d{9}$/;
            if(idExp.test($.trim(username))==false){
                lightyear.notify('手机号格式错误！', 'danger');
                return false;
            }
            var bool = false;
            $.ajax({
                type:'post',
                url:'${basePath }/customer/getCustomerByTelephone',
                datatype:'json',
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify({telephone:username}),
                async:false,
                beforeSend:function(){
                    //启动页面加载层
                    lightyear.loading('show');
                },
                success:function(count){
                    //隐藏加载层
                    lightyear.loading('hide');
                    if(count==0){
                        lightyear.notify('手机号不存在请注册！', 'danger');
                    }else{
                        bool = true;
                    }
                },
                error:function(){
                    lightyear.notify('验证手机号失败！！！', 'danger');
                    lightyear.loading('hide');
                }
            });
            if(bool==false){
                return;
            }

            var password = $("#password").val();
            if($.isEmptyObject($.trim(password))){
                lightyear.notify('密码不能为空！', 'danger');
                return false;
            }
            return true;
        }
        $("#login1").click(function(){

           if(login()==true){
               $("#form1").submit();
           }

        });
    })
</script>

</html>
