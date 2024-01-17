import axios from 'axios';

export default {

    getUsers() {
        return axios.get('/users')
    },

    updateUser(id) {
        return axios.put('/user/:id', id)
    },

    deleteUser(id) {
        return axios.delete('/user/:id', id)
    },


}