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

    <div class="RegUsers">
        <h3>All Registered Users</h3>
        <ul>
            <li v-for="user in userList" :key="user.id" value="user">{{ user.username }} : {{ user.id }}</li>
        </ul>
    </div>
    <div class="Species">
        <h3>All Species</h3>
        <ul>
            <li v-for="species in speciesList" :key="species.id" value="species">{{ species.scientificName }} : {{ species.speciesId }}</li>
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
        image: '',
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