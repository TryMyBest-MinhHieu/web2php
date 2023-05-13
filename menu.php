<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
   $user_id = $_SESSION['user_id'];
} else {
   $user_id = '';
};

include 'components/add_cart.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>menu</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <!-- <link rel="stylesheet" href="css/style.css"> -->
   <link rel="stylesheet" href="css/style.css?php echo time(); ?>">


   <!-- icons -->
   <link rel="shortcut icon" href="images/favicon.png" type="">
   <title>Menu</title>
</head>

<body>

   <!-- header section starts  -->
   <?php include 'components/user_header.php'; ?>
   <!-- lọc id sp  -->
   
   <!-- header section ends -->
   
   <div class="heading">
      <h3>Menu</h3>
      <p><a href="home.php">Trang chủ</a> <span> / Menu</span></p>
   </div>

   <!-- menu section starts  -->
   <section class="products">

      <h1 class="title"></h1>

      <div class="category-bar"> 
      <a href="menu.php">ALL</a>
      
         <?php
            $select_cate = $conn->prepare("SELECT * FROM `category`");
            $select_cate->execute();
            if ($select_cate->rowCount() > 0) {
               while ($fetch_category = $select_cate->fetch(PDO::FETCH_ASSOC)) {
                  $category = $fetch_category ;
         ?>
            <form action="" method="post" class="box">
               <input type="hidden" name="pid" value="<?= $fetch_category['id_cate']; ?>">
               <input type="hidden" name="name" value="<?= $fetch_category['namecate']; ?>">
               <a href="category.php?quanly=menu&id=<?= $fetch_category['id_cate']; ?>"><?= $fetch_category['namecate']; ?></a>
            </form>
         <?php
               }
            } else {
               echo '<p class="empty">Chưa có sản phẩm!</p>';
            }
         ?>
         
      </div>

      <div class="box-container">
       
      <?php
          $item_per_page = isset($_GET['per_page']) ? $_GET['per_page']:6;
          $current_page = isset($_GET['page']) ? $_GET['page']:1;
          $offset = ($current_page-1)* $item_per_page;
          $select_products = $conn->prepare("SELECT * FROM `products` ORDER BY 'id' ASC LIMIT $item_per_page OFFSET $offset");
          $select_products->execute();
          $haha="SELECT count(*) FROM products";
          $kq = $conn->query($haha);
          $r = $kq->fetch();
          $totalRecords = $r[0];
          $totalPages = ceil($totalRecords / $item_per_page);
          if ($select_products->rowCount() > 0) {
             while ($fetch_products = $select_products->fetch(PDO::FETCH_ASSOC)) {
                $product = $fetch_products ;
         ?>
         
               <form action="" method="post" class="box">
                  <input type="hidden" name="pid" value="<?= $fetch_products['id']; ?>">
                  <input type="hidden" name="name" value="<?= $fetch_products['name']; ?>">
                  <input type="hidden" name="price" value="<?= $fetch_products['price']; ?>">
                  <input type="hidden" name="image" value="<?= $fetch_products['image']; ?>">
                  <a href="quick_view.php?pid=<?= $fetch_products['id']; ?>" class="fas fa-eye"></a>
                  <button type="submit" class="fas fa-shopping-cart" name="add_to_cart"></button>
                  <img src="uploaded_img/<?= $fetch_products['image']; ?>" alt="">
                  <a href="category.php?category=<?= $fetch_products['category']; ?>" class="cat"><?= $fetch_products['category']; ?></a>
                  <div class="name"><?= $fetch_products['name']; ?></div>
                  <div class="flex">
                     <div class="price"><span>$</span><?= $fetch_products['price']; ?></div>
                     <input type="number" name="qty" class="qty" min="1" max="99" value="1" maxlength="2"">
         </div>
      </form>

      <?php
            }
         } else {
            echo '<p class="empty">Chưa có sản phẩm!</p>';
         }
      ?>
      

      </div>
      <br><br>
      <?php 
            include 'pagination.php';
      ?>
</section>


<!-- menu section ends -->


<!-- footer section starts  -->
<?php include 'components/footer.php'; ?>
<!-- footer section ends -->




<!-- custom js file link  -->
<script src=" js/script.js"></script>
<script>
  function clicked(a) {
   console.log(a);
}
  </script>
</body>

</html>