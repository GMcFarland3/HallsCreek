package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BrewDao;
import com.techelevator.dao.ReviewDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@CrossOrigin
@RestController
@PreAuthorize("isAuthenticated()")
public class BreweryController {

    private final BrewDao brewDao;
    private final UserDao userDao;
    private final BeerDao beerDao;
    private final ReviewDao reviewDao;

    @Autowired
    public BreweryController(BrewDao brewDao, UserDao userDao, BeerDao beerDao, ReviewDao reviewDao) {
        this.brewDao = brewDao;
        this.userDao = userDao;
        this.beerDao = beerDao;
        this.reviewDao = reviewDao;
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/breweries/{id}", method = RequestMethod.GET)
    public Brewery getBreweryById(@PathVariable int id, Principal principal) {
        Brewery newBrewery = this.brewDao.getBreweryById(id);
        return newBrewery;
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/reviews/user/{id}", method = RequestMethod.GET)
    public List<Review> getReviewsByUserId(@PathVariable int id, Principal principal) {
        return this.reviewDao.getReviewsByUserId(id);
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/reviews/brew/{id}", method = RequestMethod.GET)
    public List<Review> getReviewsByBrewId(@PathVariable int id, Principal principal) {
        return this.reviewDao.getReviewsByBrewId(id);
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/reviews/beer/{id}", method = RequestMethod.GET)
    public List<Review> getReviewsByBeerId(@PathVariable int id, Principal principal) {
        return this.reviewDao.getReviewsByBeerId(id);
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addReview", method = RequestMethod.POST)
    public Review createReview(@Valid @RequestBody Review review) {
        try {
            return reviewDao.createReview(review);
        } catch (ResponseStatusException rse) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, rse.getMessage());
        }
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addBeer", method = RequestMethod.POST)
    public Beer addBeers(@Valid @RequestBody Beer beer) {
        try {
            return beerDao.addBeer(beer);
        } catch (ResponseStatusException rse) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, rse.getMessage());
        }
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/beer/{id}", method = RequestMethod.PUT)
    public void updateBeers(@Valid @RequestBody Beer beer,@PathVariable int id) {
        try {
             beerDao.updateBeer(beer,id);
        } catch (ResponseStatusException rse) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, rse.getMessage());
        }

    }
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addBrewery", method = RequestMethod.POST)
    public Brewery addBrewery(@Valid @RequestBody Brewery brewery) {
        try {
            return brewDao.createBrewery(brewery);
        } catch (ResponseStatusException rse) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, rse.getMessage());
        }
    }
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/admin/brewery/update/{id}", method = RequestMethod.PUT)
    public void updateBrewery(@Valid @RequestBody Brewery brewery, @PathVariable int id) {
        try {
            brewDao.updateBrewery(brewery, id);
        } catch (ResponseStatusException rse) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, rse.getMessage());
        }
    }
}