<template>
    <div id="return"><router-link :to="'/breweryInfo/' + this.updateBrew.brew_id">Return to brewery page</router-link></div>
    <div class="page">
        <div class="submitBeer">
            <h1>Add Beer</h1>
            <form @submit.prevent="submitBeer">
                <div class="submitBeername">
                    <label for="name">Beer name</label>
                    <input type="text" id="name" v-model="beer.name" maxlength="30" required>
                </div>
                <div class="submitBeertype">
                    <label for="type">Beer type</label>
                    <input type="text" id="beerType" v-model="beer.type" maxlength="25" required>
                </div>
                <div class="submitBeerdescription">
                    <label for="Description">Description</label>
                    <input type="text" id="Description" v-model="beer.description" maxlength="500" required>
                </div>
                <div class="submitBeerabv">
                    <label for="ABV">Beer abv</label>
                    <input type="text" id="beerAbv" v-model="beer.abv" maxlength="5" required>
                </div>
                <div class="submitBeerimage">
                    <label for="image">Beer image</label>
                    <input type="url" id="beerImage" v-model="beer.image" maxlength="500" required>
                </div>
                <button class="submitbeerbutton" type="submit">Submit Add Beer</button>
                <div class="completion-message" :class="{ 'show-message': showMessage }">
                    {{ messageText }}
                </div>
            </form>
        </div>

        <div class="updateBrewery">
            <h1>Update Brewery</h1>
            <form @submit.prevent="updateBrewery">
                <div class="breweryName">
                    <label for="updateBreweryName">Brewery name</label>
                    <input id="updateBreweryName" v-model="updateBrew.name" type="text" required>
                </div>
                <div class="breweryaddress">
                    <label for="updateBreweryAddress">Brewery address</label>
                    <input id="updateBreweryAddress" v-model="updateBrew.address" type="text" required>
                </div>
                <div class="breweryaddress2">
                    <label for="updateBreweryAddress2">Brewery address2</label>
                    <input id="updateBreweryAddress2" v-model="updateBrew.address2" type="text">
                </div>
                <div class="brewerycity">
                    <label for="updateBreweryCity">Brewery city</label>
                    <input id="updateBreweryCity" v-model="updateBrew.city" type="text" required>
                </div>
                <div class="breweryStateAbbr">
                    <label for="updateBreweryStateAbbr">Brewery StateAbbr</label>
                    <input id="updateBreweryStateAbbr" v-model="updateBrew.state_abbr" type="text" required>
                </div>
                <div class="zipCode">
                    <label for="updateBreweryZipCode">Brewery zipCode</label>
                    <input id="updateBreweryZipCode" v-model="updateBrew.zip_code" type="text" required>
                </div>
                <div class="Phone">
                    <label for="updateBreweryPhone">Phone</label>
                    <input id="updateBreweryPhone" v-model="updateBrew.phone" type="text">
                </div>
                <div class="website">
                    <label for="updateBreweryWebsite">Website</label>
                    <input id="updateBreweryWebsite" v-model="updateBrew.website" type="text">
                </div>
                <div class="history">
                    <label for="updateBreweryHistory">History</label>
                    <input id="updateBreweryHistory" v-model="updateBrew.history" type="text">
                </div>
                <div class="operationhours">
                    <label for="updateBreweryOperationHours">Operation Hours</label>
                    <input id="updateBreweryOperationHours" v-model="updateBrew.operation_hours" type="text">
                </div>
                <div class="breweryImg">
                    <label for="updateBreweryImage">Brewery Image</label>
                    <input id="updateBreweryImage" v-model="updateBrew.image" type="url">
                </div>
                <div class="completion-message" :class="{ 'show-message': showMessage }">
                    {{ messageText }}
                </div>
                <button class="brewerybutton" type="submit">Submit Brewery</button>
            </form>
        </div>


        <div class="updateBeer">
            <h1>Update Beer</h1>
            <form @submit.prevent="updateBeer">
                <div class="beers">
                    <label for="beerList">Select a Beer if updating</label>
                    <select id="beerList" v-model="upBeers">
                        <option v-for="beer in filteredBeers" :key="beer.beerId" :value="beer">
                            {{ beer.name }}</option>
                    </select>
                </div>
                <!-- <div class="updatebeername">
                    <label for="name">Beer name</label>
                    <input type="text" id="name" v-model="upBeers.name" maxlength="30" required>
                </div> -->
                <div class="updatebeertype">
                    <label for="type">Beer type</label>
                    <input type="text" id="beerType" v-model="upBeers.type" maxlength="25" required>

                </div>
                <div class="updatebeerdescription">
                    <label for="Description">Description</label>
                    <input type="text" id="Description" v-model="upBeers.description" maxlength="500" required>
                </div>
                <div class="updatebeerabv">
                    <label for="ABV">Beer abv</label>
                    <input type="text" id="beerAbv" v-model="upBeers.abv" maxlength="5" required>
                </div>
                <div class="updatebeerimage">
                    <label for="image">Beer image</label>
                    <input type="url" id="beerImage" v-model="upBeers.image" maxlength="500">
                </div>
                <div class="updatebeeroutofstock">
                    <label for="status">Out of stock</label>
                    <select id="status" v-model="upBeers.status">
                        <option :key="true" :value="true">True</option>
                        <option :key="false" :value="false">False</option>
                    </select>
                </div>
                <button class="beerbutton" type="submit">Submit Beer</button>
                <div class="completion-message" :class="{ 'show-message': showMessage }">
                    {{ messageText }}
                </div>
            </form>
        </div>
    </div>
</template>

<script>
<<<<<<< HEAD
import treesService from "../services/TreesService"
=======

>>>>>>> a9fe8987cadf65cd26f7ba0e15dc322bc9b789e5
export default {
    props: ['brewery'],

    data() {
        return {
            updateBrew: {
                brew_id: 0,
                user_id: 0,
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

            beer: {
                beer_Id: 0,
                brewId: 0,
                name: '',
                type: '',
                abv: '',
                description: '',
                image: '',
                status: ''
            },
            upBeers: {
                beer_Id: 0,
                brewId: 0,
                name: '',
                type: '',
                abv: '',
                description: '',
                image: '',
                status: ''
            },
            showMessage: false,
            messageText: '',
            beersList: [],
        }
    },

    created() {
        this.updateBrew = { ...this.brewery };
        this.beersList = this.$store.state.beers;
    },

    computed: {
        filteredBeers() {
            return this.beersList.filter(beer => beer.brewId == this.brewery.brew_id);
        },
    },

    methods: {
        submitBeer() {
            this.beer.brewId = this.brewery.brew_id;
            treesService
                .insertBeer(this.beer)
                .then(response => {
                    if (response.status === 201) {
                        this.beersList.push(response.data);
                        this.showCompletionMessage("Beer added successfully!");

                    }
                })
                .catch(error => {
                    console.error('Error submitting beer:', error);
                });
        },

        updateBrewery() {

            this.updateBrew.brew_id = this.brewery.brew_id;
            treesService
                .updateBrewery(this.updateBrew)
                .then(response => {
                    if (response.status === 201) {
                        this.showCompletionMessage("Brewery updated successfully!");
                        this.updateBrew = response.data; // Assigning the updated data to updateBrew

                    }
                })
                .catch(error => {
                    console.error('Error updating brewery:', error);
                });
        },

        updateBeer() {
            this.upBeers.brewId = this.brewery.brew_id;
            if (this.upBeers.brewId > 0) {
                this.upBeers.brewId = this.brewery.brew_id;
                treesService
                    .updateBeer(this.upBeers)
                    .then(response => {
                        if (response.status === 201) {
                            this.showCompletionMessage("Beer updated successfully!");
                            this.upBeers.brewId = 0;
                            this.upBeers.name = '';
                            this.upBeers.type = '';
                            this.upBeers.description = '';
                            this.upBeers.abv = '';
                            this.upBeers.image = '';
                            this.upBeers.status = false;

                        }
                    })
                    .catch(error => {
                        console.error('Error updating brewery:', error);
                    });
            } else {
                treesService
                    .insertBeer(this.upBeers)
                    .then(response => {
                        if (response.status === 201) {
                            this.beersList.push(response.data);
                        }
                    })
                    .catch(error => {
                        console.error('Error submitting beer:', error);
                    });
            }
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

}
</script>

<style scoped>
.beers {
    margin-bottom: 1rem;
}

#return {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 2rem;
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 2rem;
    margin-bottom: 2rem;
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
    background-color: rgba(17, 17, 17, 0.9);
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    display: none;
}

/* Show the completion message */
.show-message {
    display: block;
}

ul li {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    margin-top: 10px;
    text-align: center;
}

.submitbeerbutton {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
    font-size: 1.5rem;
    text-decoration: none;
    font-weight: bold;
    color: white;
    padding: 10px 20px;
    border-radius: 25px;
    transition: background-color 0.3s, color 0.3s;
    background-color: darkorange;
    margin: 0.5rem 1rem 0.5rem 1rem;
    width: 70%;
    margin-left: 3rem;
}

.beerbutton {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
    font-size: 1.5rem;
    text-decoration: none;
    font-weight: bold;
    color: white;
    padding: 10px 20px;
    border-radius: 25px;
    transition: background-color 0.3s, color 0.3s;
    background-color: darkorange;
    margin: 0.5rem 1rem 0.5rem 1rem;
    width: 70%;
    margin-left: 3rem;
}

.brewerybutton {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
    font-size: 1.5rem;
    text-decoration: none;
    font-weight: bold;
    color: white;
    padding: 10px 20px;
    border-radius: 25px;
    transition: background-color 0.3s, color 0.3s;
    background-color: darkorange;
    margin: 0.5rem 1rem 0.5rem 1rem;
    width: 70%;
    margin-left: 3rem;
}

button:hover {
    background-color: #333;
    transform: scale(1.1);
}

button:active {
    transform: scale(0.9);
}

form {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 50rem;
}

label {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: inline-block;
    padding-left: 5px;
    width: 40%;
}

input {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    width: 50%;
    height: 1.2rem;
    margin-bottom: 1rem;
}

.page {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    /* background-image: url('../assets/img/homePage2.png'); */
    background-color: cadetblue;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
    margin: 0;
    padding: 0;
    height: 1000px;
    display: flex;
    justify-content: center;
    justify-content: space-around;
    align-items: center;
}

.updateBeer {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 1rem auto;
    border-radius: 1rem;
    border: black solid 1px;
    box-shadow: darkorange 5px 5px 5px 10px;
    background-color: white;
    padding: 20px;
    width: 350px;
    height: 430px;
}

.updateBrewery {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 1rem auto;
    border-radius: 1rem;
    border: black solid 1px;
    box-shadow: darkorange 5px 5px 5px 10px;
    background-color: white;
    padding: 20px;
    width: 350px;
    height: 600px;
}

.submitBeer {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 1rem auto;
    border-radius: 1rem;
    border: black solid 1px;
    box-shadow: darkorange 5px 5px 5px 10px;
    background-color: white;
    padding: 20px;
    width: 350px;
    height: 350px;
}
</style>../services/TreesService