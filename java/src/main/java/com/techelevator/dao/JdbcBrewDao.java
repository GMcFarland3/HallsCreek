package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBrewDao implements BrewDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcBrewDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Brewery> listBreweries() {
        List<Brewery> breweries = new ArrayList<>();
        String sql = "SELECT brew_id, user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image FROM breweries  ORDER BY name";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Brewery brew = mapRowToBrewery(results);
                breweries.add(brew);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return breweries;
    }

    @Override
    public Brewery createBrewery(Brewery brewery) {
        String sql = "INSERT INTO breweries(\n" +
                "\tuser_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image)\n" +
                "\tVALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING brew_id;";
        try {
            int rowInserted = jdbcTemplate.queryForObject(sql, int.class, brewery.getUser_id(), brewery.getName(), brewery.getAddress(), brewery.getAddress2(), brewery.getCity(), brewery.getState_abbr(), brewery.getZip_code(), brewery.getPhone(), brewery.getWebsite(), brewery.getOperation_hours(), brewery.getHistory(), brewery.getImage());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return brewery;
    }

    @Override
    public Brewery getBreweryById(int breweryId) {
        Brewery brewery = null;
        final String sql = "SELECT brew_id, user_id, name, address, address2, city, state_abbr, zip_code, phone, website, operation_hours, history, image FROM breweries WHERE brew_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
            if (results.next()) {
                brewery = (mapRowToBrewery(results));
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Connection error");
        }
        return brewery;
    }

    @Override
    public void updateBrewery(Brewery brewery, int id) {
        String sql = "UPDATE breweries SET name=?, address=?, address2=?, city=?, state_abbr=?, zip_code=?, phone=?, website=?, operation_hours=?, history=?, image=? WHERE brew_id=?;";
        try {
            int rowUpdated = jdbcTemplate.update(sql, brewery.getName(), brewery.getAddress(), brewery.getAddress2(), brewery.getCity(), brewery.getState_abbr(), brewery.getZip_code(), brewery.getPhone(), brewery.getWebsite(), brewery.getOperation_hours(), brewery.getHistory(), brewery.getImage(), id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    private Brewery mapRowToBrewery(SqlRowSet rs) {
        Brewery brew = new Brewery();
        brew.setBrew_id(rs.getInt("brew_id"));
        brew.setUser_id(rs.getInt("user_id"));
        brew.setName(rs.getString("name"));
        brew.setAddress(rs.getString("address"));
        brew.setAddress2(rs.getString("address2"));
        brew.setCity(rs.getString("city"));
        brew.setState_abbr(rs.getString("state_abbr"));
        brew.setZip_code(rs.getString("zip_code"));
        brew.setPhone(rs.getString("phone"));
        brew.setWebsite(rs.getString("website"));
        brew.setOperation_hours(rs.getString("operation_hours"));
        brew.setHistory(rs.getString("history"));
        brew.setImage(rs.getString("image"));
        return brew;
    }
}
