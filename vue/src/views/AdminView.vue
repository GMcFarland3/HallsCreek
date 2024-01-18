<template>
  <div class="header">
  <header-view />
  </div>


<div class="page">
  <div class="content-container">
  <div class="newtree">
    <form @submit.prevent="submitTree">

      <label for="speciesId">speciesId:</label>
      <input id="speciesId" v-model="newTree.speciesId" required>

      <label for="commonName">Common Name:</label>
      <input id="commonName" v-model="newTree.commonName" required>

      <label for="scientificName">Scientific Name:</label>
      <input id="scientificName" v-model="newTree.scientificName" required>

      <label for="color">Color:</label>
      <input id="color" v-model="newTree.color">

      <label for="bloomTime">Bloom Time:</label>
      <input id="bloomTime" v-model="newTree.bloomTime">

      <label for="sizeGrowthHabit">Size and Growth Habit:</label>
      <input id="sizeGrowthHabit" v-model="newTree.sizeGrowthHabit">

      <label for="hardinessZone">Hardiness Zone:</label>
      <input id="hardinessZone" v-model="newTree.hardinessZone">

      <label for="lightRequirement">Light Requirement:</label>
      <input id="lightRequirement" v-model="newTree.lightRequirement">

      <label for="wateringNeeds">Watering Needs:</label>
      <input id="wateringNeeds" v-model="newTree.wateringNeeds">

      <label for="soil">Soil:</label>
      <input id="soil" v-model="newTree.soil">

      <label for="leaf">Leaf:</label>
      <input id="leaf" v-model="newTree.leaf">

      <label for="special">Special Features:</label>
      <input id="special" v-model="newTree.special">

      <label for="lifespan">Lifespan:</label>
      <input id="lifespan" v-model="newTree.lifespan">

      <label for="maintenance">Maintenance:</label>
      <input id="maintenance" v-model="newTree.maintenance">

      <label for="uses">Uses:</label>
      <input id="uses" v-model="newTree.uses">

      <label for="pestDisease">Pests/Diseases:</label>
      <input id="pestDisease" v-model="newTree.pestDisease">

      <label for="origin">Origin:</label>
      <input id="origin" v-model="newTree.origin">

      <label for="image">Image URL:</label>
      <input type="url" id="image" v-model="newTree.image">

      <button type="submit">Add Tree</button>
    </form>
  </div>

    <div class="RegUsers">
        <h3>All Registered Users</h3>
        <ul>
            <li v-for="user in userList" :key="user.id" value="user">{{ user.username }} : {{ user.id }}</li>
        </ul>
    </div>
    <div class="Species">
        <h3>All Species</h3>
        <ul>
            <li v-for="species in speciesList" :key="species.id" value="species">{{ species.commonName }} : {{ species.speciesId }}</li>
        </ul>
  </div>
  </div>
</div>


  <div class="footer">
        <FooterView />
    </div>
</template>
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import UserService from "../services/UserService";
import TreesService from "../services/TreesService";

export default {
  data() {
    return {
      newTree: [{
        treeId: '',
        speciesId: '',
        commonName: '',
        scientificName: '',
        color: '',
        bloomTime: '',
        sizeGrowthHabit: '',
        hardinessZone: '',
        lightRequirement: '',
        wateringNeeds: '',
        soil: '',
        leaf: '',
        special: '',
        lifespan: '',
        maintenance: '',
        uses: '',
        pestDisease: '',
        origin: '',
        image: ''
      }],
      userList: [],
      speciesList: [],
      selectedUserId: "",
      messageText: '', // Add selectedUserId data property
      showMessage: false, // Add a data property to control the completion message
    };
  },
  components: {
    HeaderView,
    FooterView
  },

  methods: {
    submitTree() {
      TreesService.addTree(this.newTree)
          .then(response => {
            if (response.status === 200 || response.status === 201) {
              console.log('Tree added successfully:', response.data);
              this.newTree = {};
            } else {
              console.warn('Tree added, but status code is unexpected:', response.status);
            }
          })
          .catch(error => {
            console.error('Error adding tree:', error);
          });
    }
  },

    created() {
      UserService
          .getUsers()
          .then((response) => {
            console.log("API Response:", response.data); // Log the response data
            if (response.status == 200) {
              this.userList = response.data;
              console.log("User List:", this.userList); // Log the user list
              this.$store.commit("SET_USERS", response.data);
            }
          })
          .catch((error) => {
            console.error("Error fetching users:", error);
          });

      TreesService
          .getSpecies()
          .then((response) => {
            console.log("API Response:", response.data); // Log the response data
            if (response.status == 200) {
              this.speciesList = response.data;
              console.log("Species List:", this.speciesList); // Log the species list
              this.$store.commit("SET_SPECIES", response.data);
            }
          })
          .catch((error) => {
            console.error("Error fetching species:", error);
          });
    },
  };

</script>

<style scoped>

.page {
  background-image: url("../assets/img/admin.JPG");
  background-repeat: no-repeat;
  background-size: cover;
}

.content-container {
  display: flex;
  justify-content: space-around;
  padding: 20px;
}

.newtree {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  box-shadow: darkorange 2px 2px 2px 2px;
  padding: 2px 2px 15px 2px;
  width: 20rem; /* Adjust the width as needed */
  height: auto;
  margin-bottom: 50px;
}

.RegUsers, .Species {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  box-shadow: darkorange 2px 2px 2px 2px;
  padding: 2px 2px 15px 2px;
  width: auto; /* Adjust the width as needed */
  height: auto;
  margin-bottom: 50px;
}

h3, label {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

input {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  width: 100%;
}


</style>