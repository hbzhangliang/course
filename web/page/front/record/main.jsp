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
    <div class="rd_main">
        <div class="rd_main_top">
            <div class="rd_top_left">
                 <img src="${courseImageFolder}/login-photo.jpg" class="img-rounded"/>
            </div>
            <div class="rd_top_middle">
                <span>启 蒙 " 英 语 角 "</span>
            </div>
            <div class="rd_top_right">
                <div>
                    <button type="button" class="btn btn-primary">中文</button>
                    <button type="button" class="btn btn-primary">英文</button>
                </div>
            </div>
        </div>
        <div class="rd_main_middle">
            <div class="rd_middle_left">
                <div class="rd_mleft_content">
                    <h2>多元智能系列</h2>
                    <c:forEach items="${courses}" var="bean" varStatus="i">
                        <c:if test="${i.index>=2}">
                            <span onclick="target_class('${bean.id}')"><a>${bean.name}</a></span>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="rd_middle_right">
                <div class="rd_mright_content">
                    <h2>自然拼读系列</h2>
                    <c:forEach items="${courses}" var="bean" varStatus="i">
                        <c:if test="${i.index<2}">
                            <span onclick="target_class('${bean.id}')"><a>${bean.name}</a></span>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="rd_main_bottom">

            <div class="round">
                    <a>更多</a>
            </div>


        </div>
    </div>
</body>
<script>
    var paras={
        width:parseInt($(window).width()),
        height:parseInt($(window).height())
    };

    function init_page() {
        //高度调整
         $(".rd_main").css({"height":paras.height});

        $(".rd_main_top").css({"height":paras.height/10});
        $(".rd_main_middle").css({"height":paras.height*8/10});
        $(".rd_main_bottom").css({"height":paras.height/10});

        if(paras.width>800){
            $("div.rd_top_middle").find("span").css({"font-size":"50px"});

            $(".rd_mleft_content").find("a").css({"font-size":"30px"});
            $(".rd_mright_content").find("a").css({"font-size":"30px"});

            $("h2").css({"font-size":"40px"});
        }
        else {
            $("div.rd_top_middle").find("span").css({"font-size":"20px"});

            $(".rd_mleft_content").find("a").css({"font-size":"12px"});
            $(".rd_mright_content").find("a").css({"font-size":"12px"});

            $("h2").css({"font-size":"16px"});
        }



    }

    $(function () {
       init_page();
    });

    function target_class(item) {
        window.location.href="targetClass.htm?id="+item;
    }

</script>
</html>