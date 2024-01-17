package com.techelevator.controller;

import com.techelevator.dao.TreeDao;
import com.techelevator.dao.SpeciesDao;
import com.techelevator.model.Tree;
import com.techelevator.model.Species;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@CrossOrigin
@RestController
public class OpenTreeController {

    private final TreeDao treeDao;
    private final SpeciesDao speciesDao;

    @Autowired
    public OpenTreeController(TreeDao treeDao, SpeciesDao speciesDao) {
        this.treeDao = treeDao;
        this.speciesDao = speciesDao;
    }

    // CRUD operations for Trees
    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/trees")
    public List<Tree> listTrees() {
        try {
            return treeDao.listTrees();
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Error fetching tree list", e);
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/species")
    public List<Species> listSpecies() {
        try {
            return speciesDao.listSpecies();
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Error fetching species list", e);
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/treesWithSpecies")
    public List<Tree> getAllTreesWithSpecies() {
        try {
            return treeDao.getAllTreesWithSpecies();
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Error fetching trees with species", e);
        }
    }

}
