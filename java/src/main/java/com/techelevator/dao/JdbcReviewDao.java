package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Review;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Review> getReviewsByUserId(int id) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image FROM public.reviews WHERE user_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while (results.next()) {
                Review review = mapRowToReview(results);
                reviews.add(review);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return reviews;
    }

//    @Override
//    public Review createReview(Review review) {
//        String sql = "INSERT INTO public.reviews(user_id, brew_id, beer_id, review, rating, favorite, liked) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING user_id;";
//        try {
//            int rowInserted = jdbcTemplate.queryForObject(sql, int.class, review.getUser_id(), review.getBrew_id(), review.getBeer_id(), review.getReview(), review.getRating(), review.isFavorite(), review.isLiked());
//         } catch (CannotGetJdbcConnectionException e) {
//            throw new DaoException("Unable to connect to server or database", e);
//        }
//        return review;

    @Override
    public Review createReview(Review review) {
        String sql = "INSERT INTO public.reviews(user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING user_id;";
        try {
            int rowInserted = jdbcTemplate.queryForObject(sql, int.class, review.getUser_id(), review.getBrew_id(), review.getBeer_id(), review.getBeerName(), review.getReview(), review.getRating(), review.isFavorite(), review.isLiked(), review.getImage());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return review;
    }


    @Override
    public List<Review> getReviewsByBrewId(int id) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image FROM public.reviews WHERE brew_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while (results.next()) {
                Review review = mapRowToReview(results);
                reviews.add(review);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return reviews;
    }


    @Override
    public List<Review> getReviewsByBeerId(int id) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT user_id, brew_id, beer_id, beerName, review, rating, favorite, liked, image FROM public.reviews WHERE beer_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            while (results.next()) {
                Review review = mapRowToReview(results);
                reviews.add(review);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return reviews;
    }
    @Override
    public List<Review> listReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT reviews.user_id, reviews.brew_id, reviews.beer_id, reviews.beerName, reviews.review, reviews.rating, reviews.favorite, reviews.liked, reviews.image, users.username FROM reviews INNER JOIN users ON reviews.user_id = users.user_id;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Review review = mapRowToReview(results);
                reviews.add(review);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return reviews;
    }

    private Review mapRowToReview(SqlRowSet rs) {
        Review review = new Review();
        review.setUser_id(rs.getInt("user_id"));
        review.setBrew_id(rs.getInt("brew_id"));
        review.setBeer_id(rs.getInt("beer_id"));
        review.setBeerName(rs.getString("beerName"));
        review.setReview(rs.getString("review"));
        review.setRating(rs.getInt("rating"));
        review.setFavorite(rs.getBoolean("favorite"));
        review.setFavorite(rs.getBoolean("liked"));
        review.setImage(rs.getString("image"));
        review.setName(rs.getString("username"));
        return review;
    }
}
