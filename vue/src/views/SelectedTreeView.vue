<template>
    <div class="page">
        <HeaderView />
        <section >
            <div>
                <SelectedTree :treeId="treeId"  />
            </div>
        </section>
        <FooterView />
    </div>
</template>
  
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import SelectedTree from '../components/SelectedTree.vue';


export default {
    data() {
        return {
        }
    },
    props: {
        treeId: {
            type: Number,
            required: true
        }
    },
    components: {
        HeaderView,
        SelectedTree,
        FooterView
    },
}
</script>


<style scoped>


FooterView {
    position: fixed;
    bottom: 0;
}
</style>