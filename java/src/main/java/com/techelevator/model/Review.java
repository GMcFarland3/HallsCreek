package com.techelevator.model;

public class Review {

    private int user_id;
    private int brew_id;
    private int beer_id;
    private String beerName;
    private String review;
    private int rating;
    private boolean favorite;
    private boolean liked;
    private String image;
    private String name;

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBrew_id() {
        return brew_id;
    }
    public void setBrew_id(int brew_id) {
        this.brew_id = brew_id;
    }

    public int getBeer_id() {
        return beer_id;
    }
    public void setBeer_id(int beer_id) {
        this.beer_id = beer_id;
    }

    public String getReview() {
        return review;
    }
    public void setReview(String review) {
        this.review = review;
    }

    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean isFavorite() {
        return favorite;
    }
    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    public boolean isLiked() {
        return liked;
    }
    public void setLiked(boolean liked) {
        this.liked = liked;
    }

    public String getBeerName() {
        return beerName;
    }
    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
}
