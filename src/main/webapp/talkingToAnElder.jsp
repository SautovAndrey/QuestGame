<%--talkingToAnElder.jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Talking To An Elder</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/storyStyle.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/images/elderBackground.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        #elder-form label {
            font-size: 150%;
            z-index: 2;
            position: relative;
        }

        #elder-image {
            position: fixed;
            bottom: 0;
            left: 0;
            max-width: 100%;
            animation: float 2s ease-in-out infinite;
            z-index: -1;
        }
        @keyframes float {
            0% { transform: translateX(0); }
            50% { transform: translateX(10px); }
            100% { transform: translateX(0); }
        }
    </style>
</head>
<body>
<div id="fogContainer"></div>
<h1>Talking To An Elder</h1>
<button id="showFullStory">Показать весь текст</button>
<form id="elder-form" action="elder" method="post">
    <input type="radio" id="notAfraid" name="action" value="Tell Elder you're not afraid">
    <label for="notAfraid">Скажи старейшине, что ты не боишься</label><br>

    <input type="radio" id="agreeLeave" name="action" value="Agree and Leave">
    <label for="agreeLeave">Согласиться и уйти</label><br>

    <input type="radio" id="leaveElder" name="action" value="Leave Elder">
    <label for="leaveElder">Оставить старейшину</label><br>

    <input type="submit" value="Выбрать">
</form>
<img id="elder-image" src="${pageContext.request.contextPath}/images/elderTalkBackground.png" alt="elder image">
<div id="story-content" class="story-content"></div>
<script>
    window.story = <%= request.getAttribute("storyArray") %>;
    console.log(window.story);
</script>

<script src="${pageContext.request.contextPath}/js/storyAnimation.js"></script>
<script>
    console.log(window.story);
</script>

<script src="${pageContext.request.contextPath}/js/audioControl.js"></script>
<script>
    window.onload = function() {
        AudioController.init('${pageContext.request.contextPath}/musics/Dryante Zan - The Witcher 3 Novigrad Night Theme.mp3');
    }
</script>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
</body>
</html>
