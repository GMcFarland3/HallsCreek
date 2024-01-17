package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {

    List<Review> getReviewsByUserId(int user_id);

    List<Review> getReviewsByBrewId(int brew_id);

    List<Review> getReviewsByBeerId(int beer_id);

    Review createReview(Review review);

    List<Review> listReviews();


}
