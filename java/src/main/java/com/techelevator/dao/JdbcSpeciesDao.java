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
        String sql = "SELECT speciesId, scientificName, price1, size1, price2, size2, price3, size3, price4, size4, price5, size5, price6, size6 FROM species ORDER BY scientificName;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Species species = mapRowToSpecies(results);
                speciesList.add(species);
            }
        } catch (Exception e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return speciesList;
    }

    @Override
    public void addSpecies(Species species) {
        String sql = "INSERT INTO species (scientificName, price1, size1, price2, size2, price3, size3, price4, size4, price5, size5, price6, size6) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            jdbcTemplate.update(sql, species.getScientificName(), species.getPrice1(), species.getSize1(), species.getPrice2(), species.getSize2(), species.getPrice3(), species.getSize3(), species.getPrice4(), species.getSize4(), species.getPrice5(), species.getSize5(), species.getPrice6(), species.getSize6());
        } catch (Exception e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void updateSpecies(Species species, int speciesId) {
        String sql = "UPDATE species SET scientificName = ?, price1 = ?, size1 = ?, price2 = ?, size2 = ?, price3 = ?, size3 = ?, price4 = ?, size4 = ?, price5 = ?, size5 = ?, price6 = ?, size6 = ? WHERE speciesId = ?;";
        try {
            jdbcTemplate.update(sql, species.getScientificName(), species.getPrice1(), species.getSize1(), species.getPrice2(), species.getSize2(), species.getPrice3(), species.getSize3(), species.getPrice4(), species.getSize4(), species.getPrice5(), species.getSize5(), species.getPrice6(), species.getSize6(), speciesId);
        } catch (Exception e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }
    @Override
    public void deleteSpecies(int speciesId) {
        String sql = "DELETE FROM species WHERE speciesId = ?;";
        try {
            jdbcTemplate.update(sql, speciesId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public Species getSpeciesById(int id) {
        String sql = "SELECT speciesId, scientificName, price1, size1, price2, size2, price3, size3, price4, size4, price5, size5, price6, size6 FROM species WHERE speciesId = ?;";
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
        species.setScientificName(rs.getString("scientificName"));
        species.setPrice1(rs.getString("price1"));
        species.setSize1(rs.getString("size1"));
        species.setPrice2(rs.getString("price2"));
        species.setSize2(rs.getString("size2"));
        species.setPrice3(rs.getString("price3"));
        species.setSize3(rs.getString("size3"));
        species.setPrice4(rs.getString("price4"));
        species.setSize4(rs.getString("size4"));
        species.setPrice5(rs.getString("price5"));
        species.setSize5(rs.getString("size5"));
        species.setPrice6(rs.getString("price6"));
        species.setSize6(rs.getString("size6"));
        return species;
    }
}


