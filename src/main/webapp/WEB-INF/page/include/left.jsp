<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/18
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<div class="lyear-layout-sidebar-scroll">
    <nav class="sidebar-main">
        <ul class="nav nav-drawer">

            <li class="nav nav-subnav">
                <a href="${APP_PATH }/course/learning"><i class="mdi mdi-server"></i> 个人课程</a>
            </li>
            <li class="nav nav-subnav active">
                <a href="${APP_PATH }/customer/personInfo"><i class="mdi mdi-account-card-details"></i> 个人信息</a>
            </li>
            <li class="nav nav-subnav">
                <a href="${APP_PATH }/course/favorite"><i class="mdi mdi-file-outline"></i> 个人收藏</a>

            </li>
            <li class="nav nav-subnav">
                <a href="${APP_PATH}/course/favorite"><i class="mdi mdi-lock-outline"></i> 修改密码</a>

            </li>
            <li class="nav nav-subnav">
                <a href="${APP_PATH }/customer/personInfo"><i class="mdi mdi-currency-cny"></i> 会员中心</a>

            </li>
        </ul>
    </nav>
</div>
