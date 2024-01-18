<template>
  <div>
    <section class="beers-list">
      <div><h1>Beers</h1></div>
      <div v-for="beer in beers" :key="beer.beer_id" class="beer-card">
        <div class="beer-image-container">
          <img :src="beer.image" alt="beer" class="beer-image" />
        </div>
        <div class="beer-info">
          <h3>{{ beer.name }}</h3>
          <div id="description">{{ beer.description }}</div>
          <div id="subset">
            <div class="details">{{ beer.type }}</div>
            <div class="spacer"></div>
            <div class="details">Average Star Rating(s) {{ displayAverageRating(beer.beer_Id) }}</div>
            <div class="spacer"></div>
            <div class="details">{{ beer.abv }} abv</div>
          </div>
          <div class="topspacer"></div>
          <router-link :to="'/reviews/' + beer.beer_Id" class="nav-link">Click here to read review(s) and/or leave a review</router-link>
          <div id="stock" v-if="beer.status">== OUT OF STOCK ==</div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>

import treesService from "../services/TreesService"
export default {
  data() {
    return {
      review: {
        user_id: '',      // You can set this later when you have user data
        brew_id: '',      // Will be populated with the brewery ID
        beer_id: '',      // Will be populated with the selected beer ID
        beerName: '',          // The user's name (if needed)
        rating: '',
        review: '',
        image: '',
      },
      reviews: [],
      filteredReviews: [],
      
    };
  },

  created() {
    treesService
      .getReviews()
      .then(response => {
        if (response.status == 200) {
          this.reviews = response.data;
          this.$store.commit('SET_REVIEWS', response.data);
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
    displayAverageRating(beerId) {
      this.filteredReviews = this.reviews.filter(review => review.beer_id == beerId);
      if (this.filteredReviews.length == 0) return 'No ratings yet';

      const totalRating = this.filteredReviews.reduce((acc, review) => acc + parseInt(review.rating), 0);
      const averageRating = totalRating / this.filteredReviews.length;
      return this.generateStarRating(averageRating);
    },

    generateStarRating(rating) {
      const maxStars = 5;
      const fullStars = Math.floor(rating);
      const halfStar = rating % 1 !== 0;
      const emptyStars = maxStars - fullStars - (halfStar ? 1 : 0);

      let stars = '⭐'.repeat(fullStars);
      if (halfStar) {
        stars += '½';
      }
      stars += '☆'.repeat(emptyStars);

      return stars;
    },
  },
};
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
.beers-list {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  display: flex;
  flex-direction: column;
  /* flex-wrap: wrap; */
  gap: 20px;
  margin-left: 1rem;
}

.beer-card {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  border: 1px solid #080808;
  padding: 10px;
  width: 80rem;
  height: 350px;
  display: flex;
  flex-direction: row;
  align-items: center;
  text-align: center;

  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
    /* Existing shadow */
    0px 0px 10px darkorange;
  /* Additional gold shadow */
}

.beer-image-container {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-bottom: 10px;
  /* width: 100%; */
  width: 300px;
  height: 300px;
}

.beer-image {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  /* max-width: 100%;
  height: auto;
  width: 100%; */
  width: 300px;
  height: 300px;
}

.beer-info {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  display: flex;
  flex-direction: column;
  flex-grow: 3;
  color: white;
  margin-left: 1rem;
}

h3 {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-top: 0;
  padding-top: 0;
  padding-bottom: 2rem;
  color: white;
  font-weight: bold;
  font-size: 2.5rem;
}

#description {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-weight: 1.25rem;
  margin-bottom: 0.5rem;
  padding-bottom: 0.5rem;
  color: white;
  border-style: solid;
  border-width: 1px;
  border-left: cadetblue;
  border-top: cadetblue;
  border-right: cadetblue;
}

#subset {
  display: flex;
  flex-direction: row;
  margin-left: 0.5rem;
  margin-right: 0.5rem;
  justify-content: space-evenly;
  text-align: center;
}

#stock {
  margin-top: 1rem;
  font-weight: bold;
  font-size: 1rem;
}

.spacer {
  border-style: solid;
  border-width: 1px;
  border-bottom: cadetblue;
  border-top: cadetblue;
  border-right: cadetblue;
}

.topspacer {
  margin-top: 1rem;
  margin-bottom: 1rem;
  border-style: solid;
  border-width: 1px;
  border-bottom: cadetblue;
  border-left: cadetblue;
  border-right: cadetblue;
}

.nav {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    font-size: 2rem;
    padding-left: 4rem;
    justify-content: center;
    /* justify-content: flex-end; */
    flex-direction: column;
    text-decoration: none;
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
}

/* Improved button styles and hover effect */
.nav-link {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-decoration: none;
    text-align: center;
    color: white;
    font-size: 1.5rem;
    transition: color 0.3s;
    border: 1px solid gray;
    padding: 0px 2px 0px 4px;
    border-radius: 5px;
    background-color: darkorange;
    margin: 0px 0px 0px 0px;
}

.nav-link:hover {
    color: darkorange;
    background-color: gray;
    /* Change text color on hover */
    /* Add additional styling for the hover effect, e.g., background color change */
}
</style>
../services/TreesService