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

      <label for="Wholesale1">Wholesale Price 1:</label>
      <input id="Wholesale1" v-model="newSpecies.Wholesale1">

      <label for="price2">Price 2:</label>
      <input id="price2" v-model="newSpecies.price2">

      <label for="size2">Size 2:</label>
      <input id="size2" v-model="newSpecies.size2">

      <label for="Wholesale2">Wholesale Price 2:</label>
      <input id="Wholesale2" v-model="newSpecies.Wholesale2">

      <label for="price3">Price 3:</label>
      <input id="price3" v-model="newSpecies.price3">

      <label for="size3">Size 3:</label>
      <input id="size3" v-model="newSpecies.size3">

      <label for="Wholesale3">Wholesale Price 3:</label>
      <input id="Wholesale3" v-model="newSpecies.Wholesale3">

      <label for="price4">Price 4:</label>
      <input id="price4" v-model="newSpecies.price4">

      <label for="size4">Size 4:</label>
      <input id="size4" v-model="newSpecies.size4">

      <label for="Wholesale4">Wholesale Price 4:</label>
      <input id="Wholesale4" v-model="newSpecies.Wholesale4">

      <label for="price5">Price 5:</label>
      <input id="price5" v-model="newSpecies.price5">

      <label for="size5">Size 5:</label>
      <input id="size5" v-model="newSpecies.size5">

      <label for="Wholesale5">Wholesale Price 5:</label>
      <input id="Wholesale5" v-model="newSpecies.Wholesale5">

      <label for="price6">Price 6:</label>
      <input id="price6" v-model="newSpecies.price6">

      <label for="size6">Size 6:</label>
      <input id="size6" v-model="newSpecies.size6">

      <label for="Wholesale6">Wholesale Price 6:</label>
      <input id="Wholesale6" v-model="newSpecies.Wholesale6">

      <button type="submit">Add Species</button>
    </form>
  </div>

    <div class="deleteTree">
    <form @submit.prevent="deleteTree">

      <label for="treeId">Tree ID:</label>
      <input id="treeId" v-model="newTree.treeId" required>

      <button type="submit">Delete Tree</button>
    </form>
  </div>

    <div class="deleteSpecies">
    <form @submit.prevent="deleteSpecies">

      <label for="speciesId">Species ID:</label>
      <input id="speciesId" v-model="newSpecies.speciesId" required>

      <button type="submit">Delete Species</button>
    </form>
  </div>


<!--    here is the message-->
    <div v-if="successMessage" class="success-message">
      {{ successMessage }}
    </div>

    <div v-if="errorMessage" class="error-message">
      {{ errorMessage }}
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
        <h3>All Trees Tree(ID) Species(ID) </h3>
          <li v-for="tree in treesList" :key="tree.id" value="tree">{{ tree.commonName }} : TreeID {{ tree.treeid }} > SpeciesID {{tree.speciesId}}</li>
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
        Wholesale1: '',
        price2: '',
        size2: '',
        Wholesale2: '',
        price3: '',
        size3: '',
        Wholesale3: '',
        price4: '',
        size4: '',
        Wholesale4: '',
        price5: '',
        size5: '',
        Wholesale5: '',
        price6: '',
        size6: '',
        Wholesale6: '',

      },


      errorMessage: '',
      successMessage: '', // New property for success message

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
    handleFormSubmission(serviceMethod, data, successMsg, errorMsg) {
      serviceMethod(data)
          .then(response => {
            if (response.status === 201 || response.status === 204) {
              this.successMessage = successMsg;
              setTimeout(() => {
                this.successMessage = '';
                this.refreshData();
              }, 2000);
            } else {
              console.warn(`Unexpected status code: ${response.status}`);
              this.errorMessage = errorMsg;
            }
          })
          .catch(error => {
            console.error('Error:', error);
            this.errorMessage = errorMsg;
            setTimeout(() => {
              this.errorMessage = '';
              this.refreshData();
            }, 2000);
          });
    },

    submitTree() {
      this.handleFormSubmission(TreesService.addTree, this.newTree, 'Tree added successfully', 'Error adding tree');
      this.newTree = {}; // Reset the tree form
    },

    submitSpecies() {
      this.handleFormSubmission(TreesService.addSpecies, this.newSpecies, 'Species added successfully', 'Error adding species');
      this.newSpecies = {}; // Reset the species form
    },

    deleteTree() {
      const treeId = this.newTree.treeId;
      if (!treeId) {
        console.error('Tree ID is required');
        return;
      }
      this.handleFormSubmission(TreesService.deleteTree, treeId, 'Tree deleted successfully', 'Error deleting tree');
      this.newTree = {}; // Reset the tree form
    },

    deleteSpecies() {
      const speciesId = this.newSpecies.speciesId;
      if (!speciesId) {
        console.error('Species ID Must be empty');
        return;
      }
      this.handleFormSubmission(TreesService.deleteSpecies, speciesId, 'Species deleted successfully', 'Error deleting species. Ensure all associated trees are deleted first.');
      this.newSpecies = {}; // Reset the species form
    },

    refreshData() {
      this.fetchUsers();
      this.fetchSpecies();
      this.fetchTrees();
    },

    fetchUsers() {
      UserService.getUsers()
          .then(response => {
            if (response.status === 200) {
              this.userList = response.data;
            }
          })
          .catch(error => console.error("Error fetching users:", error));
    },

    fetchSpecies() {
      TreesService.getSpecies()
          .then(response => {
            if (response.status === 200) {
              this.speciesList = response.data;
            }
          })
          .catch(error => console.error("Error fetching species:", error));
    },

    fetchTrees() {
      TreesService.getTrees()
          .then(response => {
            if (response.status === 200) {
              this.treesList = response.data;
            }
          })
          .catch(error => console.error("Error fetching trees:", error));
    },
  },

  created() {
    this.refreshData();
  },
};

</script>

<style scoped>

.success-message, .error-message {
  display: flex;
  justify-content: center;
  align-items: center;
 box-shadow: 7px 7px 7px 7px #800000;
  color: #ffffff;
  background-color: maroon;
  max-height: 5rem;
}

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

.newspecies {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  box-shadow: darkorange 2px 2px 2px 2px;
  padding: 2px 2px 15px 2px;
  width: 20rem; /* Adjust the width as needed */
  height: auto;
  margin-bottom: 50px;
}

.newtree {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  box-shadow: darkorange 2px 2px 2px 2px;
  padding: 2px 2px 15px 2px;
  width: 15rem; /* Adjust the width as needed */
  height: 9rem;
  margin-bottom: 50px;
}

.Species {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  box-shadow: darkorange 2px 2px 2px 2px;
  padding: 2px 2px 15px 2px;
  width: auto; /* Adjust the width as needed */
  height: auto;
  margin-bottom: 50px;
}

.RegUsers {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  box-shadow: darkorange 2px 2px 2px 2px;
  padding: 2px 2px 15px 2px;
  width: auto; /* Adjust the width as needed */
  height: 15rem;
  margin-bottom: 50px;
}

h3, label {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

input {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  width: 100%;
}

@media screen and (max-width: 768px) {
  /* Styles for tablet screens */
  .newspecies, .newtree, .Species, .RegUsers {
    width: 90%; /* Adjust width for tablet screens */
  }
}

@media screen and (max-width: 480px) {
  /* Styles for mobile screens */
  h3, label {
    font-size: 1rem; /* Smaller font size for small screens */
  }

  .newspecies, .newtree, .Species, .RegUsers {
    width: 100%; /* Full width for very small screens */
  }
}


</style>