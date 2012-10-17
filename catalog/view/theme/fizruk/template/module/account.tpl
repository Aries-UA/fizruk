<div class="box">
    <h2><?php echo $heading_title; ?></h2>
    <div class="box-content">
        <div class="left">
            <ul>
                <?php if (!$logged) { ?>
                    <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                    <li><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
                <?php } ?>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <?php if ($logged) { ?>
                    <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                    <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                <?php } ?>
                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            </ul>
        </div>
        <div class="left" style="margin-left: 14px;">
            <ul>
                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                <?php if ($logged) { ?>
                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                <?php } ?>
            </ul>
        </div>
        <div class="clear"></div>
  </div>
</div>
