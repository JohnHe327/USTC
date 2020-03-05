<template>
    <div>
        <button id="clear" @click="click">{{ clearBtnMsg }}</button>
    </div>
</template>

<script>
export default {
  name: 'Clear',
  props: ['clearBtnMsg'],
  methods: {
    click () {
      this.$emit('clear')
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
  background: #dd2e1d;
}
</style>
