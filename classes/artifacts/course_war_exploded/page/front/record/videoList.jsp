<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource1.jsp" %>
<%@ include file="../../../include/skin_course.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <title>启蒙英语角</title>
</head>
<body>

<div class="rd_video_main">
    <div class="rd_video_subject">
        <%--<h2>${course.name}</h2>--%>
        <span>${course.name}</span>
    </div>
    <div class="rd_video_content">
        <c:forEach items="${list}" var="bean" varStatus="i">
            <span onclick="target_video('${bean.id}')"><a>${bean.name}</a></span>
        </c:forEach>
    </div>
</div>

</body>
<script>
    var paras={
        width:parseInt($(window).width()),
        height:parseInt($(window).height())
    };

    function init_page() {
        $(".rd_video_main").css({"height":paras.height});

        $(".rd_video_subject").css({"height":paras.height/6});
        $(".rd_video_content").css({"height":paras.height*5/6});


        if(paras.width>800){

        }
        else{
            $(".rd_video_subject").find("span").css({"font-size":"20px"});

            $(".rd_video_content").find("a").css({"font-size":"20px"});
        }

    }
    $(function () {
        init_page();

        $(".rd_video_content").find("span").hover(function () {
            $(".rd_video_content").find("span").removeClass("bluetext");
            $(this).addClass("bluetext");
        });
    });

    function target_video(item) {
        window.location.href="targetVideo.htm?id="+item;
    }

</script>
</html>