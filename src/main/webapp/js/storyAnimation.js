var intervalId; // Для остановки интервала
var showFullText = false; // Флаг для проверки нажатия кнопки

function typeStory(text, divId, callback) {
    console.log('typeStory called with', text, divId);
    var storyDiv = document.getElementById(divId);
    var i = 0;

    intervalId = setInterval(function () {
        if (showFullText) { // Если кнопка была нажата
            clearInterval(intervalId);
            storyDiv.innerText = window.story.join(' ');
            return;
        }

        var newCharNode = document.createTextNode(text[i]);
        storyDiv.appendChild(newCharNode);
        storyDiv.scrollTop = storyDiv.scrollHeight;
        i++;
        if (i === text.length) {
            var br1 = document.createElement("br");
            var br2 = document.createElement("br");
            storyDiv.appendChild(br1);
            storyDiv.appendChild(br2);
            clearInterval(intervalId);
            callback();
        }
    }, 5);
}

function typeAllStory() {
    var i = 0;
    function typeNextPart() {
        // Если window.story не определен или пуст, прерываем выполнение функции
        if (!window.story || window.story.length === 0) {
            return;
        }

        if (i < window.story.length) {
            typeStory(window.story[i], "story-content", typeNextPart);
            i++;
        }
    }
    typeNextPart();
}

window.addEventListener("DOMContentLoaded", function() {
    typeAllStory();
});
console.log(window.story);

document.getElementById('showFullStory').addEventListener('click', function() {
    showFullText = true; // Устанавливаем флаг
    clearInterval(intervalId); // Останавливаем интервал

    // Отображаем весь текст сразу
    var storyDiv = document.getElementById('story-content');
    storyDiv.innerText = window.story.join(' ');

    // Опционально: скрываем кнопку, так как текст уже отображен полностью
    this.style.display = 'none';
});