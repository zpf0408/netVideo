<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/24
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/base.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程详情</title>
    <link rel="icon" href="${basePath }/static/icons/favicon.ico" type="image/ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <link href="${basePath }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${basePath }/static/css/style.min.css" rel="stylesheet">
    <style>
        /**
     * 图标示例样式(这里单独放页面中)
     * example-icons
     */
        .example-icons {
            padding: 0 20px 10px 20px;
            -webkit-column-count: 4;
            -moz-column-count: 4;
            column-count: 4;
            -webkit-column-gap: 20px;
            -moz-column-gap: 20px;
            column-gap: 20px;
        }

        .example-icons div {
            line-height: 2.5em;
        }

        .example-icons div span {
            cursor: pointer;
            font-size: 14px;
            text-overflow: ellipsis;
            display: inline-block;
            max-width: calc(100% - 90px);
            overflow: hidden;
            vertical-align: middle;
            white-space: nowrap;
        }

        .example-icons div code:hover,
        .example-icons div span:hover,
        .example-icons div i:hover {
            color: #33cabb;
        }

        .example-icons div code:hover {
            border-color: #33cabb;
        }

        .example-icons div code {
            border: 1px solid #DDD;
            width: 46px;
            margin-left: 2px;
            margin-right: 4px;
            border-radius: 4px;
            display: inline-block;
            vertical-align: middle;
            text-align: center;
            line-height: 24px;
            cursor: pointer;
        }

        .example-icons div i {
            display: inline-block;
            width: 32px;
            height: 24px;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            line-height: 24px;
        }

        .example-icons .mdi:before {
            font-size: 24px;
        }
    </style>
</head>
<body>
<header>

    <nav class="navbar navbar-default">


        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="navbar-header">
            &nbsp;&nbsp;&nbsp;
            <img class="img-avatar img-avatar-48 m-r-10" src="${basePath }/static/images/log2.jpg" alt=""/>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="${basePath }/course/index">首页</a></li>
                <li><a href="${basePath }/course/courseDisplay/0">全部</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">分类
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${courseTypes}" var="vts">
                            <li><a href="${basePath }/course/courseDisplay/${vts.typeId}">${vts.typeName}</a></li>
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
                        <img class="img-avatar img-avatar-48 m-r-10"
                             src="${basePath }/static/images/users/${sessionScope.customer.headUrl}" alt=""/>
                        <span>${sessionScope.customer.name} <span class="caret"></span></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="${basePath }/course/learning"><i class="mdi mdi-account"></i> 个人中心</a></li>
                        <li><a href="${basePath }/customer/updPassword"><i class="mdi mdi-lock-outline"></i> 修改密码</a>
                        </li>
                        <li><a href="${basePath }/course/learning"><i class="mdi mdi-comment-alert-outline"></i> 系统通知
                            <span class="badge">4</span></a>
                        </li>
                        <li><a href="${basePath }/customer/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
</header>
<div class="container">
    <ol class="breadcrumb breadcrumb-o">
        <li><a href="${basePath }/course/index">首页</a></li>
        <li><a href="${basePath }/course/courseDisplay/${course.courseType.typeId}">${course.courseType.typeName}</a>
        </li>
        <li><a href="javascript:void(0)">${course.courseName}</a></li>

    </ol>
    <div class="row">
        <div class="card">
            <div class="card-body" style="height: 180px;">
                <div class="col-lg-3 col-md-3 text-right">
                    <a href="javascript:void(0)" class="thumbnail">
                        <img src="${basePath }/static/img/${course.url}" alt="...">
                    </a>
                </div>
                <div class="col-lg-3 text-center" style="margin-top: 30px;">
                    <div class="row">
                        <h4>jenkins</h4>
                    </div>
                    <div class="row">
								<span style="font-size: large;">
									价格：
									免费
								</span>
                    </div>
                </div>
                <div class="col-lg-3 text-center example-icons" style="margin-top: 30px;">
                    <div><a href="javascript:void(0);" onclick="collect()"><i class="mdi ${favorite==null?'mdi mdi-heart-outline':'mdi-heart'}" id="favorite"
                                                                             data-toggle="tooltip" data-placement="top" title="${favorite==null?'收藏':'取消收藏'}"></i></a>
                    </div>
                    <div><a href="javascript:void(0)"><i class="mdi mdi-share-variant" data-toggle="tooltip"
                                                         data-placement="top" title="分享"></i></a></div>
                </div>
                <div class="col-lg-3 text-left mdi-verified" style="margin-top: 35px;">
                    <button class="btn btn-w-md btn-round btn-primary" id="btn02">
                        <c:choose>
                            <c:when test="${courseLearn==null}">
                                加入学习
                            </c:when>
                            <c:otherwise>
                                继续学习
                            </c:otherwise>
                        </c:choose>

                    </button>

                </div>
            </div>
        </div>


    </div>
    <div class="row">
        <div class="col-lg-9">
            <div class="card">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a href="${basePath}/course/${course.courseId}">目录</a></li>
                    <li class="nav-item active"><a data-toggle="tab" href="#comment">评价</a></li>
                    <li class="nav-item"><a data-toggle="tab" href="#introduce">介绍</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="comment">
                        <div class="card-header">请评论</div>
                        <div class="card-body">
                            <textarea class="form-control" id="example-textarea-input" name="example-textarea-input" rows="6" placeholder="内容.."></textarea>
                            <button class="btn-sm  btn-round btn-primary">提交</button>
                            <hr />

                        </div>

                    </div>
                    <div class="tab-pane fade" id="introduce">
                        <div class="card-header">课程介绍</div>
                        <div class="card-body">
                            ${course.courseDescript}
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>



            </div>
        </div>
        <div class="col-lg-3">
            <div class="card">
                <ul class="nav nav-tabs">
                    <li><a href="javascript:void(0)">下载资料</a></li>

                </ul>
                <div class="row example-icons">
                    <div class="col-lg-12 text-left">

                        <a href="#"><i class="mdi mdi-arrow-down-box"></i></a>
                        <span>课程资料</span>


                    </div>

                </div>
            </div>

        </div>

    </div>
    <jsp:include page="../include/copyRight.jsp"/>

</div>


</body>
<script type="text/javascript" src="${basePath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/lightyear.js"></script>
<script type="text/javascript" src="${basePath }/static/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/main.min.js"></script>
<script type="text/javascript" src="${basePath }/static/js/Chart.js"></script>
<script type="text/javascript" src="${basePath }/static/js/search.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btn02").click(function(){
            var cou = "${courseLearn}";
            if($.isEmptyObject($.trim(cou))){
                window.location.href="${basePath}/course/learn/${course.courseId}";
            }else{
                window.location.href="${basePath }/video/${videos.get(0).videoId}";
            }
        });

        function collect(){
            var customerId = "${sessionScope.customer.id}";
            var courseId = "${course.courseId}";
            $.ajax({
                type:'post',
                url:'${basePath }/collect',
                datatype:'json',
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify({customer:{id:customerId},course:{courseId:courseId}}),
                async:false,
                beforeSend:function(){
                    //启动页面加载层
                    lightyear.loading('show');
                },
                success:function(messageResult){
                    //隐藏加载层
                    lightyear.loading('hide');
                    if(messageResult.code=='0'){
                        $("#favorite").attr("class","mdi mdi-heart");
                    }else if(messageResult.code=='2'){
                        $("#favorite").attr("class","mdi mdi-heart-outline");
                    }else if(messageResult.code=='1'){
                        lightyear.notify(messageResult.message, 'danger');
                    }

                },
                error:function(){
                    lightyear.loading('hide');
                    lightyear.notify('操作失败！！！', 'danger');

                }
            });
        }

    });

</script>
</html>
