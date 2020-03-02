<template>
  <div id="app">
    <div class="toolbar">
      <toolbar @changeShowtime="changeShowtime"></toolbar>
    </div>
    <div class="timer">
      <timer :time="this.time"></timer>
    </div>
  </div>
</template>

<script>
import Toolbar from './components/Toolbar'
import Timer from './components/Timer'
export default {
  name: 'App',
  data () {
    return {
      hour: 0,
      minute: 0,
      second: 0,
      time: '00:00:00'
    }
  },
  components: {
    Toolbar,
    Timer
  },
  methods: {
    prefixZero (num) {
      return (Array(3).join('0') + num).slice(-2)
    },
    changeShowtime (showtime) {
      this.hour = Math.floor(showtime / 3600000)
      this.minute = Math.floor((showtime - this.hour * 3600000) / 60000)
      this.second = Math.floor((showtime - this.hour * 3600000 - this.minute * 60000) / 1000)
      this.time = this.prefixZero(this.hour) + ':' + this.prefixZero(this.minute) + ':' + this.prefixZero(this.second)
    }
  }
}
</script>

<style scoped>
#app {
  height: 510px;
  width: 1220px;
  position: static;
  top: 0;
  left: 0;
  padding: 0;
  background: #f2f4f7
}

.toolbar {
  box-sizing: border-box;
  height: 70px;
  width: 1220px;
  padding: 15px 40px;
  background: #97a5bc;
  box-shadow: 0 2px 4px 0;
  color: rgba(0, 0, 0, 0.10);
  font-family: PingFangSC-Regular, "PingFang SC", sans-serif;
  font-size: 16px;
  line-height: 22px;
}

.timer {
  box-sizing: border-box;
  height: 440px;
  width: 1140px;
  position: relative;
  left: 40px;
  padding: 127px 90px 113px;
}
</style>
