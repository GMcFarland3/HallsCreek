<template>
    <div class="beer-slideshow">
      <transition name="fade" mode="out-in">
       
      </transition>
      <transition name="fade" mode="out-in">
        <router-link :to="'/breweryInfo/' + currentBeer.brew_id" v-if="currentBeer">
          <img :key="currentBeer.beer_id" :src="currentBeer.image" :alt="currentBeer.name" class="fade-image" />
          <!-- <h3 class="beer-name">{{ currentBeer.name }}</h3> -->
        </router-link>
      </transition>
    </div>
  </template>
      
  <script>
  export default {
    props: {
      beers: Array, // Pass the beers array as a prop
    },
    data() {
      return {
        currentBeerIndex: 0,
        intervalId: null, // Store the interval ID
      };
    },
    computed: {
      currentBeer() {
        return this.beers[this.currentBeerIndex];
      },
    },
    methods: {
      nextBeer() {
        this.currentBeerIndex = (this.currentBeerIndex + 1) % this.beers.length;
      },
      startSlideshow() {
        this.intervalId = setInterval(this.nextBeer, 8000); // Automatically switch images every 8 seconds
      },
    },
    mounted() {
      this.startSlideshow();
    },
    beforeUnmount() {
      // Clear the interval when the component is unmounted to prevent memory leaks
      clearInterval(this.intervalId);
    },
  };
  </script>
      
  <style scoped>
  .beer-slideshow {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 40rem;
    overflow: hidden;
    animation: fadeAnimation 8s ease-in-out infinite;
    /* Increase duration to 8 seconds */
  }
  
  /* Added styles for the "Featured Beers" title */
  .beer-slideshow h2 {
    font-size: 2rem;
    margin-bottom: 10px;
  }
  
  .fade-image {
    animation: fadeAnimation 8s linear infinite;
    /* Increased duration to 8 seconds */
    width: 400px;
    /* Set a fixed width for the image */
    height: auto;
    object-fit: cover;
    /* Adjust object-fit as needed */
    margin-bottom: 10px;
  }
  
  .beer-name {
    font-size: 1.5rem;
    font-weight: bold;
    text-align: center;
  }
  
  /* CSS Animation */
  @keyframes fadeAnimation {
    0%, 100% {
      opacity: 0;
      /* Initial and final opacity set to 0 */
    }
    50% {
      opacity: 1;
      /* Middle of the animation with opacity 1 */
    }
  }
  </style>
  