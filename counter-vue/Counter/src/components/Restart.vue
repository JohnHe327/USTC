<template>
    <div>
        <button id="restart" @click="click">重新再计时</button>
    </div>
</template>

<script>
export default {
  name: 'Restart',
  methods: {
    click () {
      this.$emit('restart')
    }
  }
}
</script>

<style scoped>
button {
  color: #ffffff;
  height: 40px;
  width: 98px;
  font-family: PingFangSC-Regular, "PingFang SC", sans-serif;
  font-size: 16px;
  line-height: 22px;
  border: none;
  padding: 9px;
  border-radius: 5px;
  background: #ffb020;
}
</style>
