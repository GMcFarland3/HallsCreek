<template>
    <div class="page">
        <HeaderView />
        <section class="Brewery-Info">
            <div v-if="brewery">
                <BreweryInfo :brewery="brewery" :brew_id="brewery.brew_id" />
                <!-- <BeerList :beers="beers" /> -->
                <Review :reviews="filteredReviews" :user_id="$store.state.user.id" :brew_id="brewery.brew_id" :beer_id="beer_id" />
            </div>
        </section>
        <FooterView />
    </div>
</template>
  
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import BreweryInfo from '../components/BreweryInfo.vue';
// import BeerList from '../components/BeerList.vue';
import brewService from '../services/BreweriesService';
import Review from '../components/Review.vue';

export default {
    props: {
        beer_id: {
            type: Number,
            required: true
        },
    },
    data() {
        return {
            brewery: {},
            beer: {},
            filteredReviews: [],
        }
    },

    created() {
        const beer_id = this.$route.params.beer_id;
        this.beer = this.$store.state.beers.find(b => b.beer_Id == beer_id);
        this.brewery = this.$store.state.breweries.find(brew => brew.brew_id == this.beer.brewId);
        this.filteredReviews = this.$store.state.reviews.filter(review => review.beer_id == beer_id);
},

    components: {
        HeaderView,
        BreweryInfo,
        // BeerList,
        Review,
        FooterView
    },
    // methods: {
    // filterReviewsByBeer(beerId) {
    //   this.filteredReviews = this.reviews.filter(review => review.beer_id == beerId);
    //     }
    // }
}
</script>


<style scoped>

.page {
  /* background-image: url('../assets/img/homePage2.png'); */
  background-color:  cadetblue;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
}

FooterView {
    position: fixed;
    bottom: 0;
}
</style>../services/TreesService