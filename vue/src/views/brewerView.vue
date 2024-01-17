<template>
    <div class="page">
        <header-view />
        <div>
            <AddBeer :brewery="brewery" />
        </div>
        <footer-view />
    </div>
</template>


<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import AddBeer from '../components/AddBeer.vue';

export default {
    created() {
        const brew_Id = this.$store.state.brewersID;
        this.brewery = this.$store.state.breweries.find(b => b.brew_id == brew_Id);
    },
    data() {
        return {
            brewery: {},
        }
    },

    components: {
        HeaderView,

        AddBeer,

        FooterView
    }
}
</script>

<style scoped>
.page {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    /* background-image: url('../assets/img/homePage2.png'); */
    background-color:  cadetblue;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
    margin: 0;
    /* Remove margin */
    padding: 0;
    /* Remove padding */
}
</style>