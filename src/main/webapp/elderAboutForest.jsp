<%--elderAboutForest.jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
<html>
<head>
    <title>Elder About Forest</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/storyStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/offsetBoxStyle.css">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/images/darkForestRoots.jpg');
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
        #goblin {
            position: fixed;
            bottom: -50%;
            left: 50%;
            transform: translate(-50%, 50%);
            animation: goblinAnimation 10s infinite;
            animation-delay: 2s;
        }

        @keyframes goblinAnimation {
            0% { bottom: -50%; }
            50% { bottom: 10%; }
            100% { bottom: -50%; }
        }
    </style>
</head>
<body>
<div id="particles-js"></div>
<div id="fogContainer"></div>


<h1>Elder About Forest</h1>
<button id="showFullStory">Показать весь текст</button>
<form>
    <input type="submit" name="action" value="Leave in Elder">
</form>

<div class="image-container">
    <div class="image-item image-item-1" data-desc="Химера - это тварь, созданная из смешения различных животных и нередко людей. У нее есть головы человека, льва или змеи, а ее тело состоит из комбинации львиной,человеческой и змеиной частей. Она является жестоким и непредсказуемым врагом, способным использовать свои разнообразные атаки для уничтожения своих противников.">
        <div class="myImage-container">
            <img class="myImage" src="${pageContext.request.contextPath}/images/himera.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
        </div>
    </div>

    <div class="image-item image-item-2" data-desc="Катакан - это мрачное существо с пронзительными красными глазами и острыми клыками. Он имеет большое родство с вампиром. Когда Катакан входит в тень, его тело покрывается бронированной чешуей, и он становится практически невидимым. Катакан атакует своих жертв со звериной яростью, а его прыжки и движения так быстры, что часто они незаметны для глаза.">
        <div class="myImage-container">
            <img class="myImage" src="${pageContext.request.contextPath}/images/katakan.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
        </div>
    </div>

    <div class="image-item image-item-3" data-desc="Вервульф - это ужасное существо, родившееся из слияния человека и волка. Он обладает огромной силой и скоростью, а его тело покрыто пушистой шерстью и мускулистой фигурой. Он обладает острыми клыками, когтями и превосходным обонянием, что делает его опасным противником в бою.">
        <div class="myImage-container">
            <img class="myImage" src="${pageContext.request.contextPath}/images/werewolf.jpg" alt="My image" onclick="openZoomedWindow(this.src)">
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
        AudioController.init('${pageContext.request.contextPath}/musics/The Witcher 3 Official Soundtrack - The Song of the Sword Dancer.mp3');
    }
</script>

<div class="audio-controls">
    <button id="playButton">Play Music</button>
    <button id="muteButton">Mute</button>
</div>

<jsp:include page="/WEB-INF/playerInfo.jsp" />
<img id="goblin" src="${pageContext.request.contextPath}/images/goblinBackground.png" alt="Goblin Image">

</body>
</html>

