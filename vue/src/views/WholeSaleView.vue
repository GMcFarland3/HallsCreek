<template>
    <div class="page">
        <HeaderView />
        <section >
            <div>
                <WholeSaleList />
            </div>
        </section>
        <FooterView />
    </div>
</template>
  
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import WholeSaleList from '../components/WholeSaleList.vue';


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
        WholeSaleList,
        FooterView
    },
}
</script>


<style scoped>


FooterView {
    position: fixed;
    bottom: 0;
}

@media screen and (max-width: 768px) {
  /* Styles for tablet screens and smaller */
  .page {
    padding: 10px; /* Add padding for smaller screens */
  }
}

@media screen and (max-width: 480px) {
  /* Styles for mobile screens */
  .page {
    padding: 5px; /* Less padding for very small screens */
  }
}

</style>