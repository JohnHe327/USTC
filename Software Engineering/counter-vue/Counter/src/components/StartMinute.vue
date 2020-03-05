<template>
  <div>
    <div class="number">
      <input type="text" id="minute" placeholder="0" @change="emitMinute" v-model="minute" value="" />
    </div>
    <label class="unit" for="minute">分</label>
  </div>
</template>

<script>
export default {
  name: 'StartMinute',
  props: ['minute'],
  methods: {
    emitMinute () {
      this.$emit('changeM', parseInt(this.minute))
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
