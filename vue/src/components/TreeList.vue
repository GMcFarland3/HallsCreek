<template>
  <div>
    <section class="tree-list">
      <div><h1>Trees</h1></div>
      <div v-for="tree in returnTrees" :key="tree.treeId" class="tree-card">
        <div class="tree-image-container">
          <img :src="tree.image" alt="tree" class="tree-image" />
        </div>
        <div class="tree-info">
          <h3>{{ tree.commonName }}</h3>
          <div id="description">{{ tree.scientificName }}</div>
          <div id="subset">
            <div class="details">{{ tree.leaf }}</div>
            <div class="spacer"></div>
            <!-- <div class="details">Average Star Rating(s) {{ displayAverageRating(tree.treeId) }}</div> -->
            <div class="details">Expected life of {{ tree.lifespan }}</div>
            <div class="spacer"></div>
            <div class="details">{{ tree.uses }}</div>
          </div>
          <div class="topspacer"></div>
          <div class="details">{{ tree.sizeGrowthHabit }}</div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ tree.color }}</div>
            <div class="spacer"></div>
            <div class="details">Bloom time of {{ tree.bloomTime }}</div>
            <div class="spacer"></div>
            <div class="details">{{ tree.lightRequirement }}</div>
          </div>
          <div class="topspacer"></div>
          <div class="details">{{ tree.pestDisease }}</div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ tree.wateringNeeds }}</div>
            <div class="spacer"></div>
            <div class="details">Zone {{ tree.hardinessZone }} of {{ tree.origin }}</div>
            <div class="spacer"></div>
            <div class="details">{{ tree.soil }}</div>
          </div>
          <router-link :to="'/reviews/' + tree.treeId" class="nav-link">Click here to read review(s) and/or leave a review</router-link>
        </div>
      </div>
    </section>
  </div>
</template>

<script>

export default {

  computed: {
        returnTrees() {
          return this.$store.state.trees;
        },
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
  background-color:  rgb(96, 137,119);
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
  font-size: 4rem;
  /* Increase the font size */
}
.tree-list {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  display: flex;
  flex-direction: column;
  /* flex-wrap: wrap; */
  gap: 20px;
  margin-left: 1rem;
  background-color:  rgb(96, 137,119);
}

.tree-card {
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
    0px 0px 10px rgb(174, 161, 117);
  /* Additional gold shadow */
}

.tree-image-container {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  margin-bottom: 10px;
  /* width: 100%; */
  width: 300px;
  height: 300px;
}

.tree-image {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  /* max-width: 100%;
  height: auto;
  width: 100%; */
  width: 300px;
  height: 300px;
}

.tree-info {
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
  padding-bottom: 0.25rem;
  margin-bottom: 0.25rem;
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
  border-left: rgb(96, 137,119);
  border-top: rgb(96, 137,119);
  border-right: rgb(96, 137,119);
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
  border-bottom: rgb(96, 137,119);
  border-top: rgb(96, 137,119);
  border-right: rgb(96, 137,119);
}

.topspacer {
  margin-top: 1rem;
  margin-bottom: 1rem;
  border-style: solid;
  border-width: 1px;
  border-bottom: rgb(96, 137,119);
  border-left: rgb(96, 137,119);
  border-right: rgb(96, 137,119);
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
    background-color: rgb(174, 161, 117);
    margin: 0px 0px 0px 0px;
}

.nav-link:hover {
    color: rgb(12, 12, 12);
    background-color: rgb(253, 225, 132);
    /* Change text color on hover */
    /* Add additional styling for the hover effect, e.g., background color change */
}
</style>
