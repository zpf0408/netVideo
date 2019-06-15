
<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/18
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/base.jsp" %>
<%
    pageContext.setAttribute("basePath", request.getContextPath());

%>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>个人信息</title>
    <link rel="icon" href="${basePath }/static/icons/favicon.ico" type="image/ico">

    <link href="${basePath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/style.min.css" rel="stylesheet">

    <!--时间选择插件-->
    <link rel="stylesheet" href="${basePath }/static/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
    <!--日期选择插件-->
    <link rel="stylesheet" href="${basePath}/static/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">


</head>

<body>

<header>
    <nav class="navbar navbar-default">


        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="navbar-header">
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg" alt="" />



        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <!-- <li><img class="img-avatar img-avatar-48 m-r-10" src="images/log2.jpg" alt="" /></li> -->
                <li><a href="${basePath }/course/index">首页</a></li>
                <li><a href="${basePath }/course/courseDisplay/0">全部</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <ul class="dropdown-menu">
                            <c:forEach items="${courseTypes}" var="vts">
                                <li><a href="${basePath }/course/courseDisplay/${vts.typeId}">${vts.typeName}</a></li>
                            </c:forEach>
                        </ul>
                    </ul>
                </li>
            </ul>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <form class="navbar-form navbar-left" action="${basePath }/course/search" id="form1" name="form1">
                <div class="form-group">
                    <input type="text" id="q" name="q" class="form-control" placeholder="全文搜索" form="form1">
                </div>
                <button type="submit" class="btn btn-default" id="btn01">全文搜索</button>
            </form>
            <ul class="navbar-nav navbar-right" style="list-style: none;">

                <li class="dropdown dropdown-profile">
                    <a href="javascript:void(0)" data-toggle="dropdown">
                        <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/users/${sessionScope.customer.headUrl}" alt="" />
                        <span>${sessionScope.customer.name} <span class="caret"></span></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li> <a href="${basePath }/customer/personInfo"><i class="mdi mdi-account"></i> 个人中心</a> </li>
                        <li> <a href="${basePath }/customer/updPassword"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                        <li> <a href="${basePath }/customer/personInfo"><i class="mdi mdi-comment-alert-outline"></i> 系统通知 <span class="badge">4</span></a> </li>

                        <li> <a href="${basePath }/customer/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                    </ul>
                    <!-- <a href="./login.html"><font color="red">登录&nbsp;&nbsp;/&nbsp;&nbsp;注册</font></a> -->
                </li>
            </ul>
            <div>&nbsp;&nbsp;&nbsp;</div>
        </div>
    </nav>
</header>


<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <div class="lyear-layout-sidebar-scroll">
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">

                        <li class="nav nav-subnav">
                            <a href="${basePath }/course/learning"><i class="mdi mdi-server"></i> 个人课程</a>
                        </li>
                        <li class="nav nav-subnav active">
                            <a href="javascript:void(0)"><i class="mdi mdi-account-card-details"></i> 个人信息</a>
                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/favorite"><i class="mdi mdi-file-outline"></i> 个人收藏</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath}/customer/updPassword"><i class="mdi mdi-lock-outline"></i> 修改密码</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/customer/personInfo"><i class="mdi mdi-currency-cny"></i> 会员中心</a>

                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-xs-10">

            <div class="card-header"><h4>个人信息</h4></div>
            <div class="card-body">

                <form class="form-horizontal" action="${basePath }/customer/personInfo" method="post" enctype="multipart/form-data" onsubmit="return false;" name="form1">
                    <div class="form-group">
                        <label class="col-xs-12" for="example-text-input">用户名*</label>
                        <div class="col-xs-12">

                            <input class="form-control" type="text" id="realname" form="form1" name="example-text-input" value="${sessionScope.customer.name}" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12" for="example-text-input">真实姓名</label>
                        <div class="col-xs-12">

                            <input class="form-control" type="text" id="username" form="form1" name="example-text-input" value="${sessionScope.customer.realName}" placeholder="请输入真实姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12">性别*</label>
                        <div class="col-xs-12">
                            <label class="radio-inline" for="example-inline-radio1">
                                <input type="radio" id="example-inline-radio1" checked="${sessionScope.customer.sex==1?'checked':null}" name="sex" value="option1" form="form1">
                                男
                            </label>
                            <label class="radio-inline" for="example-inline-radio2">
                                <input type="radio" id="example-inline-radio2" name="sex" checked="${sessionScope.customer.sex==0?'checked':null}" value="option2" form="form1">
                                女
                            </label>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12" for="example-email-input">邮箱</label>
                        <div class="col-xs-12">
                            <input class="form-control" type="email" id="email" form="form1" name="example-email-input" value="${sessionScope.customer.email}" placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12" for="example-email-input">职业</label>
                        <div class="col-xs-12">
                            <input class="form-control"  id="profession" form="form1" name="example-email-input" placeholder="请输入职业">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12" for="example-file-input">个人头像</label>
                        <div class="col-xs-12">
                            <input type="file" id="personalhead" name="example-file-input" value="${sessionScope.customer.headUrl}" form="form1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12" for="example-text-input-success">出生日期</label>
                        <div class="col-xs-12">
                           <%-- <fmt:formatDate value="${sessionScope.customer.birthday}" pattern="yyyy-MM-dd" var="d" />--%>
                            <input class="form-control js-datepicker m-b-10" type="text" id="birthday" name="example-datepicker" form="form1" placeholder="yyyy-mm-dd" value="${sessionScope.customer.birthday}" data-date-format="yyyy-mm-dd" />

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-xs-12" for="example-textarea-input">兴趣爱好</label>
                        <div class="col-xs-12">
                            <textarea class="form-control" id="example-textarea-input" name="example-textarea-input" rows="6" placeholder="内容..">${sessionScope.customer.interesting}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-12" for="example-select">名族</label>
                        <div class="col-xs-12">
                            <select class="form-control" id="example-select" name="example-select" size="1">
                                <option value="0" ${empty sessionScope.customer.ethnic?'selected':''} >请选择</option>
                                <option value="汉族" ${sessionScope.customer.ethnic=='汉族'?'selected':''}>汉族</option>
                                <option value="满族" ${sessionScope.customer.ethnic=='满族'?'selected':''}>满族</option>
                                <option value="回族" ${sessionScope.customer.ethnic=='回族'?'selected':''}>回族</option>
                                <option value="维吾尔族" ${sessionScope.customer.ethnic=='维吾尔族'?'selected':''}>维吾尔族</option>
                                <option value="朝鲜族" ${sessionScope.customer.ethnic=='朝鲜族'?'selected':''}>朝鲜族</option>
                                <option value="藏族" ${sessionScope.customer.ethnic=='藏族'?'selected':''}>藏族</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <button class="btn btn-primary" id="updinfo" type="submit">提交</button>
                        </div>
                    </div>
                </form>

            </div>

        </div>
    </div>
   <jsp:include page="../include/copyRight.jsp" />
</div>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/perfect-scrollbar.min.js"></script>

<script type="text/javascript" src="${basePath }/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/lightyear.js"></script>

<!--图表插件-->
<script type="text/javascript" src="${basePath }/static/js/Chart.js"></script>


<script type="text/javascript" src="${basePath }/static/js/bootstrap-datetimepicker/moment.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-datetimepicker/locale/zh-cn.js"></script>
<!--日期选择插件-->
<script type="text/javascript" src="${basePath }/static/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/main.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/search.js"></script>
<script type="text/javascript">
    $(function(){
        $("#updinfo").click(function(){
            if(info()==true){
                $("#form1").submit();
            }
        });
    })
function info(){
    var $username = $("#username").val();
    if($.isEmptyObject($.trim($username))){
        lightyear.notify('用户名不能为空！', 'danger');
        return false;
    }
    var userReg = /^\w{6,20}$/;
    if(userReg.test($.trim($username))==false){
        lightyear.notify('用户名格式错误！', 'danger');
        return false;
    }
    var val=$('input:radio[name="sex"]:checked').val();
    if(val==null){
        lightyear.notify('请选择性别！', 'danger');
        return false;
    }
    var $email = $("#email").val();
    if($.isEmptyObject($.trim($email))){
        lightyear.notify('邮箱不能为空！', 'danger');
        return false;
    }
    var emailReg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    if(emailReg.test($.trim($email))==false){
        lightyear.notify('邮箱格式错误！', 'danger');
        return false;
    }

    var $birthday = $("#birthday").val();
    if($.isEmptyObject($.trim($birthday))){
        lightyear.notify('生日框不能为空！', 'danger');
        return false;
    }

    var d = new Date($birthday);
    var d1 = new Date();
    if(d.getTime()>d1.getTime()){
        lightyear.notify('生日不能超过当前时间！', 'danger');
        return false;
    }
    return true;
}
</script>
</body>
</html>