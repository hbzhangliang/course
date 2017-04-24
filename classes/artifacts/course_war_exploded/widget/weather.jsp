<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script type="text/javascript" src="${base}/web-resources/resources/js/jquery.yql.js"></script>
<!--weather start-->
<div class="weather"><span></span></div>
<!--weather end-->
<script>
    var today = new Date();
    var info = "今天是：";
    info += today.getFullYear() + "年" + (today.getMonth() + 1) + "月" + today.getDate() + "日   ";
    $.YQL("select * from rss where url='http://xml.weather.yahoo.com/forecastrss/CHXX0116_c.xml'" , function (content) {
        var forecast = content.query.results.item;
        code = forecast.condition.code;
        img = "<img src='http://l.yimg.com/a/i/us/we/52/"+code+".gif' width='23px' stlyle='float:right'/>";
        HT = forecast.forecast[0].high;
        LT = forecast.forecast[0].low;
        $('.weather span').html(info + "上海"+ LT + "℃~" + HT + "℃" + img);
    });
</script>