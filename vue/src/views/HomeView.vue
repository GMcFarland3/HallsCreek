
<template>
  <div class="header">
    <HeaderView />
  </div>
  <div class="main">
    <MainView />
  </div>
  <div class="footer">
    <FooterView />
  </div>
</template>

<script>
import MainView from "@/views/MainView.vue";
import HeaderView from "@/views/HeaderView.vue";
import FooterView from "@/views/FooterView.vue";



export default {
  created() {

  },

  components: {
    HeaderView,
    MainView,
    FooterView
  }
};
</script>

<style scoped>


</style>../services/TreesService