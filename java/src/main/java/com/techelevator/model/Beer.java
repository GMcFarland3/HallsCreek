package com.techelevator.model;

public class Beer {
    
    private int beer_Id;
    private int brewId;
    private String name;
    private String type;
    private String description;
    private String abv;
    private String image;
    private boolean status;

    public int getBeer_Id() {
        return beer_Id;
    }
    public void setBeer_Id(int beer_id) {
        this.beer_Id = beer_id;
    }

    public int getBrewId() {
        return brewId;
    }
    public void setBrewId(int brew_id) {
        this.brewId = brew_id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getAbv() {
        return abv;
    }
    public void setAbv(String abv) {
        this.abv = abv;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
}
