<%--Ask about Village--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
<html>
<head>
    <title>Ask about Village</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/storyStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/offsetBoxStyle.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/images/irongate.jpg');
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
<div id="particles-js"></div>
<div id="fogContainer"></div>


<h1>Ask about Village</h1>
<button id="showFullStory">Показать весь текст</button>
<form>
    <input type="submit" name="action" value="Leave in Elder">
</form>

<div class="image-container">
    <div class="image-item image-item-1" data-desc="Кузница «Грозный Молот». Здесь кузнецы трудятся с огнем и металлом, создавая мощное оружие и прочные доспехи для защиты деревни. В этом месте слышны удары молотов и звуки труда, а пылающий свет раскаленного металла создает атмосферу силы и мастерства. Кузница является сердцем ремесленников, где рождаются оружия, способные противостоять опасностям.">
        <div class="myImage-container">
            <img class="myImage" src="${pageContext.request.contextPath}/images/kuznitsa.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
        </div>
    </div>

    <div class="image-item image-item-2" data-desc="На окраине деревни находится причал «Ветерок». Здесь привязаны корабли и лодки, готовые отправиться в захватывающие морские путешествия. Рыбаки делятся своими уловами и историями морских приключений, а морской бриз и шум волн создают ощущение свободы и загадочности. Это место, где мечты о дальних морях воплощаются в реальность.">
        <div class="myImage-container">
            <img class="myImage" src="${pageContext.request.contextPath}/images/prichal.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
        </div>
    </div>

    <div class="image-item image-item-3" data-desc="В самом сердце деревни располагается таверна «Чёрный дракон». Здесь люди собираются, чтобы отдохнуть, поделиться своими приключениями и насладиться вкусными блюдами и напитками. В этой уютной таверне царит теплая атмосфера, где смешиваются запахи пряностей, звуки разговоров и смеха, создавая неповторимое место для встреч и отдыха.">
        <div class="myImage-container">
            <img class="myImage" src="${pageContext.request.contextPath}/images/tavernBuild.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
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
        AudioController.init('${pageContext.request.contextPath}/musics/LAII - Hunters Village.mp3');
    }
</script>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />

</body>
</html>
