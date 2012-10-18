<?php echo $header; ?>
<?php echo $column_left; ?>
<div class="page left">
    <?php echo $content_top; ?>

    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>

    <?php if ($success) { ?>
        <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>

    <h1><?php echo $heading_title; ?></h1>
    <div class="clear"></div>

    <h2><?php echo $text_address_book; ?></h2>

    <?php foreach ($addresses as $result) { ?>
    <table style="width: 100%;">
        <tr>
            <td>
                <?php echo $result['address']; ?>
            </td>
            <td style="width: 160px;">
                <a href="<?php echo $result['update']; ?>" class="button"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="button"><?php echo $button_delete; ?></a>
            </td>
        </tr>
    </table>
    <?php } ?>
    <br />
    <div class="buttons">
        <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
        <div class="right"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_new_address; ?></a></div>
        <div class="clear"></div>
    </div>

    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>