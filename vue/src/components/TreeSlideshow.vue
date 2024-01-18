<template>
  <div class="fadephoto">
    <transition name="fade">
      <div>
        <img :src="currentTree.image" :alt="currentTree.commonName" class="fade-image" />
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  props: {
    trees: Array, // Pass the breweries array as a prop
  },
  data() {
    return {
      currentTreeIndex: 1,
      intervalId: null, // Store the interval ID
    };
  },
  computed: {
    currentTree() {
      return this.trees.filter(tree => tree.treeId == 2);
      // return this.trees[this.currentTreeIndex];
    },
  },
  methods: {
    nextTree() {
      this.currentTreeIndex = (this.currentTreeIndex + 1) % this.trees.length;
    },
    startSlideshow() {
      this.intervalId = setInterval(this.nextTree, 9000); // Automatically switch images every 9 seconds
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
