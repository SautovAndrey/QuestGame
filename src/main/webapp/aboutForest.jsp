<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
<html>
<head>
  <title>about Darkwood</title>
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/storyStyle.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/offsetBoxStyle.css">
  <style>
    body {
      background-image: url('${pageContext.request.contextPath}/images/aboutForest.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
    #particles-js {
      position: absolute;
      width: 100%;
      height: 100%;
      z-index: -1;
    }
  </style>
</head>
<body>
<div id="fogContainer"></div>
<div id="particles-js"></div>

<h1>Talk about Darkness</h1>
<button id="showFullStory">Показать весь текст</button>
<form>
  <input type="submit" name="action" value="Leave in Tavern">
</form>

<div class="image-container">
  <div class="image-item image-item-1" data-desc="Это бармен. Он знает все новости таверны и всегда готов поделиться интересной историей.">
    <div class="myImage-container">
      <img class="myImage" src="${pageContext.request.contextPath}/images/Barman.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
    </div>
  </div>

  <div class="image-item image-item-2" data-desc="«Когда-то мы могли многое. Иллюзии волшебных островов, пляшущих в небе драконов, видимость огромного войска, приближающегося к стенам города... Когда-то, давно. Теперь мир изменился, наши способности уменьшились... а мы измельчали. Мы уже больше лисицы, чем агуары».">
    <div class="myImage-container">
      <img class="myImage" src="${pageContext.request.contextPath}/images/agura.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
    </div>
  </div>

  <div class="image-item image-item-3" data-desc="«В этом лесу не охотятся. Никогда. Пусть даже вся деревня умирает от голода».">
    <div class="myImage-container">
      <img class="myImage" src="${pageContext.request.contextPath}/images/ltshii.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
    </div>
  </div>

  <div class="image-description"></div>
</div>

<div id="story-content" class="story-content"></div>
<script>
  window.story = <%= request.getAttribute("storyArray") %>;
  console.log(window.story);

  const items = document.querySelectorAll('.image-item');
  const desc = document.querySelector('.image-description');

  items.forEach(item => {
    item.addEventListener('mouseover', function() {
      desc.textContent = this.dataset.desc;
    });
    item.addEventListener('mouseout', function() {
      desc.textContent = 'ТУТ МОГЛА БЫТЬ ВАША РЕКЛАМА!!!';
    });
  });

  function openZoomedWindow(imageSrc) {
    window.open(imageSrc, '_blank', 'width=800, height=600');
  }
</script>

<script src="${pageContext.request.contextPath}/js/storyAnimation.js"></script>
<script src="${pageContext.request.contextPath}/js/particles-setup.js"></script>

<script src="${pageContext.request.contextPath}/js/audioControl.js"></script>
<script>
  window.onload = function() {
    AudioController.init('${pageContext.request.contextPath}/musics/Netflixs The Witcher - Geralt Of Rivia Main Theme.mp3');
  }
</script>

<div class="audio-controls">
  <button id="playButton">Play Music</button>
  <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />

</body>
</html>
