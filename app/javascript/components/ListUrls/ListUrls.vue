<template>
  <div>
    <h2>Top 100 most frequently accessed URLs</h2>
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Viwes</th>
          <th>Url</th>
          <th>ShortedUrl</th>
        </tr>
      </thead>
      <tbody v-for="webSite in webSites" v-bind:key="webSite.id">
        <tr>
          <td>{{webSite.title}}</td>
          <td>{{webSite.counter}}</td>
          <td>{{webSite.url}}</td>
          <td>{{webSite.shorted_url}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ListUrls',
  data() {
    return {
      webSites: []
    }
  },

  mounted() {
    axios.get('/web_sites')
      .then((response) => {
        response.data.forEach((webSite) => {
          this.webSites.push(webSite);
        })
      })

      this.$cable.subscribe({ channel: 'UrlListChannel' });
  },

  channels: {
    UrlListChannel: {
      connected() {
        console.log('Connected to channel');
      },
			rejected() {
        console.log('rejected')
      },
			received(data) {
        this.webSites = [];
        data.data.forEach((webSite) => {
          this.webSites.push(webSite);
        })
       
      },
			disconnected() {
        console.log('desconectado')
      }
    }
  },
}
</script>

<style>
table, td, th {  
  border: 1px solid #ddd;
  text-align: left;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 15px;
}
</style>
