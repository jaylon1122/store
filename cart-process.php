<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

require 'vendor/autoload.php';
use Aries\MiniFrameworkStore\Models\Product;

session_start();

// Validate productId
if (!isset($_POST['productId']) || !is_numeric($_POST['productId'])) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid product ID']);
    exit;
}

$product_id = intval($_POST['productId']);
$quantity = isset($_POST['quantity']) ? intval($_POST['quantity']) : 1;

// Initialize cart if not set
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Get product details
$product = new Product();
$productDetails = $product->getById($product_id);

// Check if product exists
if (!$productDetails || !isset($productDetails['price']) || !isset($productDetails['name'])) {
    echo json_encode(['status' => 'error', 'message' => 'Product not found']);
    exit;
}

// Add or update product in cart
if (isset($_SESSION['cart'][$product_id])) {
    $_SESSION['cart'][$product_id]['quantity'] += $quantity;
    $_SESSION['cart'][$product_id]['total'] = $_SESSION['cart'][$product_id]['quantity'] * $_SESSION['cart'][$product_id]['price'];
} else {
    $_SESSION['cart'][$product_id] = [
        'product_id' => $product_id,
        'name' => $productDetails['name'],
        'price' => $productDetails['price'],
        'quantity' => $quantity,
        'total' => $productDetails['price'] * $quantity
    ];
}

echo json_encode(['status' => 'success', 'message' => 'Product added to cart']);
exit;
?>
