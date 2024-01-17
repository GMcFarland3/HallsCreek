<template>
    <section>
        <div class="picture">
            <img :src="brewery.image" alt="image broken"> <!-- Use the brewery's image source -->
        </div>

        <div class="brewInfo">
            <div class="info">
                <h1>{{ brewery.name }}</h1>
            </div>
            <div class="history">
                <h2>{{ brewery.history }}</h2> <!-- Display the brewery's description -->
            </div>
        </div>

        <div class="details">
            <h3>DETAILS</h3>
            <div class="dets">{{ brewery.address }}</div>
            <div class="dets">{{ brewery.city }}, {{ brewery.state_abbr }} {{ brewery.zip_code }}</div>
            <div class="dets">{{ brewery.phone }}</div>
            <div class="dets">{{ brewery.operation_hours }}</div>
            <div class="dets"><a v-bind:href="brewery.website" target="_blank"> {{ brewery.website }}</a></div>
            <div id="babutton">
                <!-- <router-link v-if="this.showAdmin" :to="'/brewAdmin/' + breweries.brew_id" class="nav-link">Brewer Admin</router-link> -->
                <router-link v-if="this.showAdmin" :to="{ name: 'brewAdmin' }" class="nav-link">Brewer Admin</router-link>
            </div>
        </div>
    </section>
</template>
  
<script>

export default {
    props: {
        brew_id: {
            type: Number,
            required: true
        },
        brewery: {
            type: Object,
            required: true
        }
    },
    data() {
        return {
            // brewery: {},
            beer: {
                beer_Id: '',
                brew_id: '',
                name: '',
                type: '',
                abv: '',
                description: '',
                image: '',
                status: ''
            },
            beers: [],
            showAdmin: false,

        }
    },

    created() {
        if (this.$store.state.user.id == this.brewery.user_id) {
            this.showAdmin = true;
        }
        this.$store.commit('SET_BREWERSID', this.brewery.brew_id);
    },
}
</script>


<style scoped>
section {
    display: flex;
}

img {
    max-width: 400px;
    max-height: 400px;
    margin: 15px 0px 15px 0px;
}

.brewInfo {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    padding-left: 1.5rem;
    flex-grow: 2;
    padding-right: 1.5rem;
    color: white;
}

h1 {
    font-weight: bold;
    font-size: 3rem;
}
h2 {
    padding-left: 1rem;
    padding-right: 1rem;
}

.details {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 1.5rem;
    display: flex;
    flex-direction: column;
    justify-content: top;
    background-color: white;
    padding-right: 3px;
    padding-left: 3px;
    border: 2.5px solid darkorange;;
    margin: 15px 0px 15px 0px;
}

.dets {
    font-size: 1.25rem;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
}

.details>h3 {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 2rem;
    color: darkorange;
    text-decoration: underline;
    text-align: center;
}

#babutton{
    margin-top: 1rem;
    text-align: center;
}

.info {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 5rem;
    margin-top: 1rem;
    border-style: solid;
    border-width: 4px;
    border-left: cadetblue;
    border-right: cadetblue;
}
.history {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 2rem;
    border-style: solid;
    border-width: 4px;
    border-top: cadetblue;
    border-bottom: cadetblue;
}



button {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    justify-content: center;
    align-items: center;
}

form {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    margin: 1rem 0 2rem 0rem;
}

.nav {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    font-size: 2rem;
    padding-left: 4rem;
    justify-content: center;
    /* justify-content: flex-end; */
    flex-direction: column;
    text-decoration: none;
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
}

/* Improved button styles and hover effect */
.nav-link {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-decoration: none;
    text-align: center;
    color: white;
    font-size: 1.5rem;
    transition: color 0.3s;
    border: 1px solid gray;
    padding: 0px 2px 0px 4px;
    border-radius: 5px;
    background-color: darkorange;
    margin: 0px 0px 0px 0px;
}

.nav-link:hover {
    color: darkorange;
    background-color: gray;
    /* Change text color on hover */
    /* Add additional styling for the hover effect, e.g., background color change */
}


</style>../services/TreesService