<div class="left_block">
    <h1>Категории:</h1>
    <ul>
        <?php foreach ($categories as $category) { ?>
            <li>
                <?php 
                    $style = '';
                    $style_ul = 'style="display: none;"';
                    if ($category['category_id'] == $category_id) {
                        $style = 'style="font-weight: bold;"';
                        $style_ul = '';
                    } 
                ?>
                <a href="<?php echo $category['href']; ?>" <?php echo $style; ?>>
                    <?php echo $category['name']; ?>
                </a>
                <?php if ($category['children']) { ?>
                    <ul <?php echo $style_ul; ?>>
                        <?php foreach ($category['children'] as $child) { ?>
                            <?php 
                                $style = '';
                                if ($child['category_id'] == $child_id) {
                                    $style = 'style="font-weight: bold;"';
                                }
                            ?>
                            <li>
                                <a href="<?php echo $child['href']; ?>" <?php echo $style; ?>>
                                    <?php echo $child['name']; ?>
                                </a>
                            </li>
                        <?php } ?>
                    </ul>
                <?php } ?>
            </li>
        <?php } ?>
    </ul>
</div>

<div class="left_block">
    <h1>Бренды:</h1>
    <select id="id_brands" name="brands">
        <option value="0">Не выбрано</option>
        <?php foreach ($manufacturers as $mn) { ?>
            <option value="<?php echo $mn['manufacturer_id']; ?>"><?php echo $mn['name']; ?></option>
        <?php } ?>
    </select>
</div>