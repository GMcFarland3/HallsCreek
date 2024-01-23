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

      <label for="image">Image URL:</label>
      <input type="url" id="image" v-model="newTree.image">

      <button type="submit">Add Tree</button>
    </form>
  </div>



  <div class="newspecies">
    <form @submit.prevent="submitSpecies">

      <label for="scientificName">Scientific Name:</label>
      <input id="scientificName" v-model="newSpecies.scientificName" required>

      <label for="price1">Price 1:</label>
      <input id="price1" v-model="newSpecies.price1">

      <label for="size1">Size 1:</label>
      <input id="size1" v-model="newSpecies.size1">

      <label for="price2">Price 2:</label>
      <input id="price2" v-model="newSpecies.price2">

      <label for="size2">Size 2:</label>
      <input id="size2" v-model="newSpecies.size2">

      <label for="price3">Price 3:</label>
      <input id="price3" v-model="newSpecies.price3">

      <label for="size3">Size 3:</label>
      <input id="size3" v-model="newSpecies.size3">

      <label for="price4">Price 4:</label>
      <input id="price4" v-model="newSpecies.price4">

      <label for="size4">Size 4:</label>
      <input id="size4" v-model="newSpecies.size4">

      <label for="price5">Price 5:</label>
      <input id="price5" v-model="newSpecies.price5">

      <label for="size5">Size 5:</label>
      <input id="size5" v-model="newSpecies.size5">

      <label for="price6">Price 6:</label>
      <input id="price6" v-model="newSpecies.price6">

      <label for="size6">Size 6:</label>
      <input id="size6" v-model="newSpecies.size6">

      <button type="submit">Add Species</button>
    </form>
  </div>



    <div class="RegUsers">
        <h3>All Registered Users</h3>
        <ul>
            <li v-for="user in userList" :key="user.id" value="user">{{ user.username }} : {{ user.id }}</li>
        </ul>
    </div>
    <div class="Species">
        <ul>
          <h3>All Species</h3>
            <li v-for="species in speciesList" :key="species.id" value="species">{{ species.scientificName }} : {{ species.speciesId }}</li>
        </ul>
      <ul>
        <h3>All Trees</h3>
          <li v-for="tree in treesList" :key="tree.id" value="tree">{{ tree.commonName }} : {{ tree.speciesId }}</li>
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
      newTree: {
        treeId: '',
        speciesId: '',
        commonName: '',
        image: '',
      },
      newSpecies: {
      scientificName: '',
        price1: '',
        size1: '',
        price2: '',
        size2: '',
        price3: '',
        size3: '',
        price4: '',
        size4: '',
        price5: '',
        size5: '',
        price6: '',
        size6: '',
      },

      userList: [],
      treesList: [],
      trees: [],
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
            if (response.status === 201) {
              console.log('Tree added successfully:', response.data);
              this.newTree = {}; // Reset the form
            } else {
              console.warn('Tree added, but status code is unexpected:', response.status);
            }
          })
          .catch(error => {
            console.error('Error adding tree:', error);
          });
    },

    submitSpecies() {
      TreesService.addSpecies(this.newSpecies)
          .then(response => {
            if (response.status === 201) {
              console.log('Species added successfully:', response.data);
              this.newSpecies = {}; // Reset the form
            } else {
              console.warn('Species added, but status code is unexpected:', response.status);
            }
          })
          .catch(error => {
            console.error('Error adding species:', error);
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

      TreesService
            .getTrees()
            .then((response) => {
              console.log("API Response:", response.data); // Log the response data
              if (response.status == 200) {
                this.treesList = response.data;
                console.log("Trees List:", this.treesList); // Log the trees list
                this.$store.commit("SET_TREES", response.data);
              }
            })
            .catch((error) => {
              console.error("Error fetching trees:", error);
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

.newtree, .newspecies {
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