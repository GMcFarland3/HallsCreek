package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.User;

import java.util.List;

public interface BrewDao {

    List<Brewery> listBreweries();

    Brewery createBrewery(Brewery brewery);

    Brewery getBreweryById(int breweryId);

    void updateBrewery(Brewery brewery, int id);

}
