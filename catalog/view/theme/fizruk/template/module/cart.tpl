<div class="header_cart left">
    <img src="catalog/view/theme/fizruk/images/header_cart_logo.png" class="left" />
    <div class="left" style="width: 177px;">
        <div style="position: relative;">
            <h1 class="left"><?php echo $heading_title; ?></h1>
            <input type="button" id="showCart" class="show_cart left" value="" />
            <div class="clear"></div>
            <div id="cartContent">

                <?php if ($products || $vouchers) { ?>
                    <table>
                        <?php foreach ($products as $product) { ?>
                        <tr>
                            <td class="image">
                                <?php if ($product['thumb']) { ?>
                                    <a href="<?php echo $product['href']; ?>">
                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                                    </a>
                                <?php } ?>
                            </td>
                            <td class="td_name">
                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                <div>
                                    <?php foreach ($product['option'] as $option) { ?>
                                        - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                                    <?php } ?>
                                </div>
                            </td>
                            <td class="td_quantity">
                                x&nbsp;<?php echo $product['quantity']; ?>
                            </td>
                            <td class="td_separator"> - </td>
                            <td class="total">
                                <?php echo $product['total']; ?>
                            </td>
                            <td class="td_remove">
                                <img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="removeOfCart('<?php echo $product['key']; ?>')" />
                            </td>
                        </tr>
                        <?php } ?>

                        <?php foreach ($vouchers as $voucher) { ?>
                        <tr>
                            <td class="image"></td>
                            <td class="td_name"><?php echo $voucher['description']; ?></td>
                            <td class="td_quantity">x&nbsp;1</td>
                            <td class="td_separator"> - </td>
                            <td class="total"><?php echo $voucher['amount']; ?></td>
                            <td class="remove">
                                <img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="removeOfCart('<?php echo $voucher['key']; ?>')" />
                            </td>
                        </tr>
                        <?php } ?>
                    </table>
                    <table class="total right">
                        <?php foreach ($totals as $total) { ?>
                        <tr>
                          <td align="right"><b><?php echo $total['title']; ?>:</b></td>
                          <td align="right"><?php echo $total['text']; ?></td>
                        </tr>
                        <?php } ?>
                    </table>
                    <div class="clear"></div>
                    <center class="checkout">
                        <a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
                    </center>
                <?php } else { ?>
                    <div class="empty"><?php echo $text_empty; ?></div>
                <?php } ?>

            </div>
        </div>
        <div id="headerCartData">
            <?php echo $text_items; ?>
        </div>
    </div>
</div>