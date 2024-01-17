package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {
   List<Beer> listBeers();
   Beer addBeer(Beer beer);

   void updateBeer(Beer beer,int id);
}