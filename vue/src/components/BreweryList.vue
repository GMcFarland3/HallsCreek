<template>
  <router-link :to="'/breweryInfo/' + breweries.brew_id">
    <div class="brewery-card">
      <div class="image-box">
        <img :src="breweries.image" alt="Brewery Image" />
      </div>
      <div class="brewery-info">
        <h1>{{ breweries.name }}</h1>
      </div>
    </div>
  </router-link>
</template>

<script>
export default {
  props: ['breweries'],
};
</script>

<style scoped>
/* Styling for brewery cards */
.brewery-card {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  display: flex;
  flex-direction: column;
  display: inline-block;
  margin: 10px;
  padding: 10px;
  width: 300px;
  border-radius: 8px;
  border: 1px solid darkorange;
  /* Box shadow for a slight lift effect */
  box-shadow: darkorange 2px 2px 2px 2px;
  transition: transform 0.3s ease-in-out;
}

.brewery-card:hover {
  transform: translateY(-5px); /* Add a slight lift on hover */
}

.image-box {
  width: 100%;
  height: 150px;
  overflow: hidden;
  border-radius: 5px;
}

img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.brewery-info {
  text-align: center;
  margin-top: 10px;
}

h1 {
  font-size: 1.2rem;
  margin: 0;
  color: white;
}
</style>
