let studyTime = 25 * 60; // 25分
let breakTime = 5 * 60;  // 5分
let isStudyPhase = true;
let timer;
let level = 0;

const timeDisplay = document.getElementById("time-display");
const levelMeter = document.getElementById("level-meter");
const startButton = document.getElementById("start-btn");

function startTimer() {
    let currentTime = isStudyPhase ? studyTime : breakTime;

    timer = setInterval(() => {
        if (currentTime <= 0) {
            clearInterval(timer);
            isStudyPhase = !isStudyPhase;
            levelUp();
            startTimer();
        } else {
            currentTime--;
            updateDisplay(currentTime);
        }
    }, 1000);
}

function updateDisplay(time) {
    const minutes = Math.floor(time / 60);
    const seconds = time % 60;
    timeDisplay.textContent = `${minutes.toString().padStart(2, "0")}:${seconds
        .toString()
        .padStart(2, "0")}`;
    if (isStudyPhase) {
        document.querySelector(".timer").style.borderColor = "#ffa500"; // オレンジ
    } else {
        document.querySelector(".timer").style.borderColor = "#32cd32"; // 緑
    }
}

function levelUp() {
    if (isStudyPhase) return;
    level++;
    const newHeight = (level / 10) * 200; // レベルが10で200pxになる
    levelMeter.style.height = `${Math.min(newHeight, 200)}px`;
}

startButton.addEventListener("click", () => {
    startButton.disabled = true;
    startTimer();
});
