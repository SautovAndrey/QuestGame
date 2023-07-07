<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to the Quest Game</title>
    <link rel="stylesheet" href="css/styles.css">

</head>
<body>
<div id="fogContainer"></div>
<h1>Welcome to the Quest Game</h1>
<form id="gameForm" action="welcome" method="post">
    <label for="name">Enter your name:</label><br>
    <input type="text" id="name" name="name"><br>
    <input type="submit" id="startButton" value="Start Game">
</form>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<script src="${pageContext.request.contextPath}/js/audioControl.js"></script>
<script>
    window.onload = function() {
        AudioController.init('${pageContext.request.contextPath}/musics/Dryante - Floating Across Water Sea Theme (Heroes of Might and Magic IV 4 OST Cover).mp3');
    }
</script>
</body>
</html>
