<template>
  <div id="time">{{ time }}</div>
</template>

<script>
export default {
  name: 'Timer',
  props: ['time']
}
</script>

<style scoped>
div {
  font-family: PTMono-Bold, "PT Mono", monospace;
  font-weight: 700;
  color: #333333;
  font-size: 200px;
  line-height: 200px;
}
</style>
