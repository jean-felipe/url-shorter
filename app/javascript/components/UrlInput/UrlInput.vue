<template>
  <div>
    <div class="input-wrapper">
      <p>Insert your URL</p>
      <input type=text v-model="webSite.url">
      <input type="submit" value="Short!" @click="submitUrl">
    </div>

    <div class="response-wrapper" v-if="successCreated">
      <h2>URL Shortened!</h2>
      <h4>{{webSite.title}}</h4>
      <p class="shortened-url" @click="moveToUrl()">{{current +  webSite.shortedUrl}}</p>
    </div>
    <div class="list-wrapper">
      <ListUrls />
    </div>
  </div>
</template>

<script>
import ListUrls from '../ListUrls';
import axios from 'axios';

export default {
  name: 'UrlInput',
  components: { ListUrls },

  data() {
    return {
      successCreated: false,
      current: window.location.href,
      webSite: {
        title: '',
        url: '',
        shortedUrl: '',
      },
    }
  },

  methods: {
    submitUrl() {
      if (this.url === '') {
        alert('You need to insert some url')
      } else if(this.validateUrl(this.webSite.url)) {
        axios.post('/web_sites', {web_site: {url: this.webSite.url}})
          .then((response) => {
            this.webSite.shortedUrl = response.data.shorted_url;
            this.webSite.title = response.data.title;
            this.successCreated = true;
          })
      } else {
        alert('Please paste a valid url')
      }
    },

    validateUrl(url) {
      var expression = /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/gi;
      var regex = new RegExp(expression);
      
      if (url.match(regex)) {
        return true;
      } else {
        return false;
      }
    },

    moveToUrl() {
      window.location.href = `/${this.webSite.shortedUrl}`; 
    }
  }
}
</script>

<style scoped>
.shortened-url {
  cursor: pointer;
}
</style>
