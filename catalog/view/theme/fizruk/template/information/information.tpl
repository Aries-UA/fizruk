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

    <?php echo $description; ?>
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
        <div class="clear"></div>
    </div>

    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>
