<?php
require_once('includes/load.php');
$page_title = 'Add Purchase';
include_once('layouts/header.php');
$all_products = find_all('products'); // Fetching all products from database
?>

<style>
  .img-thumbnail {
    border: none !important;
  }
</style>

<div class="container">
  <h2 class="text-center">Shop Products</h2>
  <div class="row" style="display: flex; flex-wrap: wrap; align-items: stretch;">
    <?php foreach ($all_products as $product): ?>
      <div class="col-md-4" style="display: flex;">
        <div class="panel panel-default" style="flex-grow: 1; display: flex; flex-direction: column;">
          <div class="panel-heading text-center">
            <strong><?php echo remove_junk($product['name']); ?></strong>
          </div>
          <div class="panel-body" style="flex-grow: 1; display: flex; justify-content: space-between; align-items: flex-start;">
            
            <!-- Left Side: Info and Form -->
            <div style="flex-grow: 1;">
              <p><strong>Price:</strong> ₹<?php echo number_format($product['sale_price'], 2); ?></p>
              <p><strong>Available:</strong> <?php echo $product['quantity']; ?></p>

              <form method="post" action="process_purchase.php">
                <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
                <div class="form-group">
                  <label for="quantity">Quantity</label>
                  <input type="number" name="quantity" class="form-control" min="1" max="<?php echo $product['quantity']; ?>" required>
                </div>
                <button type="submit" class="btn btn-success btn-block">Purchase</button>
              </form>
            </div>

            <!-- Right Side: Image -->
            <div style="flex: 0 0 140px; text-align: center;">
              <?php if (!empty($product['media_id'])):
                $media = find_by_id('media', $product['media_id']);
                if ($media): ?>
                  <img src="uploads/products/<?php echo $media['file_name']; ?>" alt="Product Image" class="img-responsive img-thumbnail" style="max-height: 190px; object-fit: contain;">
              <?php endif; endif; ?>
            </div>

          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
</div>

<?php include_once('layouts/footer.php'); ?>
