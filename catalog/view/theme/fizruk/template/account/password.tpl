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

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <h2><?php echo $text_password; ?></h2>
        <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_password; ?></td>
              <td><input type="password" name="password" value="<?php echo $password; ?>" />
                <?php if ($error_password) { ?>
                <span class="error"><?php echo $error_password; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
              <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
                <?php if ($error_confirm) { ?>
                <span class="error"><?php echo $error_confirm; ?></span>
                <?php } ?></td>
            </tr>
        </table>
        <div class="buttons">
            <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
            <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
            <div class="clear"></div>
        </div>
    </form>

    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>