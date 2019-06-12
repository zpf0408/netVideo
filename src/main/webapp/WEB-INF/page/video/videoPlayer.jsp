<%--
  Created by IntelliJ IDEA.
  User: 63299
  Date: 2019/5/18
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/base.jsp" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>视频播放</title>
    <link rel="icon" href="${APP_PATH }/static/icons/favicon.ico" type="image/ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link href="${APP_PATH }/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/style.min.css" rel="stylesheet">
    <link href="${APP_PATH }/static/css/video-js.min.css" rel="stylesheet">
</head>
<body>
<header>

    <nav class="navbar navbar-default">


        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="navbar-header">
            &nbsp;&nbsp;&nbsp;
            <img class="img-avatar img-avatar-48 m-r-10" src="${APP_PATH }/static/images/log2.jpg" alt="" />
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="${APP_PATH }/course/index">首页</a></li>
                <li><a href="${APP_PATH }/course/courseDisplay/0">全部</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">分类
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${courseTypes}" var="vts">
                            <li><a href="${APP_PATH }/course/courseDisplay/${vts.typeId}">${vts.typeName}</a></li>
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
                             src="${APP_PATH }/static/images/users/${sessionScope.customer.headUrl}" alt=""/>
                        <span>${sessionScope.customer.name} <span class="caret"></span></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="${APP_PATH }/course/learning"><i class="mdi mdi-account"></i> 个人中心</a></li>
                        <li><a href="${APP_PATH }/customer/updCustomer"><i class="mdi mdi-lock-outline"></i> 修改密码</a>
                        </li>
                        <li><a href="${APP_PATH }/course/learning"><i class="mdi mdi-comment-alert-outline"></i> 系统通知
                            <span class="badge">4</span></a>
                        </li>
                        <li><a href="${APP_PATH }/customer/logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
</header>
<div class="container">
    <ol class="breadcrumb breadcrumb-o">
        <li><a href="${APP_PATH}/course/${video.courseId}"><i class="mdi mdi-chevron-left"></i>返回课程</a></li>
        <li>任务1：${video.videoName}</li>


    </ol>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-9">

            <video id="my-video" class="video-js" controls preload="auto" width="960" height="400"
                   poster="${APP_PATH }/static/img/jenkins.jpg" data-setup="{}">
                <source src="${APP_PATH }/static/video/${video.url}" type="video/mp4">
                <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
                <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">

            </video>
            <script src="${APP_PATH }/static/js/video.min.js"></script>
            <script type="text/javascript">
                //设置中文
                videojs.addLanguage('zh-CN', {
                    "Play": "播放",
                    "Pause": "暂停",
                    "Current Time": "当前时间",
                    "Duration": "时长",
                    "Remaining Time": "剩余时间",
                    "Stream Type": "媒体流类型",
                    "LIVE": "直播",
                    "Loaded": "加载完毕",
                    "Progress": "进度",
                    "Fullscreen": "全屏",
                    "Non-Fullscreen": "退出全屏",
                    "Mute": "静音",
                    "Unmute": "取消静音",
                    "Playback Rate": "播放速度",
                    "Subtitles": "字幕",
                    "subtitles off": "关闭字幕",
                    "Captions": "内嵌字幕",
                    "captions off": "关闭内嵌字幕",
                    "Chapters": "节目段落",
                    "Close Modal Dialog": "关闭弹窗",
                    "Descriptions": "描述",
                    "descriptions off": "关闭描述",
                    "Audio Track": "音轨",
                    "You aborted the media playback": "视频播放被终止",
                    "A network error caused the media download to fail part-way.": "网络错误导致视频下载中途失败。",
                    "The media could not be loaded, either because the server or network failed or because the format is not supported.": "视频因格式不支持或者服务器或网络的问题无法加载。",
                    "The media playback was aborted due to a corruption problem or because the media used features your browser did not support.": "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",
                    "No compatible source was found for this media.": "无法找到此视频兼容的源。",
                    "The media is encrypted and we do not have the keys to decrypt it.": "视频已加密，无法解密。",
                    "Play Video": "播放视频",
                    "Close": "关闭",
                    "Modal Window": "弹窗",
                    "This is a modal window": "这是一个弹窗",
                    "This modal can be closed by pressing the Escape key or activating the close button.": "可以按ESC按键或启用关闭按钮来关闭此弹窗。",
                    ", opens captions settings dialog": ", 开启标题设置弹窗",
                    ", opens subtitles settings dialog": ", 开启字幕设置弹窗",
                    ", opens descriptions settings dialog": ", 开启描述设置弹窗",
                    ", selected": ", 选择",
                    "captions settings": "字幕设定",
                    "Audio Player": "音频播放器",
                    "Video Player": "视频播放器",
                    "Replay": "重播",
                    "Progress Bar": "进度小节",
                    "Volume Level": "音量",
                    "subtitles settings": "字幕设定",
                    "descriptions settings": "描述设定",
                    "Text": "文字",
                    "White": "白",
                    "Black": "黑",
                    "Red": "红",
                    "Green": "绿",
                    "Blue": "蓝",
                    "Yellow": "黄",
                    "Magenta": "紫红",
                    "Cyan": "青",
                    "Background": "背景",
                    "Window": "视窗",
                    "Transparent": "透明",
                    "Semi-Transparent": "半透明",
                    "Opaque": "不透明",
                    "Font Size": "字体尺寸",
                    "Text Edge Style": "字体边缘样式",
                    "None": "无",
                    "Raised": "浮雕",
                    "Depressed": "压低",
                    "Uniform": "均匀",
                    "Dropshadow": "下阴影",
                    "Font Family": "字体库",
                    "Proportional Sans-Serif": "比例无细体",
                    "Monospace Sans-Serif": "单间隔无细体",
                    "Proportional Serif": "比例细体",
                    "Monospace Serif": "单间隔细体",
                    "Casual": "舒适",
                    "Script": "手写体",
                    "Small Caps": "小型大写字体",
                    "Reset": "重启",
                    "restore all settings to the default values": "恢复全部设定至预设值",
                    "Done": "完成",
                    "Caption Settings Dialog": "字幕设定视窗",
                    "Beginning of dialog window. Escape will cancel and close the window.": "开始对话视窗。离开会取消及关闭视窗",
                    "End of dialog window.": "结束对话视窗"
                });






                var myPlayer = videojs('my-video');
                videojs("my-video").ready(function(){
                    var myPlayer = this;
                    myPlayer.play();
                });

            </script>

        </div>
        <div class="col-lg-2"></div>

    </div>
    <br />
    <br />
    <br />
    <div calss="row" style="text-align: center;">
        <hr />

        Copyright @ 2019   &nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  淮阴工学院计算机_周鹏飞   &nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   Corapation , All   Rights   Reservet<br />
        联系电话：15951735361     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        QQ：632998530&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   学号：1154007126

        <br />
        <br />
    </div>
</div>


</body>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/main.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/Chart.js"></script>
<script type="text/javascript" src="${basePath }/static/js/search.js"></script>s
</html>
