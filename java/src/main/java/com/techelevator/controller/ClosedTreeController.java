package com.techelevator.controller;

import com.techelevator.dao.TreeDao;
import com.techelevator.dao.SpeciesDao;
import com.techelevator.model.Tree;
import com.techelevator.model.Species;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import javax.validation.Valid;

@CrossOrigin
@RestController
@PreAuthorize("isAuthenticated()")
public class ClosedTreeController {

    private final TreeDao treeDao;
    private final SpeciesDao speciesDao;

    @Autowired
    public ClosedTreeController(TreeDao treeDao, SpeciesDao speciesDao) {
        this.treeDao = treeDao;
        this.speciesDao = speciesDao;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/addtree")
    @PreAuthorize("hasRole('ADMIN')")
    public void addTree(@Valid @RequestBody Tree tree) {
        try {
            treeDao.addTree(tree);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/trees/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public void updateTree(@Valid @RequestBody Tree tree, @PathVariable int id) {
        try {
            treeDao.updateTree(tree, id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/trees/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public void deleteTree(@PathVariable int id) {
        try {
            treeDao.deleteTree(id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/trees/{id}")
    public Tree getTreeById(@PathVariable int id) {
        try {
            return treeDao.getTreeById(id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Tree not found", e);
        }
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/addspecies")
    @PreAuthorize("hasRole('ADMIN')")
    public void addSpecies(@Valid @RequestBody Species species) {
        try {
            speciesDao.addSpecies(species);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/species/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public void updateSpecies(@Valid @RequestBody Species species, @PathVariable int id) {
        try {
            speciesDao.updateSpecies(species, id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/species/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public void deleteSpecies(@PathVariable int id) {
        try {
            speciesDao.deleteSpecies(id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/species/{id}")
    public Species getSpeciesById(@PathVariable int id) {
        try {
            return speciesDao.getSpeciesById(id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Species not found", e);
        }
    }

}


