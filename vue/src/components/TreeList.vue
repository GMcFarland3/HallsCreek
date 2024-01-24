<template>
  <div>
    <section class="tree-list">
      <div><h1>Catalog</h1></div>
      <div v-for="trees in returnTrees" :key="trees.speciesid" class="tree-card">
        <div class="tree-image-container">
          <img :src="trees.image" alt="tree" class="tree-image" />
        </div>
        <div class="tree-info">
          <h2>{{ trees.scientificName }}</h2>
          <h3>{{ trees.commonName }}</h3>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">Size(s) in inches</div>
            <div class="spacer"></div>
            <div class="details">Price(s)</div>
          </div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ trees.size1 }}</div>
            <div class="spacer"></div>
            <div class="details">${{ trees.price1 }}</div>
          </div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ trees.size2 }}</div>
            <div class="spacer"></div>
            <div class="details">${{ trees.price2 }}</div>
          </div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ trees.size3 }}</div>
            <div class="spacer"></div>
            <div class="details">${{ trees.price3 }}</div>
          </div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ trees.size4 }}</div>
            <div class="spacer"></div>
            <div class="details">${{ trees.price4 }}</div>
          </div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ trees.size5 }}</div>
            <div class="spacer"></div>
            <div class="details">${{ trees.price5 }}</div>
          </div>
          <div class="topspacer"></div>
          <div id="subset">
            <div class="details">{{ trees.size6 }}</div>
            <div class="spacer"></div>
            <div class="details">${{ trees.price6 }}</div>
          </div>
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
  color: rgb(95, 136, 118);
  font-size: 3rem;
  background-color: rgb(173, 160, 116);
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
  font-family: 'IM Fell English', serif;
  display: flex;
  flex-direction: column;
  gap: 20px;
  background-color: rgb(95, 136, 118);
}

.tree-card {
  font-family: 'IM Fell English', serif;
  border: 1px solid #080808;
  padding: 10px;
  width: 90rem;
  height: 500px;
  display: flex;
  flex-direction: row;
  align-items: center;
  text-align: center;
  margin-left: 1rem;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
    0px 0px 10px rgb(173, 160, 116);
}

.tree-image-container {
  font-family: 'IM Fell English', serif;
  margin-bottom: 10px;
  width: 300px;
  height: 300px;
}

.tree-image {
  font-family: 'IM Fell English', serif;
  height: 24rem;
  width: 20rem;
}

.tree-info {
  font-family: 'IM Fell English', serif;
  display: flex;
  flex-direction: column;
  flex-grow: 3;
  color: white;
  margin-left: 1rem;
}

h2 {
  font-family: 'IM Fell English', serif;
  margin-top: 0;
  padding-top: 0;
  padding-bottom: 0.25rem;
  margin-bottom: 0.25rem;
  font-weight: bold;
  font-size: 2.5rem;
  color: rgb(95, 136, 118);
  background-color: rgb(173, 160, 116);
  border-bottom-left-radius: 75px;
  border-bottom-right-radius: 75px;
  margin-bottom: 2rem;
  margin-left: 17rem;
  padding-right: 4rem;
  padding-left: 2rem;
  width: 30rem;
  justify-self: center;
}

h3 {
  font-family: 'IM Fell English', serif;
  margin-top: 0;
  padding-top: 0;
  padding-bottom: 0.25rem;
  margin-bottom: 0.25rem;
  color: white;
  font-weight: bold;
  font-size: 1.75rem;
}

#subset {
  display: flex;
  flex-direction: row;
  margin-left: 0.5rem;
  margin-right: 0.5rem;
  justify-content: space-evenly;
  text-align: center;
}

.details {
  width:50%;
}

.spacer {
  border-style: solid;
  border-width: 1px;
  border-bottom: rgb(95, 136, 118);
  border-top: rgb(96, 136,118);
  border-right: rgb(96, 136,118);
}

.topspacer {
  margin-top: 1rem;
  margin-bottom: 1rem;
  border-style: solid;
  border-width: 1px;
  border-bottom: rgb(96, 136,118);
  border-left: rgb(96, 136,118);
  border-right: rgb(96, 136,118);
}

img {
  border-radius: 5%;
  border: 1px solid #080808;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
    0px 0px 10px rgb(173, 160, 116);
}

</style>
