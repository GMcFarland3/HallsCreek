import { createStore as _createStore } from 'vuex';
import axios from 'axios';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},

      trees: [{
        tree_id: '',
        species_id: '',
        common_name: '',
        scientific_name: '',
        color: '',
        bloom_time: '',
        size_growth_habit: '',
        hardiness_zone: '',
        light_requirement: '',
        watering_needs: '',
        soil: '',
        leaf: '',
        special: '',
        lifespan: '',
        maintenance: '',
        uses: '',
        pest_disease: '',
        origin: ''
      }],

      beers: [
        {
          beer_Id: '',
          brew_Id: '',
          name: '',
          type: '',
          abv: '',
          description: '',
          image: '',
          status: ''
        }
      ],

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
      SET_BREWERIES(state, breweries) {
        state.breweries = breweries;
      },
      SET_BEERS(state, beers) {
        state.beers = beers;
      },
      SET_REVIEWS(state, reviews) {
        state.reviews = reviews;
      },
      SET_USERS(state, users) {
        state.users = users;
      },
      SET_BREWERSID(state, id) {
        state.brewersID = id;
      }
    },


  });
  return store;
}
