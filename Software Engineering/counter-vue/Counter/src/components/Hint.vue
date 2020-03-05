<template>
  <div class="hint"><span id="hint">{{ hint }}</span></div>
</template>

<script>
export default {
  name: 'Hint',
  props: ['hint']
}
</script>

<style scoped>
.hint {
  padding: 9px 0;
  width: 192px;
  height: 40px;
  font-family: PingFangSC-Regular, "PingFang SC", sans-serif;
  font-size: 16px;
  line-height: 22px;
  color: #ffffff;
}
</style>
