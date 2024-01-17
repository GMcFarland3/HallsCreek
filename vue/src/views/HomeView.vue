
<template>
  <div class="header">
    <HeaderView />
  </div>
  <div class="main">
    <MainView />
  </div>
  <div class="footer">
    <FooterView />
  </div>
</template>

<script>
import MainView from "@/views/MainView.vue";
import HeaderView from "@/views/HeaderView.vue";
import FooterView from "@/views/FooterView.vue";
import brewService from '../services/BreweriesService'; // Import your API service
import BeerList from '../components/BeerList.vue';

export default {
  created() {

    brewService
      .getBeers()
      .then(response => {
        if (response.status == 200) {
          this.$store.commit('SET_BEERS', response.data);
        }
      })
      .catch(error => {
        const response = error.response;
        if (response.status === 401) {
          this.invalidCredentials = true;
        }
      });
  },

  components: {
    HeaderView,
    MainView,
    FooterView
  }
};
</script>

<style scoped>
/* .footer {
  position: fixed;
  bottom: 0;
  width: 100%;
} */

/* Add any styles specific to the HomeView component */
</style>