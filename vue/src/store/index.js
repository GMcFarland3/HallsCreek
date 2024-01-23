import { createStore as _createStore } from 'vuex';
import axios from 'axios';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},

      trees: [{
        treeid: '',
        speciesid: '',
        commonName: '',
        image: '',
      }],

      species: [ {
        speciesId:'',
        scientificName:'',
        price1:'',
        size1:'',
        price2:'',
        size2:'',
        price3:'',
        size3:'',
        price4:'',
        size4:'',
        price5:'',
        size5:'',
        price6:'',
        size6:'',
      }],

      reviews: [
        {
          user_id: '',
          brew_id: '',
          beer_id: '',
          beerName: '',
          review: '',
          rating: '',
          favorite: '',
          liked: '',
          image: '',
          name: '',
        }
      ],

      users: [
        {
          user_Id: '',
          first_name: '',
          last_name: '',
          email: '',
          password: '',
          image: '',
          role: '',
          status: ''
        }
      ]

    },
    mutations: {
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
        state.brewersID = 0;
      },
      SET_TREES(state, trees) {
        state.trees = trees;
      },
      SET_SPECIES(state, species) {
        state.species = species;
      },
      SET_REVIEWS(state, reviews) {
        state.reviews = reviews;
      },
      SET_USERS(state, users) {
        state.users = users;
      },
    },
  });
  return store;
}
