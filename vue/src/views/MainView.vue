<template>
  <div class="home-container">

  </div>
  <div class="about-box">
    <p>
      Welcome to Hall's Creek Tree Farm.  The best place to acquire trees for your next landscaping project. Improve your
      curb appeal with beautiful trees from our local farm.  Expert employees will help every step of the way, from selecting
      the proper tree to installation.  We pride exceeding your exceptions.  Give us a chance to earn your business.
    </p>
  </div>
</template>

<script>
import treesService from "../services/TreesService";

export default {
  data() {
    return {
      // treeslide: [],
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

  },
};
</script>

<style scoped>
.home-container {
  background-image: url("../assets/img/background.jpg");
  padding: 20px;
  height: 35rem;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  background-size: cover;
  background-repeat: no-repeat;
  background-color: rgb(95, 136, 118);
}

.about-box {
  font-family: 'IM Fell English', serif;
  font-size: 1.6rem;
  background-color: #5f8876;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 5px;
  line-height: 1.6;
  position: relative;
  z-index: 1;
  color: #ada074;
}


/* Responsive styles for tablets and mobile phones */
@media screen and (max-width: 768px) {
  .home-container {
    padding: 10px; /* Reduce padding on smaller screens */
  }

  .about-box {
    font-size: 1.4rem; /* Slightly smaller font for readability */
  }
}

@media screen and (max-width: 480px) {
  .home-container {
    padding: 5px;
  }

  .about-box {
    font-size: 1.2rem; /* Further reduce font size for mobile phones */
  }
}
</style>
