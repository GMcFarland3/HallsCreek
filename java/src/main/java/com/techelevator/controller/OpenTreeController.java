package com.techelevator.controller;

import com.techelevator.dao.TreeDao;
import com.techelevator.dao.SpeciesDao;
import com.techelevator.model.Tree;
import com.techelevator.model.Species;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
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
        return treeDao.listTrees();
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/species")
    public List<Species> listSpecies() {
        return speciesDao.listSpecies();
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/treesWithSpecies")
    public List<Tree> getAllTreesWithSpecies() {
        return treeDao.getAllTreesWithSpecies();
    }

}
