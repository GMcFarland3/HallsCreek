package com.techelevator.dao;

import com.techelevator.model.Tree;
import com.techelevator.exception.DaoException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcTreeDao implements TreeDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcTreeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Tree> listTrees() {
        List<Tree> trees = new ArrayList<>();
        String sql = "SELECT trees.treeid, trees.speciesid, trees.commonname, trees.image, " +
                "species.scientificname, species.price1, species.size1, species.wholesale1, species.price2, species.size2, species.wholesale2, " +
                "species.price3, species.size3, species.wholesale3, species.price4, species.size4, species.wholesale4, " +
                "species.price5, species.size5, species.wholesale5, species.price6, species.size6, species.wholesale6 " +
                "FROM trees INNER JOIN species ON trees.speciesid = species.speciesid;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Tree tree = mapRowToTreeWithSpecies(results);

                trees.add(tree);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return trees;
    }

    @Override
    public void addTree(Tree tree) {
        String sql = "INSERT INTO trees (speciesId, commonName, image) VALUES (?, ?, ?);";
        try {
            jdbcTemplate.update(sql, tree.getSpeciesId(), tree.getCommonName(), tree.getImage());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void updateTree(Tree tree, int treeId) {
        String sql = "UPDATE trees SET speciesId = ? WHERE treeid = ?;";
        try {
            jdbcTemplate.update(sql, tree.getSpeciesId(), treeId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void deleteTree(int treeId) {
        String sql = "DELETE FROM trees WHERE treeid = ?;";
        try {
            jdbcTemplate.update(sql, treeId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public Tree getTreeById(int id) {
        String sql = "SELECT treeid, speciesId FROM trees WHERE treeid = ?;";
        Tree tree = null;
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                tree = mapRowToTreeWithSpecies(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return tree;
    }
    public List<Tree> getAllTreesWithSpecies() {
        List<Tree> trees = new ArrayList<>();
        String sql = "SELECT t.treeid, t.speciesId, t.commonname, t.image, s.scientificName, s.price1, s.size1, s.price2, s.size2, s.price3, s.size3, s.price4, s.size4, s.price5, s.size5, s.price6, s.size6 FROM trees t INNER JOIN species s ON t.speciesId = s.speciesId ORDER BY t.speciesId;";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Tree tree = mapRowToTreeWithSpecies(results);
                trees.add(tree);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return trees;
    }

    private Tree mapRowToTreeWithSpecies(SqlRowSet results) {
        Tree tree = new Tree();
        tree.setTreeid(results.getInt("treeid"));
        tree.setSpeciesId(results.getInt("Speciesid"));
        tree.setCommonName(results.getString("commonname"));
        tree.setImage(results.getString("image"));
        tree.setScientificName(results.getString("scientificname"));
        tree.setPrice1(results.getString("price1"));
        tree.setSize1(results.getString("size1"));
        tree.setWholesale1(results.getString("wholesale1"));
        tree.setPrice2(results.getString("price2"));
        tree.setSize2(results.getString("size2"));
        tree.setWholesale2(results.getString("wholesale2"));
        tree.setPrice3(results.getString("price3"));
        tree.setSize3(results.getString("size3"));
        tree.setWholesale3(results.getString("wholesale3"));
        tree.setPrice4(results.getString("price4"));
        tree.setSize4(results.getString("size4"));
        tree.setWholesale4(results.getString("wholesale4"));
        tree.setPrice5(results.getString("price5"));
        tree.setSize5(results.getString("size5"));
        tree.setWholesale5(results.getString("wholesale5"));
        tree.setPrice6(results.getString("price6"));
        tree.setSize6(results.getString("size6"));
        tree.setWholesale6(results.getString("wholesale6"));
        return tree;
    }

//    private Tree mapRowToTree(SqlRowSet rs) {
//        Tree tree = new Tree();
//        tree.setTreeid(rs.getInt("treeid"));
//        tree.setSpeciesId(rs.getInt("Speciesid"));
//        tree.setCommonName(rs.getString("commonname"));
//        tree.setImage(rs.getString("image"));
//        return tree;
//    }


}
