<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="page left">
    <?php echo $content_top; ?>

    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>

    <h1><?php echo $heading_title; ?></h1>
    <div class="clear"></div>

    <?php if ($thumb || $description) { ?>
        <div class="category-info">
            <?php if ($thumb) { ?>
                <div class="item_image left" style="background: url(<?php echo $thumb; ?>) no-repeat;"></div>
            <?php } ?>
            <?php if ($description) { ?>
                <div class="descr left">
                    <?php echo $description; ?>
                </div>
            <?php } ?>
            <div class="clear"></div>
        </div>
    <?php } ?>

    <?php if ($categories) { ?>
        <h2><?php echo $text_refine; ?></h2>
        <div class="category-list">
            <ul>
                <?php foreach ($categories as $category) { ?>
                    <li>
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                </li>
                <?php } ?>
            </ul>
        </div>      
    <?php } ?>

    <?php if ($products) { ?>
        <div class="sort right">
            <label>Показывать:</label>
            <select class="sel_sort" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                    <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                    <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
            <?php } ?>
            </select>
        </div>
        <div class="sort right">
            <label for="id_sort">Сортировать по:</label>
            <select class="sel_sort" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
            <?php } ?>
            </select>
        </div>
        <div class="clear"></div>

        <div class="product-compare">
            <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
        </div>

        <?php foreach ($products as $product) { ?>
            <div class="items">
                <a href="<?php echo $product['href']; ?>">
                    <div class="item_image" style="background: url(<?php echo $product['thumb']; ?>) no-repeat;"></div>
                </a>
                <p class="item_manufacturer"><?php echo $product['manufacturer']; ?></p>
                <p class="item_name"><?php echo $product['name']; ?></p>
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

        <div class="clear"></div>

        <div class="pagins">
            <?php echo $pagination; ?>
            <div class="clear"></div>
        </div>      

    <?php } ?>

    <?php if (!$categories && !$products) { ?>
        <div class="content"><?php echo $text_empty; ?></div>
        <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
        </div>
    <?php } ?>

    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>