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
    },
    addSpecies(speciesData) {
        return axios.post('/addspecies', speciesData)
    },
    deleteTree(treeId) {
        return axios.delete(`/trees/${treeId}`);
    },
    deleteSpecies(speciesId) {
        return axios.delete(`/species/${speciesId}`);
    },


}
