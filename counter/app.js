const countup = document.getElementById("countup");
const countdown = document.getElementById("countdown");
const pause = document.getElementById("pause");
const resume = document.getElementById("resume");
const restart = document.getElementById("restart");
const clear = document.getElementById("clear");
const hintHolder = document.getElementsByClassName("hint-holder");
const startTime = document.getElementsByClassName("start-time");
const hour = document.getElementById("hour");
const minute = document.getElementById("minute");
const second = document.getElementById("second");
const hint = document.getElementById("hint");
let time = 0;
let hh = 0;
let mm = 0;
let ss = 0;

countup.onclick = function() {
    restart.classList.remove("display-none");
    restart.classList.add("display-block");
    clear.innerText="清空正计时";
    clear.classList.remove("display-none");
    clear.classList.add("display-block");
    pause.classList.remove("display-none");
    pause.classList.add("display-block");
    countdown.classList.remove("display-block");
    countdown.classList.add("display-none");
    countup.classList.remove("display-block");
    countup.classList.add("display-none");
    hintHolder[0].classList.remove("display-none");
    hintHolder[0].classList.add("display-block");
    for (let item of startTime) {
        item.classList.remove("display-block");
        item.classList.add("display-none");
    }
    hour.value = "";
    minute.value = "";
    second.value = "";
}

countdown.onclick = function() {
    restart.classList.remove("display-none");
    restart.classList.add("display-block");
    clear.innerText="清空倒计时";
    clear.classList.remove("display-none");
    clear.classList.add("display-block");
    pause.classList.remove("display-none");
    pause.classList.add("display-block");
    countdown.classList.remove("display-block");
    countdown.classList.add("display-none");
    countup.classList.remove("display-block");
    countup.classList.add("display-none");
    hintHolder[0].classList.remove("display-none");
    hintHolder[0].classList.add("display-block");
    for (let item of startTime) {
        item.classList.remove("display-block");
        item.classList.add("display-none");
    }
    hour.value = "";
    minute.value = "";
    second.value = "";
}

pause.onclick = function() {
    resume.classList.remove("display-none");
    resume.classList.add("display-block");
    pause.classList.remove("display-block");
    pause.classList.add("display-none");
}

resume.onclick = function() {
    pause.classList.remove("display-none");
    pause.classList.add("display-block");
    resume.classList.remove("display-block");
    resume.classList.add("display-none");
}

restart.onclick = function() {
    pause.classList.remove("display-none");
    pause.classList.add("display-block");
    resume.classList.remove("display-block");
    resume.classList.add("display-none");
}

clear.onclick = function() {
    countdown.classList.remove("display-none");
    countdown.classList.add("display-block");
    countup.classList.remove("display-none");
    countup.classList.add("display-block");
    pause.classList.remove("display-block");
    pause.classList.add("display-none");
    resume.classList.remove("display-block");
    resume.classList.add("display-none");
    restart.classList.remove("display-block");
    restart.classList.add("display-none");
    clear.classList.remove("display-block");
    clear.classList.add("display-none");
    hintHolder[0].classList.remove("display-block");
    hintHolder[0].classList.add("display-none");
    for (let item of startTime) {
        item.classList.remove("display-none");
        item.classList.add("display-block");
    }
}