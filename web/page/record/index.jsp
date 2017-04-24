<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/taglib.jsp" %>
<%@ include file="../../include/resource1.jsp" %>
<%@ include file="../../include/skin_course.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=no">
    <title>This is course page</title>
    <link rel="stylesheet" href="${resources}/skin/course/css/layout.css" id="myCss"/>
</head>
<body>

<div class="winMain">
    <div class="winLeft"></div>
    <div class="winMiddle">
        <div class="mTop">
            <div class="leftNavDiv"></div>
            <div class="rightNavDiv"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>
            <div class="mImg"></div>

        </div>
        <div class="mMiddle">

        </div>
        <div class="mBottom">

        </div>
    </div>
    <div class="winRight"></div>
</div>


</body>
<script>


    var paras={
        wWidth:0,
        wHeight:0
    };

    $(function () {

        init_css();

        init_size();
    });

    function init_css() {
        paras.wWidth=$(window).width();
        paras.wHeight=$(window).height();
    }

    function init_size() {
        $(".winMain,.winLeft,.winMiddle,.winRight").css({"height":paras.wHeight});

        var marginTop=$(".mTop").height()*2/100;
        $(".mImg").css({"margin-top":marginTop});
    }







</script>

</html>
