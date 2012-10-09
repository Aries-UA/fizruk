<h1 class="left">Избранные товары</h1>
<div class="clear"></div>
<?php foreach ($products as $product) { ?>
    <div class="items">
        <a href="<?php echo $product['href']; ?>">
            <div class="item_image" style="background: url(<?php echo $product['thumb']; ?>) no-repeat;"></div>
        </a>
        <p class="item_name">Р<?php echo $product['name']; ?></p>
        <?php if (!$product['special']) { ?>
            <p class="item_price"><?php echo $product['price']; ?></p>
        <?php } else { ?>
            <p class="item_price">
                <span class="price-old"><?php echo $product['price']; ?></span> 
                <span class="price-new"><?php echo $product['special']; ?></span>
            </p>
        <?php } ?>
        <input type="button" class="btn_item" value="Добавить" onclick="addToCart('<?php echo $product['product_id']; ?>');" />
    </div>
<?php } ?>