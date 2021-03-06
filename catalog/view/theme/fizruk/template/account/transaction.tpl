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

    <p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_date_added; ?></td>
            <td class="left"><?php echo $column_description; ?></td>
            <td class="right"><?php echo $column_amount; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($transactions) { ?>
          <?php foreach ($transactions  as $transaction) { ?>
          <tr>
            <td class="left"><?php echo $transaction['date_added']; ?></td>
            <td class="left"><?php echo $transaction['description']; ?></td>
            <td class="right"><?php echo $transaction['amount']; ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="5"><?php echo $text_empty; ?></td>
          </tr>
          <?php } ?>
        </tbody>
    </table>
    <br />
    <div class="pagination"><?php echo $pagination; ?></div>
    <br /><br />
    <div class="buttons">
        <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
        <div class="clear"></div>
    </div>

    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>