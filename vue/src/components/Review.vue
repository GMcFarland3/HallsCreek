<template>
    <section>
        <div id="return"><router-link :to="'/breweryInfo/' + this.brew_id">Return to brewery page</router-link></div>
        <div class="leaveReview">
            <h1>Leave a Review</h1>
            <form @submit.prevent="submitReview">
                <div class="revinfo">
                    <label for="beerList">Beer => </label>
                    <select id="beerList" v-model="oneBeer" required>
                        <option v-for="beer in filteredBeers" :key="beer.beerId" :value="beer">
                            {{ beer.name }}</option>
                    </select>
                </div>
                <div class="revinfo">
                    <label for="rating">Rating => </label>
                    <select id="rating" v-model="review.rating" required>
                        <option value="">Select a rating</option>
                        <option value="1">1 star</option>
                        <option value="2">2 stars</option>
                        <option value="3">3 stars</option>
                        <option value="4">4 stars</option>
                        <option value="5">5 stars</option>
                    </select>
                </div>
                <div class="revinfo">
                    <label for="comment">Comment => </label>
                    <input type="src" id="comment" v-model="review.review" maxlength="500" required>
                </div>
                <div class="revinfo">
                    <label for="image">Image URL => </label>
                    <input type="src" id="image" v-model="photoUrl">
                </div>
                <div class="submit">
                    <button type="submit">Submit Review</button>
                </div>
                <div class="completion-message" :class="{ 'show-message': showMessage }">
                    {{ messageText }}
                </div>

            </form>
        </div>
        <div class="allReviews">
            <h1>Reviews</h1>
            <div class="review" v-for="(review, index) in filteredReviews" :key="index">
                <div class="reviewImage">
                    <img :src="review.image" alt="">
                </div>
                <div class="det">
                <div class="dets">
                    <div><h2>{{ review.name }}</h2></div>
                    <div class="spacer"></div>
                    <div><h3>{{ review.beerName }}</h3></div>
                    <div class="spacer"></div>
                    <div><span v-for="star in parseInt(review.rating)" :key="star">⭐</span></div>
                    <div class="spacer"></div>
                    <div><p>{{ review.review }}</p></div>
                </div>
                </div>
            </div>
        </div>
    </section>
</template>
  
<script>
import treesService from "../services/TreesService"

export default {
    data() {
        return {
            review: {
                user_id: '',      // You can set this later when you have user data
                brew_id: '',      // Will be populated with the brewery ID
                beer_id: '',      // Will be populated with the selected beer ID
                beerName: '',          // The user's name (if needed)
                rating: '',
                review: '',
                image: '',
            },
            reviews: [],
            beer: {
                beer_id: '',
                brewId: '',
                name: '',
                type: '',
                abv: '',
                description: '',
                image: '',
                status: ''
            },
            beersList: [],
            oneBeer: {
                beer_id: '',
                brewId: '',
                name: '',
                type: '',
                abv: '',
                description: '',
                image: '',
                status: ''
            },
            showMessage: false,
            messageText: '',
            photoUrl: '',
        };
    },
    props: {
        user_id: {
            type: Number,
            required: true
        },
        brew_id: {
            type: Number,
            required: false
        },
        beer_id: {
            type: Number,
            required: false
        },
    },

    computed: {
        filteredReviews() {
            return this.reviews.filter(review => review.beer_id == this.beer_id);
        },
        filteredBeers() {
            return this.beersList.filter(beer => beer.beer_Id == this.beer_id);
        },
    },

    created() {
        treesService
            .getReviews()
            .then(response => {
                if (response.status == 200) {
                    this.reviews = response.data;
                    this.$store.commit('SET_REVIEWS', response.data);
                }
            })
            .catch(error => {
                const response = error.response;
                if (response.status === 401) {
                    this.invalidCredentials = true;
                }
            });
        this.beersList = this.$store.state.beers;
    },

    methods: {
        submitReview() {
            if (this.user_id == 0 || this.user_id == null) {
                this.showCompletionMessage("You must be logged in to submit a review!");
                return;
            }
            this.review.user_id = this.user_id; // Set the user ID
            this.review.brew_id = this.brew_id; // Set the brewery ID
            this.review.beer_id = this.oneBeer.beer_Id; // Set the beer ID
            this.review.beerName = this.oneBeer.name; // Set the beer name
            this.review.image = this.photoUrl; // Set the beer image
            treesService
                .insertReview(this.review)
                .then(response => {
                    if (response.status === 201) {
                        this.reviews.push(response.data); // Add the new review to the local reviews array
                        this.showCompletionMessage("Review added successfully!");
                    }
                })
                .catch(error => {
                    console.error('Error submitting review:', error);
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

};
</script>
  

<style scoped>
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

#return {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 2rem;
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 2rem;
    margin-bottom: 2rem;
}

/* Show the completion message */
.show-message {
    display: block;
}

form {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    width: 50rem;
    height: 20rem;
    margin: auto;
    border-radius: 1rem;
    background-color: white;
    border: black solid 1px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
        /* Existing shadow */
        0px 0px 10px darkorange;
    /* Additional gold shadow */
    padding: 20px;
}

h1 {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 3rem;
    text-align: center;
    margin: 10px 0;
    color: darkorange;
}

h2 {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 3rem;
    text-align: center;
    margin: 10px 0;
    color: white;
}

.leaveReview {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.allReviews {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.spacer {
  border-style: solid;
  border-width: 1px;
}

.review {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: row;
    align-items: center;
    border-radius: 1rem;
    border: black solid 1px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1),
        0px 0px 10px darkorange;
    padding: 20px;
    margin-bottom: 1rem;
    width: 60rem;
}
.det {
    flex-grow: 3;
}

.dets {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: flex;
    flex-direction: column;
    text-align: center;
    color: white;
    margin-left: 1rem;
}

img {
    width: 15rem;
    height: 15rem;
    align-items: center;
    justify-content: center;
}

.revinfo {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    margin-bottom: 20px;
}

.submit {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    text-align: center;
    margin-top: 30px;
}

button {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    background-color: darkorange;
    border: 1 solid black;
    color: white;
    padding: 9px 12px;
    display: inline-block;
    font-size: 1.5rem;
    border-radius: 2rem;
}

/* Update label and input width and padding */
label {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    display: inline-block;
    text-align: left;
    width: 200px;
    font-size: 1.25rem;
}

select {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    width: 500px;
    font-size: 1.25rem;
}
input {
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    width: 500px;
    font-size: 1.25rem;
}
</style>
../services/TreesService