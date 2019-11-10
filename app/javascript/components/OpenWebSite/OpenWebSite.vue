<template>
  
</template>
<script>
export default {
  name: 'OpenWebSite',
  props: {
    data: {
      type: Array,
      require: true
    }
  },

  mounted() {
    window.location.href = this.data[0].url;
  }
}
</script>
<style>

</style>
