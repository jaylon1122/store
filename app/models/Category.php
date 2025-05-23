<?php

namespace Aries\MiniFrameworkStore\Models;

use Aries\MiniFrameworkStore\Includes\Database;

class Category extends Database
{

    private $db;

    public function __construct()
    {
        parent::__construct(); // Call the parent constructor to establish the connection
        $this->db = $this->getConnection(); // Get the connection instance
    }

    public function getAll()
    {
        $sql = "SELECT * FROM product_categories ORDER BY name ASC";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getMainCategories()
    {
        $sql = "SELECT * FROM product_categories WHERE parent_id IS NULL ORDER BY name ASC";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getSubcategories($parentId)
    {
        $sql = "SELECT * FROM product_categories WHERE parent_id = :parent_id ORDER BY name ASC";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':parent_id', $parentId, \PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getCategoryBySlug($slug)
    {
        $sql = "SELECT * FROM product_categories WHERE slug = :slug LIMIT 1";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':slug', $slug, \PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public function getCategoryTree()
    {
        $categories = $this->getMainCategories();
        foreach ($categories as &$category) {
            $category['subcategories'] = $this->getSubcategories($category['id']);
        }
        return $categories;
    }

    public function addCategory($name, $slug, $parentId = null)
    {
        // Check if slug already exists
        $sqlCheck = "SELECT COUNT(*) FROM product_categories WHERE slug = :slug";
        $stmtCheck = $this->db->prepare($sqlCheck);
        $stmtCheck->bindParam(':slug', $slug, \PDO::PARAM_STR);
        $stmtCheck->execute();
        $count = $stmtCheck->fetchColumn();

        if ($count > 0) {
            // Slug already exists
            return false;
        }

        // Insert new category
        $sql = "INSERT INTO product_categories (name, slug, parent_id) VALUES (:name, :slug, :parent_id)";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':name', $name, \PDO::PARAM_STR);
        $stmt->bindParam(':slug', $slug, \PDO::PARAM_STR);
        $stmt->bindParam(':parent_id', $parentId, \PDO::PARAM_INT);
        return $stmt->execute();
    }
}

$categoryModel = new \Aries\MiniFrameworkStore\Models\Category();
$categoryModel->addCategory('Fashion', 'fashion');
$categoryModel->addCategory('Electronics', 'electronics');
$categoryModel->addCategory('Home and Appliances', 'home-and-appliances');