<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include/taglib.jsp" %>
<%@ include file="include/resource.jsp" %>
</head>
<body>
您没有登录！！！<span id="totalSecond">3</span>秒后自动返回首页
<script language="javascript" type="text/javascript">
    <!--
    var second = $('#totalSecond').html();
    setInterval("redirect()", 1000);  //每1秒钟调用redirect()方法一次

    function redirect() {
        if (second < 0) {
            window.location.href = '/';
        } else {
            $('#totalSecond').html(second--);
        }
    }
    -->
</script>
</body>
</html>
