<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource1.jsp" %>
<%@ include file="../../../include/skin_course.jsp" %>
<%@ include file="../../../include/video.jsp" %>
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
        <div id="jquery_jplayer_1" class="jp-jplayer"></div>
        <div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
            <div class="jp-type-single">
                <div class="jp-gui jp-interface">
                    <div class="jp-controls">
                        <button class="jp-play" role="button" tabindex="0">play</button>
                        <button class="jp-stop" role="button" tabindex="0">stop</button>
                    </div>
                    <div class="jp-progress">
                        <div class="jp-seek-bar">
                            <div class="jp-play-bar"></div>
                        </div>
                    </div>
                    <div class="jp-volume-controls">
                        <button class="jp-mute" role="button" tabindex="0">mute</button>
                        <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                        <div class="jp-volume-bar">
                            <div class="jp-volume-bar-value"></div>
                        </div>
                    </div>
                    <div class="jp-time-holder">
                        <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                        <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                        <div class="jp-toggles">
                            <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                        </div>
                    </div>
                </div>
                <div class="jp-details">
                    <div class="jp-title" aria-label="title">&nbsp;</div>
                </div>
                <div class="jp-no-solution">
                    <span>Update Required</span>
                    To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                </div>
            </div>
        </div>
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
        $("#jquery_jplayer_1").jPlayer({
            ready: function (event) {
                $(this).jPlayer("setMedia", {
                    title: "Space Alone - Ilias Sounas",
                    flv:videoParas.path
                });
            },
            error:function (event) {
                alert("ccc");
                alert(event.jPlayer.error.type);
                if(ready && event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
                    // Setup the media stream again and play it.
                    $(this).jPlayer("setMedia", media).jPlayer('play');
                    alert("dd");
                }
            },
            swfPath: "${resources}/jPlayer-2.9.1/dist/jplayer",
            supplied: "flv",
            solution: 'html,flash',
//            wmode: "window",
            useStateClassSkin: true,
            autoBlur: false,
            smoothPlayBar: true,
            keyEnabled: true,
            remainingDuration: true,
            toggleDuration: true
        });
    });



</script>
</html>