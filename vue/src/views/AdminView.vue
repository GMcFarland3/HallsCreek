<template>
<div class="page">
    <div>
        <header-view />
        <div class="mainview">
        <div class="addBrewery">
            <h3>Add Brewery</h3>
            <form @submit.prevent="addBrewery"> <!-- Call addBrewery on form submission -->
                <!-- <div>
                    <label for="breweryId">Brewery Id => </label>
                    <input type="number" id="breweryId" v-model="brewery.brew_id">
                </div> -->
                <div>
                    <label for="userId">User Id => </label>
                    <input type="number" id="userId" v-model="brewery.user_id" required>
                </div>
                <div>
                    <label for="breweryName">Brewery Name => </label>
                    <input type="text" id="breweryName" v-model="brewery.name" required>
                </div>
                <div class="submit">
                    <button type="submit">Add Brewery</button>
                </div>
            </form>
            <div class="completion-message" :class="{ 'show-message': showMessage }">
                {{ messageText }}
            </div>
        </div>
    </div>
    

    <div class="RegUsers">
        <h3>All Registered Users</h3>
        <ul>
            <li v-for="user in userList" :key="user.id" value="user">{{ user.username }} : {{ user.id }}</li>
        </ul>
    </div>
</div>


        <FooterView />
    </div>
</template>
<script>
import HeaderView from './HeaderView.vue';
import FooterView from './FooterView.vue';
import treesService from "../services/TreesService"
import UserService from "../services/UserService";

export default {
    data() {
        return {
            brewery: {
                brew_id: '',
                user_id: '',
                name: '',
                address: '',
                address2: '',
                city: '',
                state_abbr: '',
                zip_code: '',
                phone: '',
                website: '',
                history: '',
                operation_hours: '',
                image: ''
            },
            userList: [],
            selectedUserId: "",
            messageText: '', // Add selectedUserId data property
            showMessage: false, // Add a data property to control the completion message
        };
    },

    methods: {
        submitForm() {

            // Call addBrewery method when the form is submitted
            this.addBrewery();
        },

        addBrewery() {
            treesService
                .addBrewery(this.brewery)
                .then((response) => {
                    if (response.status == 201) {
                        this.showCompletionMessage("Brewery added successfully!");
                        // Show completion message on successful addition
                    }
                })
                .catch((error) => {
                    const response = error.response;
                    if (response.status === 401) {
                        // Handle error scenarios as needed
                        console.error("Error adding brewery:", error);
                    }
                });
        },

        showCompletionMessage(message) {
            this.showMessage = true;
            this.messageText = message;

            // Hide the message after 3 seconds (adjust duration as needed)
            setTimeout(() => {
                this.showMessage = false;
            }, 3000);
        }

    },
    components: {
        HeaderView,
        FooterView,
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
    },

};

</script>

<style scoped>
.page {
  /* background-image: url('../assets/img/homePage2.png'); */
  background-color:  cadetblue;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
}
.completion-message {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    color: gold;
    margin-top: 10px;
    text-align: center;
    font-weight: bold;
    font-size: 1.2rem;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(7, 7, 7, 0.9);
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    display: none;
}

.show-message {
    display: block;
}


button:hover {
    background-color: black;
    /* color: rgb(238, 211, 4); */
}

.addBrewery {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  /* Box shadow for a slight lift effect */
  box-shadow: darkorange 2px 2px 2px 2px;
  transition: transform 0.3s ease-in-out;

    padding: 2px 2px 15px 2px;
    margin: 10px 10px 10px 10px;
    width: 25%;
    margin-top: 50px;
}

.addBeer {
    border-style: groove;
    padding: 2px 2px 15px 2px;
    margin: 5px 0px 5px 0px;
}

.brewery-card:hover {
  transform: translateY(-5px); /* Add a slight lift on hover */
}

.RegUsers {
  background-color: white;
  border-radius: 8px;
  border: 1px solid darkorange;
  /* Box shadow for a slight lift effect */
  box-shadow: darkorange 2px 2px 2px 2px;
  transition: transform 0.3s ease-in-out;

    padding: 2px 2px 15px 2px;
    margin: 10px 10px 10px 10px;
    width: 25%;
    margin-bottom: 50px;
    margin-top: 10px;
}

.UpdateUsers {
    border-style: groove;
    padding: 2px 2px 15px 2px;
    margin: 5px 0px 5px 0px;
}

.DelUsers {
    border-style: groove;
    padding: 2px 2px 15px 2px;
    margin: 5px 0px 5px 0px;
}

h3 {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    margin-left: 10px;
    padding-left: 10px;
}

label {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: inline-block;
    text-align: left;
    padding-left: 5px;
    width: 180px;
}

input {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    padding-left: 5px;
    width: 400px;
}

select {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    padding-left: 5px;
    width: 400px;
}

option {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    padding-left: 5px;
    width: 400px;
}

button {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-decoration: none;
    color: white;
    margin-right: 20px;
    transition: color 0.3s;
    border: 1px solid gray;
    padding: 8px 15px;
    border-radius: 5px;
    background-color: darkorange;
}
</style>../services/TreesService