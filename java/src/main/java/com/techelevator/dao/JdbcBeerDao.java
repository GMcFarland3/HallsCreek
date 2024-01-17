package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Beer;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcBeerDao implements BeerDao{
    private final JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Beer> listBeers(){
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT beer_id, brew_id, name, type, description, abv, image, status FROM beers  ORDER BY name;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Beer beer = mapRowToBeer(results);
                beers.add(beer);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return beers;
    }
    @Override
    public Beer addBeer(Beer beer) {
        String sql = "INSERT INTO public.beers(brew_id, name, type, description, abv, image, status)VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING beer_id;";
        try {
            int rowInserted = jdbcTemplate.queryForObject(sql, int.class,beer.getBrewId(),beer.getName(),beer.getType(),beer.getDescription(),beer.getAbv(),beer.getImage(),beer.isStatus());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return beer;
    }

    @Override
    public void updateBeer(Beer beer,int id) {
       String sql = "UPDATE public.beers SET brew_id=?, name=?, type=?, description=?, abv=?, image=?, status=? WHERE beer_id =?; ";
        try {
            int rowInserted = jdbcTemplate.update(sql,beer.getBrewId(),beer.getName(),beer.getType(),beer.getDescription(),beer.getAbv(),beer.getImage(),beer.isStatus(),id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }

    }

    private Beer mapRowToBeer(SqlRowSet rs){
        Beer beer = new Beer();
        beer.setBeer_Id(rs.getInt("beer_id"));
        beer.setBrewId(rs.getInt("brew_id"));
        beer.setName(rs.getString("name"));
        beer.setType(rs.getString("type"));
        beer.setDescription(rs.getString("description"));
        beer.setAbv(rs.getString("abv"));
        beer.setImage(rs.getString("image"));
        beer.setStatus(rs.getBoolean("status"));
        return beer;
    }


}
