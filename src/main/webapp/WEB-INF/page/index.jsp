<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/13
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/base.jsp" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<html>
<head>
    <meta charset="utf-8">
    <title>视频教学主页</title>
    <link rel="icon" href="${basePath }/static/icons/favicon.ico" type="image/ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link href="${basePath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/style.min.css" rel="stylesheet">
</head>
<body>
<header style="height: 30px;">

    <nav class="navbar navbar-default">
        <div class="navbar-header">
            &nbsp;&nbsp;&nbsp;
            <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg" alt="" />
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="${basePath }/course/index">首页</a></li>
                <li><a href="${basePath }/course/courseDisplay/0" target="_blank">全部</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${courseTypes}" var="vts">
                            <li><a href="${basePath }/course/courseDisplay/${vts.typeId}" target="_blank">${vts.typeName}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" action="${basePath }/course/search" id="form1" name="form1">
                <div class="form-group">
                    <input type="text" id="q" name="q" class="form-control" placeholder="全文搜索" form="form1">
                </div>
                <button type="submit" class="btn btn-default" id="btn01">全文搜索</button>
            </form>
            <c:choose>
                <c:when test="${sessionScope.customer!=null}">
                    <ul class="navbar-nav navbar-right" style="list-style: none;">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/users/${sessionScope.customer.headUrl}" alt="" />
                                <span>${sessionScope.customer.name} <span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li> <a href="${basePath }/course/learning" target="_blank"><i class="mdi mdi-account"></i> 个人中心</a> </li>
                                <li> <a href="${basePath }/customer/updPassword" target="_blank"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                                <li> <a href="${basePath }/customer/personInfo" target="_blank"><i class="mdi mdi-comment-alert-outline"></i> 系统通知 <span class="badge">4</span></a>
                                </li>
                                <li> <a href="${basePath }/customer/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <div style="height: 100%; vertical-align: bottom;margin-top: 15px; margin-right: 5px;" class="navbar-right">
                        <a href="${basePath }/customer/login">
                            <font color="red">登录&nbsp;&nbsp;/&nbsp;&nbsp;注册</font>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>


        </div>
    </nav>
</header>
<div class="container">
    <div class="row">

        <div class="col-xs-12" style="margin: 4px;">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">

                    <c:forEach begin="0" end="${roundDiagrams.size()-1}" var="i">
                        <li data-target="#carousel-example-generic" data-slide-to="${i}" class="${i==0?'active':null}"></li>
                    </c:forEach>

                </ol>

                <div class="carousel-inner" role="listbox">
                    <c:forEach items="${roundDiagrams}" var="rd" begin="0" end="${roundDiagrams.size()-1}" varStatus="roundStatus">

                            <div class="item ${roundStatus.index==0?'active':null}">
                                <a href="${basePath}/course/${rd.courseId}">
                                    <img src="${basePath }/static/images/gallery/${rd.url}" alt="...">
                                </a>
                                <div class="carousel-caption">
                                        ${rd.descript}
                                </div>
                            </div>


                    </c:forEach>

                </div>
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <br />
    <c:forEach items="${courseTypes}" var="cts" >
        <label style="font-size:20px ;"><c:out value="${cts.typeName}"/></label>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
        <a href="${APP_PATH }/course/courseDisplay/${cts.typeId}">
            <font color="red">全部课程</font>
        </a>
        <div class="row">
        <c:forEach items="${courses}" var="course">
            <c:if test="${course.courseType.typeId==cts.typeId}">
                <div class="col-xs-6 col-md-3">
                    <a href="${basePath }/course/${course.courseId}" class="thumbnail" target="_blank">
                        <img src="${APP_PATH }/static/img/${course.url}" alt="...">
                        <h4>&nbsp;&nbsp;${course.courseName}</h4>
                    </a>

                </div>
            </c:if>
        </c:forEach>
        </div>
    </c:forEach>


    <jsp:include page="include/copyRight.jsp" />
</div>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/main.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/Chart.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/lightyear.js"></script>
<script type="text/javascript" src="${basePath }/static/js/search.js"></script>

</body>


</html>