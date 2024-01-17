import axios from 'axios';

export default {

    // Open API calls for non-login users can view
    getBreweries() {
        return axios.get('/breweries')
    },
    getBeers() {
        return axios.get('/beers')
    },
    getReviews() {
        return axios.get('/reviews')
    },

    // Must be login and have permissions 
    insertReview(review) {
        return axios.post('/addReview', review)
    },
    insertBeer(beer) {
        return axios.post('/addBeer', beer)
    },
    addBrewery(brewery) {
        return axios.post('/addBrewery', brewery)
    },
    updateBeer(upBeers, id) {
        return axios.put(`/beer/${upBeers.beer_Id}`, upBeers, id)


    },
    updateBrewery(brewery, id) {
        return axios.put(`/admin/brewery/update/${brewery.brew_id}`, brewery, id)
    }

}
