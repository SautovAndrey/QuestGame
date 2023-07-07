<%--ExploringTheDarkForest--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>To be continued......</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/images/darkForestGo.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        #fogContainer {
            z-index: 1;  /* Устанавливаем z-index выше, чтобы туман был перед изображением */
        }

        /* добавление и стилизация изображения */
        #warriorMan-image {
            position: fixed;
            bottom: -45px;
            left: 0;
            right: 0;
            margin-left: auto;
            margin-right: auto;
            width: 30%;  /* уменьшение изображения в два раза */
            animation: float 2s ease-in-out infinite;  /* настраиваем анимацию */
            z-index: 0;  /* Устанавливаем z-index ниже, чтобы изображение было под туманом */
        }
        /* определение анимации */
        @keyframes float {
            0% { transform: translateX(0); }
            50% { transform: translateX(10px); }
            100% { transform: translateX(0); }
        }
    </style>
</head>
<body>
<div id="fogContainer"></div>

<h1>To be continued......</h1>
<form action="${pageContext.request.contextPath}/welcome.jsp" method="post">
    <input type="submit" value="Start Over">
</form>

<img id="warriorMan-image" src="${pageContext.request.contextPath}/images/warriorMan.png" alt="elder image">

<script src="${pageContext.request.contextPath}/js/audioControl.js"></script>
<script>
    window.onload = function() {
        AudioController.init('${pageContext.request.contextPath}/musics/Yasuharu Takanashi - Fairy Tail Main Theme OST.mp3');
    }
</script>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
</body>
</html>
