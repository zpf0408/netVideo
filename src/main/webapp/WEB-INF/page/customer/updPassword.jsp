<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/18
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/base.jsp" %>

<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>修改密码</title>
    <link rel="icon" href="${basePath }/static/icons/favicon.ico" type="image/ico">

    <link href="${basePath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/style.min.css" rel="stylesheet">

    <!--时间选择插件-->
    <link rel="stylesheet" href="${basePath }/static/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
    <!--日期选择插件-->
    <link rel="stylesheet" href="${basePath }/static/js/bootstrap-datepicker/bootstrap-datepicker3.min.css">

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
                        <li class="nav nav-subnav">
                            <a href="${basePath }/customer/personInfo"><i class="mdi mdi-account-card-details"></i> 个人信息</a>
                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/favorite"><i class="mdi mdi-file-outline"></i> 个人收藏</a>

                        </li>
                        <li class="nav nav-subnav active">
                            <a href="javascript:void(0)"><i class="mdi mdi-lock-outline"></i> 修改密码</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/customer/personInfo"><i class="mdi mdi-currency-cny"></i> 会员中心</a>

                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-xs-10">

            <div class="card-header"><h4>修改密码</h4></div>
            <div class="card-body" style="height: 360px;">
                <form action="${basePath}/customer/updPassword" method="post" id="form2" name="form2">

                    <div class="form-group">
                        <label for="example-nf-password">旧密码</label>
                        <input class="form-control" type="password" id="password" form="form2" name="password" placeholder="请输入旧密码..">
                    </div>
                    <div class="form-group">
                        <label for="example-nf-password">新密码</label>
                        <input class="form-control" type="password" id="npassword" form="form2" name="npassword" placeholder="请输入登录密码(字母和数字8-12位)">
                    </div>
                    <div class="form-group">
                        <label for="example-nf-password">确认新密码</label>
                        <input class="form-control" type="password" id="npassword1" form="form2" name="npassword1" placeholder="请输入新密码..">
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" id="btn02" value="确定" form="form2"  />
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


<script type="text/javascript" src="${basePath }/static/js/main.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/search.js"></script>
<script type="text/javascript">
 $(function(){
     var err = '${error}';
     if(err!=null&&err!=''){
         lightyear.notify(err, 'danger');
     }

     $("#btn02").click(function(){
         var password = $("#password").val();
         var npassword =  $("#npassword").val();
         var npassword1 =  $("#npassword1").val();
         if($.isEmptyObject($.trim(password))){
             lightyear.notify('旧密码不能为空！', 'danger');
             return;
         }
         if($.isEmptyObject($.trim(npassword))){
             lightyear.notify('新密码不能为空！', 'danger');
             return;
         }
         if($.isEmptyObject($.trim(npassword1))){
             lightyear.notify('新密码不能为空！', 'danger');
             return;
         }
         if(npassword!=npassword1){
             lightyear.notify('两个新密码不同！', 'danger');
             return;
         }
         var pwdReg = /^\w{6,12}$/;
         if(pwdReg.test($.trim(npassword))==false||pwdReg.test($.trim(npassword1))==false){
             lightyear.notify('新密码格式错误！', 'danger');
             return;
         }
         $("#form2").submit();
     })
 })
</script>
</body>
</html>
