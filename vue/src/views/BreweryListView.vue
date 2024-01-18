<template>
  <div>
    <HeaderView />
    <h1>Breweries</h1>
    <div class="list">
      <section class="breweries-list">
        <!-- Using v-for directly on the BreweryList component -->
        <BreweryList class="breweries" :breweries="breweries" :key="breweries.brew_Id" v-for="breweries in breweries" />
      </section>
    </div>
    <FooterView />
  </div>
</template>
  
<script>
import HeaderView from './HeaderView.vue'
import BreweryList from '../components/BreweryList.vue';
import FooterView from './FooterView.vue';

export default {
  data() {
    return {
      breweries: []
    }
  },
  created() {
    brewService
      .getBreweries()
      .then(response => {
        if (response.status == 200) {
          this.breweries = response.data;
          this.$store.commit('SET_BREWERIES', response.data);
        }
      })
      .catch(error => {
        const response = error.response;
        if (response.status === 401) {
          this.invalidCredentials = true;
        }
      });
  },
  methods: {
    toggleLike() {
      this.liked = !this.liked;
    },
  },
  components: {
    HeaderView,
    BreweryList,
    FooterView
  }
}
</script>
  
<style scoped>
h1 {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  color: white;
  text-align: left;
  font-weight: bolder;
  margin: 0;
  padding: 20px 0;
  /* background-image: url('../assets/img/beerstar.png'); */
  background-color:  cadetblue;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
  font-size: 4rem;
  /* Increase the font size */
}


.list {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  /* Adjust as needed to prevent the footer from overlapping content */
  /* background-image: url('../assets/img/beerstar.png'); */
  background-color:  cadetblue;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
}

/* Style for brewery cards */
.brewery-card {
  background-color: #FFF;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  padding: 20px;
  margin: 20px;
  display: flex;
  flex-direction: column;
}

.brewery-card img {
  width: 100%;
  height: auto;
  border-radius: 5px;
  margin-bottom: 10px;
}

.brewery-card h3 {
  font-size: 1.5rem;
  margin-bottom: 10px;
}

.brewery-card p {
  font-size: 1rem;
  color: #666;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

/* Adjust the styling based on your design preferences */
</style>
../services/TreesService