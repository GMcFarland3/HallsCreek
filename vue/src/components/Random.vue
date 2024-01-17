<template>
    <router-link :to="'/breweryInfo/' + breweries.brew_id">
        <div class="brewery-card">
            <div class="image-box">
                <img :src="breweries.image" />
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
.brewery-card {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    display: inline-block;
    margin: 10px;
    border: 1px solid rgb(199, 170, 2);
    padding: 10px;
    width: 200px;
    /* Adjust the width as needed */
}

.image-box {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    width: 150px;
    /* Adjust the width as needed */
    height: 150px;
    /* Adjust the height as needed */
    overflow: hidden;
    margin: 0 auto;
    /* Center the image horizontally */
    display: flex;
    /* Center the image vertically */
    justify-content: center;
    /* Center the image vertically */
    align-items: center;
    /* Center the image vertically */
}

img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    cursor: pointer;
    align-content: center;
}

.brewery-info {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
}
</style>
    