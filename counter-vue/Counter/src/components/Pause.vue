<template>
    <div>
        <button id="pause" @click="click">暂停计时器</button>
    </div>
</template>

<script>
export default {
  name: 'Pause',
  methods: {
    click () {
      this.$emit('pause')
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
  background: #2188e9;
}
</style>
