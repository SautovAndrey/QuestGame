<%--forest.jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Forest</title>
  <link rel="stylesheet" href="css/styles.css">
  <style>
    body {
      background-image: url('${pageContext.request.contextPath}/images/forestD.jpeg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
  </style>
</head>
<body>
<div id="fogContainer"></div>
<h1>You're in the Dark Forest</h1>
<form action="forest" method="post">
  <input type="submit" name="action" value="Return Home">
  <input type="submit" name="action" value="Enter Forest">
  <input type="submit" name="action" value="Return to the Village">
</form>
<jsp:include page="/WEB-INF/playerInfo.jsp" />

<script src="${pageContext.request.contextPath}/js/audioControl.js"></script>
<script>
  window.onload = function() {
    AudioController.init('${pageContext.request.contextPath}/musics/The Witcher 3 Official Soundtrack - The Vagabond.mp3');
  }
</script>

<div class="audio-controls">
  <button id="playButton">Play Music</button>
  <button id="muteButton">Mute</button>
</div>

</body>
</html>
