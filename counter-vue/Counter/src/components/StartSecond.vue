<template>
  <div>
    <div class="number">
      <input type="text" id="second" placeholder="0" @change="emitSecond" v-model="second" value="" />
    </div>
    <label class="unit" for="second">秒</label>
  </div>
</template>

<script>
export default {
  name: 'StartSecond',
  props: ['second'],
  methods: {
    emitSecond () {
      this.$emit('changeS', parseInt(this.second))
    }
  }
}
</script>

<style scoped>
.start-time {
  background: #ffffff;
  box-sizing: border-box;
  padding: 9px;
  height: 40px;
  width: 70px;
  color: rgba(0, 0, 0, 0.10);
  box-shadow: 0 2px 4px 0;
  border-radius: 5px;
}

.number {
  float: left;
  color: #afafaf;
}

input {
  border: none;
  height: 22px;
  width: 30px;
}

.unit {
  float: right;
  color: #222222;
}
</style>
