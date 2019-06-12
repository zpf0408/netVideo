
<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/18
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/base.jsp" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>

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
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="全文搜索">
                </div>
                <button type="submit" class="btn btn-default">全文搜索</button>
            </form>
            <ul class="navbar-nav navbar-right" style="list-style: none;">

                <li class="dropdown dropdown-profile">
                    <a href="javascript:void(0)" data-toggle="dropdown">
                        <img class="img-avatar img-avatar-48 m-r-10" src="${APP_PATH }/static/images/users/defaulthead.jpg" alt="" />
                        <span>earlymorning1010 <span class="caret"></span></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li> <a href="${basePath }/customer/personInfo"><i class="mdi mdi-account"></i> 个人中心</a> </li>
                        <li> <a href="${basePath }/customer/personInfo"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
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