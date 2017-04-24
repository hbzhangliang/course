<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource1.jsp" %>
<%@ include file="../../../include/skin_course.jsp" %>
<%--视频添加需要添加三处
1.<%@ include file="../../../include/video.jsp" %>
2.<c:import url="../../common/video.jsp"/>
3.var videoParas={
        title:"${video.name}",
        path:"/upload${video.path}",
        type:"flv",
        resource:"${resources}"  //需要添加路径，不然import的时候，路径访问出问题
    };
--%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <title>启蒙英语角</title>
</head>
<body>

<div class="rd_play_main">
    <div class="rd_play_subject">
        <span>${video.name}</span>
    </div>
    <div class="rd_play_content">
        <video controls="controls" autoplay="autoplay">
            <%--<source src="movie.ogg" type="video/ogg" />--%>
            <%--<source src="/upload/2017/04/22/3c0cf1e7-fcb2-45a4-8f38-e226eb966360.mp4" type="video/mp4" />--%>
                <source src="/upload/2017/04/22/6b8773c4-e570-4ff0-b920-725a19182590.flv" />
            Your browser does not support the video tag.
        </video>
    </div>
</div>

</body>
<script>
    var paras={
        width:parseInt($(window).width()),
        height:parseInt($(window).height())
    };

    //视频播放的参数
    var videoParas={
        title:"${video.name}",
        path:"/upload${video.path}",
        type:"flv",
        resource:"${resources}"  //需要添加路径，不然import的时候，路径访问出问题
    };

    function init_page() {
        $(".rd_play_main").css({"height":paras.height});

        $(".rd_play_subject").css({"height":paras.height/5});
        $(".rd_play_content").css({"height":paras.height*4/5});

        if(paras.width>800){

        }
        else{
            $(".rd_play_subject").find("span").css({"font-size":"20px"});
        }
    }

    $(function () {

    });



</script>
</html>