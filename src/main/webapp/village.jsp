<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Village</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/effectsStyle.css">
    <link rel="stylesheet" href="css/storyStyle.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/images/villageT.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
<div id="fogContainer"></div>

<h1>Welcome to the village</h1>
<button id="showFullStory">Показать весь текст</button>
<form action="village" method="post">
    <input type="submit" name="action" value="Visit Tavern">
    <input type="submit" name="action" value="Talk to Elder">
    <input type="submit" name="action" value="Leave Village">
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
        AudioController.init('${pageContext.request.contextPath}/musics/L2 - Town of Dion.mp3');
    }
</script>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
</body>
</html>
