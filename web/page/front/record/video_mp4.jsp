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

<div class="rd_play_main">
    <div class="rd_play_subject">
        <span>${video.name}</span>
    </div>
    <div class="rd_play_content">
        <video id="myMp4" controls="controls" autoplay="autoplay">
            <source src="${video.path}" type="video/mp4"/>
        </video>
    </div>
</div>

</body>
<script>
    var paras={
        width:parseInt($(window).width()),
        height:parseInt($(window).height())
    };

    function init_page() {
        $(".rd_play_main").css({"height":paras.height});

        $(".rd_play_subject").css({"height":paras.height/5});
        $(".rd_play_content").css({"height":paras.height*4/5});

        if(paras.width>800){
            $("#myMp4").css({"margin-left": "25%","margin-top":"2%","width":"640px","height":"360px"});
        }
        else{
            $(".rd_play_subject").find("span").css({"font-size":"20px"});

            $("#myMp4").css({"margin-left": "5%","margin-top":"0%","width":paras.width*5/6,"height":paras.height*3/4});
        }
    }

    $(function () {
        init_page();
    });



</script>
</html>