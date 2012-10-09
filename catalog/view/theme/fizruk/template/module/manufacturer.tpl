<div class="left_block">
    <h1>Бренды:</h1>
    <select id="id_brands" name="brands">
        <option value="0">Не выбрано</option>
        <?php foreach ($manufacturers as $mn) { ?>
            <option value="<?php echo $mn['manufacturer_id']; ?>"><?php echo $mn['name']; ?></option>
        <?php } ?>
    </select>
</div>