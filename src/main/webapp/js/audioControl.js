var AudioController = {
    audioElement: null,
    playButton: null,
    muteButton: null,

    init: function(audioFilePath) {
        this.audioElement = new Audio(audioFilePath);
        this.audioElement.loop = true;
        this.audioElement.volume = 0.2;
        this.playButton = document.getElementById('playButton');
        this.muteButton = document.getElementById('muteButton');

        this.setupEventListeners();
        this.updateButtons();
        this.play();
    },

    setupEventListeners: function() {
        var _this = this;

        this.playButton.onclick = function() {
            if (_this.audioElement.paused) {
                _this.audioElement.play();
            } else {
                _this.audioElement.pause();
            }
            _this.updateButtons();
        };

        this.muteButton.onclick = function() {
            _this.audioElement.muted = !_this.audioElement.muted;
            _this.updateButtons();
        };
    },

    updateButtons: function() {
        this.playButton.textContent = this.audioElement.paused ? 'Play Music' : 'Pause';
        this.muteButton.textContent = this.audioElement.muted ? 'Unmute' : 'Mute';
    },

    play: function() {
        this.audioElement.play();
        this.updateButtons();
    }
};
