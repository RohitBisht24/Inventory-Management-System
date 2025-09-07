<?php
require_once('includes/load.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $product_id = (int)$_POST['product_id'];
  $quantity = (int)$_POST['quantity'];

  if ($product_id > 0 && $quantity > 0) {
    // Fetch the current product details
    $product = find_by_id('products', $product_id);

    if ($product) {
      // Calculate the new quantity after purchase
      $new_quantity = $product['quantity'] + $quantity;

      // Update the product quantity in the database
      $update_query = "UPDATE products SET quantity = $new_quantity WHERE id = $product_id";
      if ($db->query($update_query)) {
        $session->msg('s', 'Purchase successful! Quantity updated.');
        redirect('add_purchase.php', false);
      } else {
        $session->msg('d', 'Sorry, purchase could not be processed.');
        redirect('add_purchase.php', false);
      }
    } else {
      $session->msg('d', 'Product not found.');
      redirect('add_purchase.php', false);
    }
  } else {
    $session->msg('d', 'Invalid input.');
    redirect('add_purchase.php', false);
  }
}
?>
