package com.techelevator.model;

public class Species {
    public int getSpeciesId() {
        return speciesId;
    }

    public void setSpeciesId(int speciesId) {
        this.speciesId = speciesId;
    }

    public String getCommonName() {
        return commonName;
    }

    public void setCommonName(String commonName) {
        this.commonName = commonName;
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBloomTime() {
        return bloomTime;
    }

    public void setBloomTime(String bloomTime) {
        this.bloomTime = bloomTime;
    }

    public String getSizeGrowthHabit() {
        return sizeGrowthHabit;
    }

    public void setSizeGrowthHabit(String sizeGrowthHabit) {
        this.sizeGrowthHabit = sizeGrowthHabit;
    }

    private int speciesId;
    private String commonName;
    private String scientificName;
    private String color;
    private String bloomTime;
    private String sizeGrowthHabit;

    // Getters and Setters
}


