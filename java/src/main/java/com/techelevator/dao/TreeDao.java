package com.techelevator.dao;

import com.techelevator.model.Tree;
import java.util.List;

public interface TreeDao {
    List<Tree> listTrees();
    void addTree(Tree tree);
    void updateTree(Tree tree, int treeId);
    void deleteTree(int treeId);
    Tree getTreeById(int id);
    // Other methods as needed
}



