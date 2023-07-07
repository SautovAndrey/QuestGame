<%--drinkAndFight--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Drink and Fight</title>
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/storyStyle.css">

  <style>
    body {
      background-image: url('${pageContext.request.contextPath}/images/tavernaArt.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
  </style>
</head>
<body>


<div id="fogContainer"></div>

<h1>Drink and Fight</h1>
<form>
  <input type="submit" name="action" value="Leave in Tavern">
</form>

<div id="story-content" class="story-content"></div>
<div id="world"></div>
<jsp:include page="/WEB-INF/playerInfo.jsp" />


<script>
  window.story = <%= request.getAttribute("storyArray") %>;
  console.log(window.story);
</script>
<script src="${pageContext.request.contextPath}/js/storyAnimation.js"></script>
<script>
  console.log(window.story);
</script>
</div>

<script src="${pageContext.request.contextPath}/js/audioControl.js"></script>
<script>
  window.onload = function() {
    AudioController.init('${pageContext.request.contextPath}/musics/Fairy Tail Main Theme 2014 - Cover by Dryante.mp3');
  }
</script>

<div class="audio-controls">
  <button id="playButton">Play Music</button>
  <button id="muteButton">Mute</button>
</div>

</body>
</html>
