<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/16
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/base.jsp" %>
<html>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<head>
    <meta charset="utf-8">
    <title>课程列表</title>
    <link rel="icon" href="${basePath }/static/icons/favicon.ico" type="image/ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/style.min.css" rel="stylesheet">

</head>
<body>
<header>

    <nav class="navbar navbar-default">
        <div class="navbar-header">
            &nbsp;&nbsp;&nbsp;
            <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg" alt="" />
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="${basePath }/course/index">首页</a></li>
                <li><a href="${basePath }/course/courseDisplay/0">全部</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${courseTypes}" var="vts">
                            <li><a href="${basePath}/course/courseDisplay/${vts.typeId}">${vts.typeName}</a></li>
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
            <ul class="navbar-nav navbar-right" style="list-style: none;">

                <li class="dropdown dropdown-profile">
                    <a href="javascript:void(0)" data-toggle="dropdown">
                        <img class="img-avatar img-avatar-48 m-r-10" src="${APP_PATH }/static/images/users/${sessionScope.customer.headUrl}" alt="" />
                        <span>${sessionScope.customer.name} <span class="caret"></span></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li> <a href="${basePath }/course/learning"><i class="mdi mdi-account"></i> 个人中心</a> </li>
                        <li> <a href="${basePath }/customer/updPassword"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                        <li> <a href="${basePath }/course/learning"><i class="mdi mdi-comment-alert-outline"></i> 系统通知 <span class="badge">4</span></a>
                        </li>
                        <li> <a href="${basePath }/customer/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                    </ul>

                </li>
            </ul>

        </div>

    </nav>
</header>
<div class="container">
    <h4>课程列表</h4>
    <br />
    <div class="card">
        <div class="card-header">
            <h4>${courseType.typeName}</h4>
        </div>
        <div class="row" style="margin: 10px 20px;">
            <c:forEach items="${courses}" var="course">
                <div class="col-xs-6 col-md-3">
                    <a href="${basePath }/course/${course.courseId}" class="thumbnail">
                        <img src="${basePath }/static/img/${course.url}" alt="...">
                        <h4>&nbsp;&nbsp;${course.courseName}</h4>
                    </a>
                </div>
            </c:forEach>




        </div>
        <div class="row" style="text-align: center;">
            <c:if test="${rowBounds!=null&&rowBounds.pages>1}">
                <div class="row" style="text-align: center;">
                    <nav>
                        <ul class="pagination pagination-circle">
                            <li class="${rowBounds.curPage==1?'disabled':null}">
                                <a href="${basePath }/course/courseDisplay/${courseType.typeId}?page=${rowBounds.curPage-1}">
                                    <span><i class="mdi mdi-chevron-left"></i></span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${rowBounds.pages}" var="page">
                                <li class="${rowBounds.curPage==page?'active':null}"><a href="${basePath }/course/courseDisplay/${courseType.typeId}?page=${page}">${page}</a></li>
                            </c:forEach>

                            <li class="${rowBounds.curPage==rowBounds.pages?'disabled':null}">
                                <a href="${basePath }/course/courseDisplay/${courseType.typeId}?page=${rowBounds.curPage+1}">
                                    <span><i class="mdi mdi-chevron-right"></i></span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </c:if>
        </div>
    </div>
    <jsp:include page="../include/copyRight.jsp" />
</div>


</body>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/main.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/Chart.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/lightyear.js"></script>
<script type="text/javascript" src="${basePath }/static/js/search.js"></script>
</html>
