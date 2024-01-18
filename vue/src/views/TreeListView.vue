<template>
    <div class="page">
        <HeaderView />
        <section >
            <div>
                <TreeList />
            </div>
        </section>
        <FooterView />
    </div>
</template>
  
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import TreeList from '../components/TreeList.vue';


export default {
    data() {
        return {
        }
    },

    components: {
        HeaderView,
        TreeList,
        FooterView
    },
}
</script>


<style scoped>

/* .page {
  background-color:  rgb(96, 137,119);
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
} */

FooterView {
    position: fixed;
    bottom: 0;
}
</style>../services/TreesService