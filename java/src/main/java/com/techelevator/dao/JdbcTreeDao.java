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
        String sql = "SELECT tree_id, species_id, image FROM trees ORDER BY species_id;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Tree tree = mapRowToTree(results);
                trees.add(tree);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return trees;
    }

    @Override
    public void addTree(Tree tree) {
        String sql = "INSERT INTO trees (species_id) VALUES (?);";
        try {
            jdbcTemplate.update(sql, tree.getSpeciesId());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void updateTree(Tree tree, int treeId) {
        String sql = "UPDATE trees SET species_id = ? WHERE tree_id = ?;";
        try {
            jdbcTemplate.update(sql, tree.getSpeciesId(), treeId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public void deleteTree(int treeId) {
        String sql = "DELETE FROM trees WHERE tree_id = ?;";
        try {
            jdbcTemplate.update(sql, treeId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
    }

    @Override
    public Tree getTreeById(int id) {
        String sql = "SELECT tree_id, species_id FROM trees WHERE tree_id = ?;";
        Tree tree = null;
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
            if (results.next()) {
                tree = mapRowToTree(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return tree;
    }

    public List<Tree> getAllTreesWithSpecies() {
        List<Tree> trees = new ArrayList<>();
        String sql = "SELECT t.tree_id, t.species_id, s.common_name, s.scientific_name, t.color, t.bloom_time, t.size_growth_habit, t.image "
                + "FROM trees t "
                + "INNER JOIN species s ON t.species_id = s.species_id "
                + "ORDER BY t.species_id;";

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

    private Tree mapRowToTree(SqlRowSet rs) {
        Tree tree = new Tree();
        tree.setTreeId(rs.getInt("tree_id"));
        tree.setSpeciesId(rs.getInt("species_id"));
        tree.setImage(rs.getString("image")); // Mapping the image field
        tree.setCommonName(rs.getString("common_name"));
        tree.setScientificName(rs.getString("scientific_name"));
        return tree;
    }
    private Tree mapRowToTreeWithSpecies(SqlRowSet rs) {
        Tree tree = new Tree();
        tree.setTreeId(rs.getInt("tree_id"));
        tree.setSpeciesId(rs.getInt("species_id"));
        tree.setImage(rs.getString("image")); // Mapping the image field
        tree.setCommonName(rs.getString("common_name"));
        tree.setScientificName(rs.getString("scientific_name"));
        // Map other fields as necessary
        return tree;
    }

}
