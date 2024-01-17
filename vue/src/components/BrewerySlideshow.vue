<template>
  <div class="fadephoto">
    <transition name="fade">
      <router-link v-if="currentBrewery" :to="'/breweryInfo/' + currentBrewery.brew_id">
        <img :src="currentBrewery.image" :alt="currentBrewery.name" class="fade-image" />
      </router-link>
    </transition>
  </div>
</template>

<script>
export default {
  props: {
    breweries: Array, // Pass the breweries array as a prop
  },
  data() {
    return {
      currentBreweryIndex: 0,
      intervalId: null, // Store the interval ID
    };
  },
  computed: {
    currentBrewery() {
      return this.breweries[this.currentBreweryIndex];
    },
  },
  methods: {
    nextBrewery() {
      this.currentBreweryIndex = (this.currentBreweryIndex + 1) % this.breweries.length;
    },
    startSlideshow() {
      this.intervalId = setInterval(this.nextBrewery, 9000); // Automatically switch images every 9 seconds
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
.fadephoto {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 40rem;
  overflow: hidden;
  animation: fadeAnimation 9s ease-in-out infinite;
  /* Apply animation to the whole slideshow */
}

.fade-image {
  animation: fadeAnimation 9s linear infinite;
  /* Apply fade animation */
  max-width: 100%;
  /* Use max-width instead of fixed width */
  max-height: 100%;
  /* Use max-height instead of fixed height */
  object-fit: contain;
  /* Maintain aspect ratio and fit the entire image within the container */
}

/* CSS Animation */
@keyframes fadeAnimation {

  0%,
  100% {
    opacity: 0;
    /* Initial and final opacity set to 0 */
  }

  25%,
  75% {
    opacity: 1;
    /* Middle of the animation with opacity 1 */
  }
}
</style>
