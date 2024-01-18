<template>
  <div class="home-container">

    <tree-slideshow :trees="treesFromStore" />

  </div>
  <div class="about-box">
    <p>
      Welcome to Hall's Creek Tree Farm.  The best place to accquire trees for your next landscaping project. Improve your
      curb appeal with beautiful trees from our local farm.  Expert employees will help every step of the way, from selecting
      the proper tree to installation.  We pride exceeding your expections.  Give us a chance to earn your business.
    </p>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import treeSlideshow from "../components/TreeSlideshow.vue";

export default {
  data() {
  },
  components: {
    treeSlideshow
  },
  computed: {
    ...mapState(['trees']),
  },
};
</script>

<style scoped>
.home-container {
  background-image: url("../assets/img/background.JPG");
  height: 50rem;
  background-repeat: no-repeat;
  background-size: cover;

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
