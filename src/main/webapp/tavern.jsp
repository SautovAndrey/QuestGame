<%-- tavern.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Tavern</title>
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/storyStyle.css">
  <style>
    body {
      background-image: url('${pageContext.request.contextPath}/images/tavernImage.jpeg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
  </style>
</head>
<body>
<div id="fogContainer"></div>

<h1>Welcome to the Tavern</h1>
<form action="tavern" method="post">
  <input type="submit" name="action" value="Drink and Gossip">
  <input type="submit" name="action" value="Buy Map">
  <input type="submit" name="action" value="Ask about Forest">
  <input type="submit" name="action" value="Leave Tavern">
</form>

<div id="story-content" class="story-content"></div>
<button id="showFullStory">Показать весь текст</button>
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
    AudioController.init('${pageContext.request.contextPath}/musics/Dryante - A Story You Wont Believe (Gwent).mp3');
  }
</script>


<div class="audio-controls">
  <button id="playButton">Play Music</button>
  <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
</body>
</html>
