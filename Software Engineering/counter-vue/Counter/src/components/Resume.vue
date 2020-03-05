<template>
    <div>
        <button id="resume" @click="click">恢复计时器</button>
    </div>
</template>

<script>
export default {
  name: 'Resume',
  methods: {
    click () {
      this.$emit('resume')
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
