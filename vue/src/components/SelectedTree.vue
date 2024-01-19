<template>
    <div>
      <section class="tree-list">
        <div><h1>Selected Tree</h1></div>
        <!-- <div v-for="tree in filterTree(this.treeId)" :key="tree.treeId" class="tree-card">
          <div class="tree-image-container">
            <img :src="tree.image" alt="tree" class="tree-image" />
          </div>
          <div class="tree-info">
            <h3>{{ tree.commonName }}</h3>
            <div id="description">{{ tree.scientificName }}</div>
            <div id="subset">
              <div class="details">[Leaf] {{ tree.leaf }}</div>
              <div class="spacer"></div>
              <div class="details">[Expected life] {{ tree.lifespan }}</div>
              <div class="spacer"></div>
              <div class="details">[Uses] {{ tree.uses }}</div>
            </div>
            <div class="topspacer"></div>
            <div class="details">{{ tree.sizeGrowthHabit }}</div>
            <div class="topspacer"></div>
            <div id="subset">
              <div class="details">[Color] {{ tree.color }}</div>
              <div class="spacer"></div>
              <div class="details">[Bloom time] {{ tree.bloomTime }}</div>
              <div class="spacer"></div>
              <div class="details">[Sun] {{ tree.lightRequirement }}</div>
            </div>
            <div class="topspacer"></div>
            <div class="details">{{ tree.pestDisease }}</div>
            <div class="topspacer"></div>
            <div id="subset">
              <div class="details">[Watering] {{ tree.wateringNeeds }}</div>
              <div class="spacer"></div>
              <div class="details">Zone {{ tree.hardinessZone }} of {{ tree.origin }}</div>
              <div class="spacer"></div>
              <div class="details">[Soil] {{ tree.soil }}</div>
            </div>
        </div> -->
      </section>
    </div>
  </template>
  
  <script>
  
  export default {
    computed: {
          filterTree(treeId) {
            var id = parseInt(treeId);
            return this.$store.state.trees.filter(tree => tree.treeId == id);
          },
      },
      props: {
        treeId: {
            type: Number,
            required: true
        }
     },
  
  };
  </script>
  <style scoped>
  
  h1 {
    font-family: 'IM Fell English', serif;
    text-align: left;
    color: rgb(95, 136, 118);
    font-size: 3rem;
    background-color: rgb(173, 160, 116);
    border-top-right-radius: 75px;
    border-bottom-right-radius: 75px;
    box-shadow: 10px 10px 2px 1px rgb(204, 204, 204);
    margin-bottom: 2rem;
    margin-top: 1rem;
    margin-left: 1rem;
    padding-right: 4rem;
    padding-left: 2rem;
    width: 20rem;
  }
  
  .tree-list {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    gap: 20px;
    background-color: rgb(95, 136, 118);
  }
  
  .tree-card {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    border: 1px solid #080808;
    padding: 10px;
    width: 90rem;
    height: 400px;
    display: flex;
    flex-direction: row;
    align-items: center;
    text-align: center;
    margin-left: 1rem;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
      0px 0px 10px rgb(173, 160, 116);
  }
  
  .tree-image-container {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    margin-bottom: 10px;
    /* width: 100%; */
    width: 300px;
    height: 300px;
  }
  
  .tree-image {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    /* max-width: 100%;
    height: auto;
    width: 100%; */
    width: 300px;
    height: 300px;
  }
  
  .tree-info {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    flex-grow: 3;
    color: white;
    margin-left: 1rem;
  }
  
  h3 {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    margin-top: 0;
    padding-top: 0;
    padding-bottom: 0.25rem;
    margin-bottom: 0.25rem;
    color: white;
    font-weight: bold;
    font-size: 2.5rem;
  }
  
  #description {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-weight: 1.25rem;
    margin-bottom: 0.5rem;
    padding-bottom: 0.5rem;
    color: white;
    border-style: solid;
    border-width: 1px;
    border-left: rgb(95, 136, 118);
    border-top: rgb(95, 136, 118);
    border-right: rgb(95, 136, 118);
  }
  
  #subset {
    display: flex;
    flex-direction: row;
    margin-left: 0.5rem;
    margin-right: 0.5rem;
    justify-content: space-evenly;
    text-align: center;
  }
  
  #stock {
    margin-top: 1rem;
    font-weight: bold;
    font-size: 1rem;
  }
  
  .spacer {
    border-style: solid;
    border-width: 1px;
    border-bottom: rgb(95, 136, 118);
    border-top: rgb(95, 136, 118);
    border-right: rgb(95, 136, 118);
  }
  
  .topspacer {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border-style: solid;
    border-width: 1px;
    border-bottom: rgb(95, 136, 118);
    border-left: rgb(95, 136, 118);
    border-right: rgb(95, 136, 118);
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
      background-color: rgb(173, 160, 116);
      margin: 0px 0px 0px 0px;
  }
  
  .nav-link:hover {
      color: rgb(12, 12, 12);
      background-color: rgb(173, 160, 116);
      /* Change text color on hover */
      /* Add additional styling for the hover effect, e.g., background color change */
  }
  </style>