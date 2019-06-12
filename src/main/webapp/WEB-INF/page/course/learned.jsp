<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/18
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/base.jsp" %>
<%
    pageContext.setAttribute("basePath", request.getContextPath());

%>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>个人课程</title>
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
<header >

    <nav class="navbar navbar-default">

        <div class="navbar-header">
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg" alt="" />
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="${basePath }/course/index">首页</a></li>
                <li><a href="${basePath }/course/courseDisplay/0">全部</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${courseTypes}" var="vts">
                            <li><a href="${basePath }/course/courseDisplay/${vts.typeId}">${vts.typeName}</a></li>
                        </c:forEach>
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
                        <li> <a href="${basePath }/course/learning"><i class="mdi mdi-account"></i> 个人中心</a> </li>

                        <li> <a href="${basePath }/customer/updPassword"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                        <li> <a href="${basePath }/course/learning"><i class="mdi mdi-comment-alert-outline"></i> 系统通知 <span class="badge">4</span></a> </li>


                        <li> <a href="${basePath }/customer/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                    </ul>
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

                        <li class="nav nav-subnav active">
                            <a href="${basePath }/course/learning"><i class="mdi mdi-server"></i> 个人课程</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/customer/personInfo"><i class="mdi mdi-account-card-details"></i> 个人信息</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/favorite"><i class="mdi mdi-file-outline"></i> 个人收藏</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/customer/updPassword"><i class="mdi mdi-lock-outline"></i> 修改密码</a>

                        </li>
                        <li class="nav nav-subnav">
                            <a href="${basePath }/customer/personInfo"><i class="mdi mdi-currency-cny"></i> 会员中心</a>

                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-xs-10">
            <div class="card-header"><h4>个人课程</h4></div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <ul class="nav nav-tabs">
                            <li> <a href="${basePath}/course/learning">学习中</a> </li>
                            <li class="active"> <a href="javascript:void(0)">已学完</a> </li>

                        </ul>
                        <c:forEach items="${courseLearns}" var="courseLearn">
                            <div class="row">
                                <div class="col-lg-3" style="margin-top: 15px;margin-left: 20px;">
                                    <a href="${basePath }/course/${courseLearn.course.courseId}" class="thumbnail">
                                        <img src="${basePath }/static/img/${courseLearn.course.url}" alt="...">
                                        <h4>&nbsp;&nbsp;${courseLearn.course.courseName}</h4>
                                    </a>
                                </div>
                                <div class="col-lg-6" style="text-align: center; ">
                                    <div class="progress" style="margin: 80px;">

                                        <div class="progress-bar" role="progressbar" style="width: ${courseLearn.learnCount/courseLearn.course.videoCount*100}%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                            ${courseLearn.learnCount/courseLearn.course.videoCount*100}%
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-2" style="margin-top: 65px;">
                                    <button class="btn btn-w-md btn-round btn-primary" onclick="window.location='${basePath }/course/${courseLearn.course.courseId}'">查看课程</button>
                                </div>
                            </div>
                        </c:forEach>




                        <c:if test="${rowBounds.pages>1}">
                            <div class="row" style="text-align: center;">
                                <nav>
                                    <ul class="pagination pagination-circle">
                                        <li class="${rowBounds.curPage==1?'disabled':null}">
                                            <a href="${basePath }/course/learned?page=${rowBounds.curPage-1}">
                                                <span><i class="mdi mdi-chevron-left"></i></span>
                                            </a>
                                        </li>
                                        <c:forEach begin="1" end="${rowBounds.pages}" var="page">
                                            <li class="${rowBounds.curPage==page?'active':null}"><a href="${basePath }/course/learned?page=${page}">${page}</a></li>
                                        </c:forEach>

                                        <li class="${rowBounds.curPage==rowBounds.pages?'disabled':null}">
                                            <a href="${basePath }/course/learned?page=${rowBounds.curPage+1}">
                                                <span><i class="mdi mdi-chevron-right"></i></span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>

                        </c:if>




                    </div>
                </div>
            </div>



        </div>
    </div>
    <jsp:include page="../include/copyRight.jsp"/>
</div>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap.min.js"></script>
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


</script>
</body>
</html>
