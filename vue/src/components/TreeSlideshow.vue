<template>
  <div class="fadephoto">
    <transition name="fade">
      <div v-if="currentTree">
        <img :src="currentTree.image" :alt="currentTree.commonName" class="fade-image" />
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  props: {
    trees: Array,
  },
  data() {
    return {
      currentTreeIndex: 0,
      intervalId: null,
    };
  },
  computed: {
    currentTree() {
      return this.trees.length ? this.trees[this.currentTreeIndex] : null;
    },
  },
  methods: {
    nextTree() {
      this.currentTreeIndex = (this.currentTreeIndex + 1) % this.trees.length;
    },
    startSlideshow() {
      this.intervalId = setInterval(this.nextTree, 9000);
    },
  },
  mounted() {
    this.startSlideshow();
  },
  beforeUnmount() {
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
}

.fade-image {
  width: 100%;
  height: 100%;
  object-fit: contain;
  animation: fadeAnimation 9s linear infinite;
}

@keyframes fadeAnimation {
  0%, 100% { opacity: 0; }
  25%, 75% { opacity: 1; }
}
</style>
