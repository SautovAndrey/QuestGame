<%--endHome.jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homecoming</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/gameover.css">
    <link rel="stylesheet" href="css/storyStyle.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/images/endHero.jpeg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        h1 {
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body>
<div id="fogContainer"></div>
<h1>The return of the hero Home</h1>

<div id="gameOverContainer">
    <h2>Game Over</h2>
</div>
<button id="showFullStory">Показать весь текст</button>
<!-- Add this form -->
<form action="${pageContext.request.contextPath}/welcome.jsp" method="post">
    <input type="submit" value="Start Over">
</form>
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
        AudioController.init('${pageContext.request.contextPath}/musics/The Witcher 3 Wild Hunt OST - The Fields of Ard Skellig.mp3');
    }
</script>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
</body>
</html>
