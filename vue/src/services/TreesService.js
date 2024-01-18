import axios from 'axios';

export default {

    // Open API calls for non-login users can view
    getTrees() {
        return axios.get('/trees')
    },
    getSpecies() {
        return axios.get('/species')
    },
    addTree(treeData) {
        return axios.post('/addtree', treeData)
    }

}
