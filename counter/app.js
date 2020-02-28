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
const time = document.getElementById("time");
let totalTime = 0;
let passedTime = 0;
let hh = 0;
let mm = 0;
let ss = 0;
let upStatus = 1;
let runStatus = 0;
let timer;

countup.onclick = clickCountup;

countdown.onclick = function () {
    if (runStatus === 0) {
        clear.innerText = "清空倒计时";
        upStatus = 0;
        runStatus = 1;
        passedTime = 0;
        setStartupButton();
        calculateTime();
        hint.innerText = "正在倒计时 " + prefixZero(hh) + ":" + prefixZero(mm) + ":" + prefixZero(ss);
        clearInput();
        timer = setInterval("runtime()", 100);
    }
};

pause.onclick = clickPause;

resume.onclick = clickResume;

restart.onclick = function () {
    if (runStatus !== 0) {
        showPause();
        if (upStatus === 1) {
            hint.innerText = "正在正计时 " + prefixZero(hh) + ":" + prefixZero(mm) + ":" + prefixZero(ss);
        } else {
            hint.innerText = "正在倒计时 " + prefixZero(hh) + ":" + prefixZero(mm) + ":" + prefixZero(ss);
        }
        setStartupButton();
        passedTime = 0;
        clearInterval(timer);
        runStatus = 1;
        timer = setInterval("runtime()", 100);
    }
};

clear.onclick = function () {
    if (runStatus !== 0) {
        resetButton();
        clearInput();
        clearInterval(timer);
        time.innerText = "00:00:00";
        runStatus = 0;
    }
};

function calculateTime () {
    if (hour.value > 99) {
        hh = 99;
    } else if (hour.value > 0) {
        hh = parseInt(hour.value);
    } else {
        hh = 0;
    }
    if (minute.value > 59) {
        mm = 59;
    } else if (minute.value > 0) {
        mm = parseInt(minute.value);
    } else {
        mm = 0;
    }
    if (second.value > 59) {
        ss = 59;
    } else if (second.value > 0) {
        ss = parseInt(second.value);
    } else {
        ss = 0;
    }
    totalTime = hh * 3600 + mm * 60 + ss;
    totalTime *= 1000;
}

function prefixZero (num) {
    return (Array(3).join("0") + num).slice(-2);
}

function setStartupButton () {
    restart.classList.remove("display-none");
    restart.classList.add("display-block");
    clear.classList.remove("display-none");
    clear.classList.add("display-block");
    showPause();
    countdown.classList.remove("display-block");
    countdown.classList.add("display-none");
    countup.classList.remove("display-block");
    countup.classList.add("display-none");
    hintHolder[0].classList.remove("display-none");
    hintHolder[0].classList.add("display-block");
    for (const item of startTime) {
        item.classList.remove("display-block");
        item.classList.add("display-none");
    }
}

function resetButton () {
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
    for (const item of startTime) {
        item.classList.remove("display-none");
        item.classList.add("display-block");
    }
}

function showPause () {
    pause.classList.remove("display-none");
    pause.classList.add("display-block");
    resume.classList.remove("display-block");
    resume.classList.add("display-none");
}

function showResume () {
    resume.classList.remove("display-none");
    resume.classList.add("display-block");
    pause.classList.remove("display-block");
    pause.classList.add("display-none");
}

function clearInput () {
    hour.value = "";
    minute.value = "";
    second.value = "";
}

function runtime () {
    if (passedTime < totalTime) {
        passedTime  += 100;
        let showTime = 0;
        if (upStatus === 1) {
            showTime = passedTime;
        } else {
            showTime = totalTime - passedTime;
        }
        const showH = Math.floor(showTime / 3600000);
        const showM = Math.floor((showTime - showH * 3600000) / 60000);
        const showS = Math.floor((showTime - showH * 3600000 - showM * 60000) / 1000);
        time.innerText = prefixZero(showH) + ":" + prefixZero(showM) + ":" + prefixZero(showS);
    }
    if (passedTime >= totalTime) {
        if (upStatus === 1) {
            hint.innerText = "正计时 " + prefixZero(hh) + ":" + prefixZero(mm) + ":" + prefixZero(ss) + " 已结束";
        } else {
            hint.innerText = "倒计时 " + prefixZero(hh) + ":" + prefixZero(mm) + ":" + prefixZero(ss) + " 已结束";
        }
        clearInterval(timer);
        pause.classList.remove("display-block");
        pause.classList.add("display-none");
        resume.classList.remove("display-block");
        resume.classList.add("display-none");
        runStatus = 3;
    }
}

function clickCountup () {
    if (runStatus === 0) {
        clear.innerText = "清空正计时";
        upStatus = 1;
        runStatus = 1;
        passedTime = 0;
        setStartupButton();
        calculateTime();
        hint.innerText = "正在正计时 " + prefixZero(hh) + ":" + prefixZero(mm) + ":" + prefixZero(ss);
        clearInput();
        timer = setInterval("runtime()", 100);
    }
}

function clickPause () {
    if (runStatus === 1) {
        showResume();
        hint.innerText = "暂停" + hint.innerText.slice(2);
        clearInterval(timer);
        runStatus = 2;
    }
}

function clickResume () {
    if (runStatus === 2) {
        showPause();
        hint.innerText = "正在" + hint.innerText.slice(2);
        timer = setInterval("runtime()", 100);
        runStatus = 1;
    }
}

document.addEventListener("keydown", function (event) {
    if (event.keyCode === 13) {
        if (runStatus === 0) {
            clickCountup();
        }
    } else if (event.keyCode === 32) {
        if (runStatus === 1) {
            clickPause();
        } else if (runStatus === 2) {
            clickResume();
        }
    }
})