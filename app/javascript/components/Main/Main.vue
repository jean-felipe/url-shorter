<template>
  <div class="wrapper">
    <Sidebar :pubName="name"/>
      <div class="main-panel">
        <Header />
        <div class="content">
          <component :is="loadComponent" :data="componentData" />
        </div>
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
  .main-panel {
    position: relative;
    float: right;
    width: calc(100% - 260px);
    transition: .33s,cubic-bezier(.685,.0473,.346,1);
  }

  .content {
    width: 100%;
    /* padding-right: 15px; */
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
  }

  .main-panel>.content {
    margin-top: 110px;
    padding: 30px 15px;
    min-height: calc(100vh - 123px);
}

</style>
