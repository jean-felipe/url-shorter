<template>
  <div class="wrapper">
    <div class="content">
      <component :is="loadComponent" :data="componentData" />
    </div>
  </div>
</template>

<script>
import UrlInput from '../UrlInput';

const componentDicionary = {
  url_input: UrlInput,
};

export default {
  name: 'Main',

  components: {
    UrlInput
  },

  data() {
    return {
      name: '',
      setup: false,
      faucetsNumber: 0,
      faucetsNot: 0,
    }
  },

  props: {
    componentName: {
      type: String,
      required: true,
    },
    componentData: {
      type: Array,
    },
  },

  computed: {
    loadComponent() {
      return componentDicionary[this.componentName]
    }
  }
}
</script>

<style>
  input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

</style>
