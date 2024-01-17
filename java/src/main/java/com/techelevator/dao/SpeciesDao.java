package com.techelevator.dao;

import com.techelevator.model.Species;
import java.util.List;

public interface SpeciesDao {
    List<Species> listSpecies();
    void addSpecies(Species species);
    void updateSpecies(Species species, int speciesId);
    void deleteSpecies(int speciesId);
    Species getSpeciesById(int id);
}


