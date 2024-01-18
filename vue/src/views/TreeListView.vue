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


FooterView {
    position: fixed;
    bottom: 0;
}
</style>../services/TreesService