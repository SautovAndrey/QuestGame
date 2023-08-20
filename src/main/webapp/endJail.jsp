<%--endJail.jsp--%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Game Over</title>
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/storyStyle.css">
  <style>
    body {
      background-image: url('${pageContext.request.contextPath}/images/jail.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }

    #warrior-image {
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

<h1>Welcome to the village</h1>
<form action="${pageContext.request.contextPath}/welcome.jsp" method="post">
  <input type="submit" value="Start Over">
</form>
<button id="showFullStory">Показать весь текст</button>
<img id="warrior-image" src="${pageContext.request.contextPath}/images/warrior4.png" alt="elder image">

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
    AudioController.init('${pageContext.request.contextPath}/musics/The Witcher 3 Official Soundtrack - Hunt Or Be Hunted.mp3');
  }
</script>

<div class="audio-controls">
  <button id="playButton">Play Music</button>
  <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
</body>
</html>




