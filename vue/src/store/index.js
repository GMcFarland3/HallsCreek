import { createStore as _createStore } from 'vuex';
import axios from 'axios';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},

      trees: [{
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

      species: [ {
        speciesId: '',
        commonName: '',
        scientificName: '',
        color: '',
        bloomTime: '',
        sizeGrowthHabit: ''
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
        state.beers = species;
      },
      SET_REVIEWS(state, reviews) {
        state.reviews = reviews;
      },
      SET_USERS(state, users) {
        state.users = users;
      },
    },
    actions: {
      fetchTrees({commit}) {
        axios.get('/trees')
            .then(response => {
              commit('SET_TREES', response.data);
            })
            .catch(error => {
              console.error('Error fetching trees:', error);
            });
      },
    }
  });
  return store;
}
