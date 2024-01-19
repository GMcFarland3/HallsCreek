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
            <div class="details">[LEAF] {{ tree.leaf }}</div>
            <div class="spacer"></div>
            <!-- <div class="details">Average Star Rating(s) {{ displayAverageRating(tree.treeId) }}</div> -->
            <div class="details">[EXPECTED LIFE] {{ tree.lifespan }}</div>
            <div class="spacer"></div>
            <div class="details">[USES] {{ tree.uses }}</div>
          </div>
          <div class="topspacer"></div>
          <div class="details">{{ tree.sizeGrowthHabit }}</div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">[COLOR] {{ tree.color }}</div>
            <div class="spacer"></div>
            <div class="details">[BLOOM TIME] {{ tree.bloomTime }}</div>
            <div class="spacer"></div>
            <div class="details">[SUN] {{ tree.lightRequirement }}</div>
          </div>
          <div class="topspacer"></div>
          <div class="details">{{ tree.pestDisease }}</div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">[WATERING] {{ tree.wateringNeeds }}</div>
            <div class="spacer"></div>
            <div class="details">[ZONE] {{ tree.hardinessZone }} of {{ tree.origin }}</div>
            <div class="spacer"></div>
            <div class="details">[SOIL] {{ tree.soil }}</div>
          </div>
          <div class="topspacer"></div>
          <router-link :to="'/selectedtree/' + tree.treeId" class="nav-link">Click here for more information and pricing</router-link>
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
  font-family: 'IM Fell English', serif;
  text-align: left;
  color: rgb(96, 137,119);
  font-size: 3rem;
  background-color:rgb(174, 161, 117);
  border-top-right-radius: 75px;
  border-bottom-right-radius: 75px;
  box-shadow: 10px 10px 2px 1px rgb(204, 204, 204);
  margin-bottom: 2rem;
  margin-top: 1rem;
  margin-left: 1rem;
  padding-right: 4rem;
  padding-left: 2rem;
  width: 20rem;
}

.tree-list {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  display: flex;
  flex-direction: column;
  /* flex-wrap: wrap; */
  gap: 20px;
  /* margin-left: 1rem; */
  background-color:  rgb(96, 137,119);
}

.tree-card {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  border: 1px solid #080808;
  padding: 10px;
  width: 90rem;
  height: 400px;
  display: flex;
  flex-direction: row;
  align-items: center;
  text-align: center;
  margin-left: 1rem;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
    0px 0px 10px rgb(174, 161, 117);
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
