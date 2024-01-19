<template>
  <div class="home-container">

      <div class="featured-section">
        <h1>Featured Trees</h1>
        <treeSlideshow :trees="treeslide" />
      </div>

    <div class="about-box">
      <p>
        Welcome to Hall's Creek Tree Farm.  The best place to acquire trees for your next landscaping project. Improve your
        curb appeal with beautiful trees from our local farm.  Expert employees will help every step of the way, from selecting
        the proper tree to installation.  We pride exceeding your exceptions.  Give us a chance to earn your business.
      </p>
    </div>
  </div>
</template>

<script>
import treesService from "../services/TreesService";
import treeSlideshow from "../components/TreeSlideshow.vue";

export default {
  data() {
    return {
      treeslide: [],
    };
  },
  created() {
    treesService
      .getTrees()
      .then(response => {
        if (response.status == 200) {
          this.treeslide = response.data;
          this.$store.commit('SET_TREES', response.data);
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
    treeSlideshow
  },
};
</script>

<style scoped>
.home-container {
  background-image: url("../assets/img/background.jpg");
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  background-size: cover;
  background-repeat: no-repeat;
  background-color:rgb(96, 137,119);
}

.featured-section {
  width: calc(50% - 10px);
  object-fit: contain;
}

.featured-section h1 {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-size: 2.5rem;
  color: whitesmoke;
  text-shadow: black 2px 2px 2px;
  text-align: center;
}

.featured-section{
  width: calc(50% - 10px);
  z-index: 2;
  height: 100%;
  margin-bottom: 50px;
}

.featured-section {
  margin-bottom: 50px;
}

.about-box {
  font-family: 'IM Fell English', serif;
  font-size: 1.5rem;
  background-color: white;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 5px;
  line-height: 1.6;
  position: relative;
  z-index: 1;
}
</style>
