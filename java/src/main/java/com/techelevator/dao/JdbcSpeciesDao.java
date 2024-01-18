package com.techelevator.dao;

import com.techelevator.model.Species;
import com.techelevator.exception.DaoException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcSpeciesDao implements SpeciesDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcSpeciesDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Species> listSpecies() {
        List<Species> speciesList = new ArrayList<>();
        String sql = "SELECT speciesId, commonName, scientificName, color, bloomTime, sizeGrowthHabit FROM species ORDER BY commonName;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Species species = mapRowToSpecies(results);
                speciesList.add(species);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return speciesList;
    }

    @Override
    public void addSpecies(Species species) {
        String sql = "INSERT INTO species (common_name, scientific_name, color, bloom_time, size_growth_habit) VALUES (?, ?, ?, ?, ?);";
        try {
            jdbcTemplate.update(sql, species.getCommonName(), species.getScientificName(), species.getColor(), species.getBloomTime(), species.getSizeGrowthHabit());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void updateSpecies(Species species, int speciesId) {
        String sql = "UPDATE species SET common_name = ?, scientific_name = ?, color = ?, bloom_time = ?, size_growth_habit = ? WHERE species_id = ?;";
        try {
            jdbcTemplate.update(sql, species.getCommonName(), species.getScientificName(), species.getColor(), species.getBloomTime(), species.getSizeGrowthHabit(), speciesId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void deleteSpecies(int speciesId) {
        String sql = "DELETE FROM species WHERE species_id = ?;";
        try {
            jdbcTemplate.update(sql, speciesId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public Species getSpeciesById(int id) {
        String sql = "SELECT species_id, common_name, scientific_name, color, bloom_time, size_growth_habit FROM species WHERE species_id = ?;";
        Species species = null;
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                species = mapRowToSpecies(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return species;
    }

    private Species mapRowToSpecies(SqlRowSet rs) {
        Species species = new Species();
        species.setSpeciesId(rs.getInt("speciesId"));
        species.setCommonName(rs.getString("commonName"));
        species.setScientificName(rs.getString("scientificName"));
        species.setColor(rs.getString("color"));
        species.setBloomTime(rs.getString("bloomTime"));
        species.setSizeGrowthHabit(rs.getString("sizeGrowthHabit"));
        return species;
    }
}


