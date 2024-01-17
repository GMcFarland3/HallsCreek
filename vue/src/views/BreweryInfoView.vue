<template>
    <div class="page">
        <HeaderView />
        <section class="Brewery-Info">
            <div v-if="brewery">
                <BreweryInfo :brewery="brewery" :brew_id="brewery.brew_id" />
                <BeerList :beers="beers" />
                <!-- <Review :reviews="reviews" :user_id="$store.state.user.id" :brew_id="brewery.brew_id" /> -->
            </div>
        </section>
        <FooterView />
    </div>
</template>
  
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import BreweryInfo from '../components/BreweryInfo.vue';
import BeerList from '../components/BeerList.vue';



export default {
    data() {
        return {
            brewery: {},
            beers: [],
            reviews: [] // Initialize the reviews array here
        }
    },

    created() {
        const brew_Id = this.$route.params.brew_Id;
        this.brewery = this.$store.state.breweries.find(b => b.brew_id == brew_Id);

        brewService
            .getBeers()
            .then(response => {
                if (response.status == 200) {
                    this.$store.commit('SET_BEERS', response.data);
                    this.beers = this.$store.state.beers.filter(b => b.brewId == brew_Id);
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
        HeaderView,
        BreweryInfo,
        BeerList,
        // Review,
        FooterView
    },
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