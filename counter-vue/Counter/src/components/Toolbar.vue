<template>
  <div>
    <div>
      <start-hour class="start-time" @changeH="changeH" v-show="this.runStatus === 0" :hour="this.hour"></start-hour>
      <start-minute class="start-time" @changeM="changeM" v-show="this.runStatus === 0" :minute="this.minute"></start-minute>
      <start-second class="start-time" @changeS="changeS" v-show="this.runStatus === 0" :second="this.second"></start-second>
    </div>
    <div>
      <hint class="hintholder" :hint="this.hint" v-show="this.runStatus !== 0"></hint>
    </div>
    <div class="starter">
        <countup @start-up="clickStartUp" v-show="this.runStatus === 0"></countup>
    </div>
    <div class="starter">
        <countdown @start-down="clickStartDown" v-show="this.runStatus === 0"></countdown>
    </div>
    <div class="starter">
        <pause @pause="clickPause" v-show="this.runStatus === 1"></pause>
    </div>
    <div class="starter">
        <resume @resume="clickResume" v-show="this.runStatus === 2"></resume>
    </div>
    <div class="restarter">
        <restart @restart="clickRestart" v-show="this.runStatus !== 0"></restart>
    </div>
    <div class="cleaner">
        <clear @clear="clickClear" v-show="this.runStatus !== 0"
        :clearBtnMsg="this.clearBtnMsg"></clear>
    </div>
  </div>
</template>

<script>
import Countup from './Countup'
import Countdown from './Countdown'
import Pause from './Pause'
import Resume from './Resume'
import Clear from './Clear'
import Restart from './Restart'
import Hint from './Hint'
import StartHour from './StartHour'
import StartMinute from './StartMinute'
import StartSecond from './StartSecond'
export default {
  name: 'Toolbar',
  data () {
    return {
      hour: '',
      minute: '',
      second: '',
      runStatus: 0,
      upStatus: 0,
      clearBtnMsg: '清空正计时',
      hint: 'initHint',
      timer: 0,
      totalTime: 0,
      passedTime: 0,
      showTime: 0
    }
  },
  created: function () {
    var _this = this
    window.onkeyup = function (e) {
      let keycode = e.keyCode
      if (keycode === 13) {
        if (_this.runStatus === 0) {
          _this.clickStartUp()
        }
      } else if (keycode === 32) {
        if (_this.runStatus === 1) {
          _this.clickPause()
        } else if (_this.runStatus === 2) {
          _this.clickResume()
        }
      }
    }
  },
  methods: {
    prefixZero (num) {
      return (Array(3).join('0') + num).slice(-2)
    },
    changeH (changeH) {
      if (changeH > 99) {
        this.hour = 99
      } else if (changeH > 0) {
        this.hour = changeH
      } else {
        this.hour = 0
      }
      this.updateHint()
    },
    changeM (changeM) {
      if (changeM > 59) {
        this.minute = 59
      } else if (changeM > 0) {
        this.minute = changeM
      } else {
        this.minute = 0
      }
      this.updateHint()
    },
    changeS (changeS) {
      if (changeS > 59) {
        this.second = 59
      } else if (changeS > 0) {
        this.second = changeS
      } else {
        this.second = 0
      }
      this.updateHint()
    },
    clickStartUp () {
      if (this.runStatus === 0) {
        this.runStatus = 1
        this.upStatus = 1
        this.clearBtnMsg = '清空正计时'
        this.updateHint()
        this.totalTime = (this.hour * 3600 + this.minute * 60 + this.second) * 1000
        this.passedTime = 0
        this.timer = setInterval(this.runtime, 100)
      }
    },
    clickStartDown () {
      if (this.runStatus === 0) {
        this.runStatus = 1
        this.upStatus = 0
        this.clearBtnMsg = '清空倒计时'
        this.updateHint()
        this.totalTime = (this.hour * 3600 + this.minute * 60 + this.second) * 1000
        this.passedTime = 0
        this.timer = setInterval(this.runtime, 100)
      }
    },
    clickPause () {
      if (this.runStatus === 1) {
        this.runStatus = 2
        this.updateHint()
        clearInterval(this.timer)
      }
    },
    clickResume () {
      if (this.runStatus === 2) {
        this.runStatus = 1
        this.updateHint()
        this.timer = setInterval(this.runtime, 100)
      }
    },
    clickRestart () {
      if (this.runStatus !== 0) {
        this.runStatus = 1
        this.updateHint()
        clearInterval(this.timer)
        this.passedTime = 0
        this.timer = setInterval(this.runtime, 100)
      }
    },
    clickClear () {
      if (this.runStatus !== 0) {
        this.runStatus = 0
        clearInterval(this.timer)
        this.hour = ''
        this.minute = ''
        this.second = ''
        this.showTime = 0
        this.$emit('changeShowtime', this.showTime)
      }
    },
    updateHint () {
      if (this.runStatus === 1) {
        if (this.upStatus === 1) {
          this.hint = '正在正计时 ' + this.hintTime()
        } else if (this.upStatus === 0) {
          this.hint = '正在倒计时 ' + this.hintTime()
        }
      } else if (this.runStatus === 2) {
        if (this.upStatus === 1) {
          this.hint = '暂停正计时 ' + this.hintTime()
        } else if (this.upStatus === 0) {
          this.hint = '暂停倒计时 ' + this.hintTime()
        }
      }
    },
    hintTime () {
      return this.prefixZero(this.hour) + ':' + this.prefixZero(this.minute) + ':' + this.prefixZero(this.second)
    },
    runtime () {
      if (this.passedTime < this.totalTime) {
        this.passedTime += 100
        if (this.upStatus === 1) {
          this.showTime = this.passedTime
        } else {
          this.showTime = this.totalTime - this.passedTime
        }
      }
      if (this.passedTime >= this.totalTime) {
        if (this.upStatus === 1) {
          this.hint = '正计时 ' + this.hintTime() + ' 已结束'
        } else {
          this.hint = '倒计时 ' + this.hintTime() + ' 已结束'
        }
        clearInterval(this.timer)
        this.runStatus = 3
      }
      this.$emit('changeShowtime', this.showTime)
    }
  },
  components: {
    Hint,
    Countup,
    Countdown,
    Pause,
    Resume,
    Clear,
    Restart,
    StartHour,
    StartMinute,
    StartSecond
  }
}
</script>

<style scoped>
.start-time, .hintholder, .starter {
  float: left;
  margin-right: 20px;
}

.cleaner, .restarter {
  float: right;
  margin-left: 20px;
}
</style>
