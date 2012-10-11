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

    <div class="detail">

        <div class="product_images">
            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" rel="colorbox" rel="colorbox">
                <div class="detail_big_img" style="background: url(<?php echo $thumb; ?>) no-repeat;"></div>
            </a>
            <?php if ($images) { ?>
            <div class="product_thumbs">
                <?php foreach ($images as $image) { ?>
                <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" rel="colorbox"> 
                    <div class="product_thumb" style="background: url(<?php echo $image['thumb']; ?>) no-repeat;"></div>
                </a>
                <?php } ?>
            </div>
            <?php } ?>
            <div class="clear"></div>
        </div>

        <div class="product_detail">
            <?php if ($manufacturer) { ?>
                <p><span>Бренд:</span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></p>
            <?php } ?>
            <p><span><?php echo $text_model; ?></span> <?php echo $model; ?></p>
            <?php if ($reward) { ?>
                <p><span><?php echo $text_reward; ?></span> <?php echo $reward; ?></p>
            <?php } ?>
            <p><span><?php echo $text_stock; ?></span> <?php echo $stock; ?></p>

            <?php if ($price) { ?>
                <div class="price">
                    <span class="hh"><?php echo $text_price; ?></span>
                    <?php if (!$special) { ?>
                        <span class="txt"><?php echo $price; ?></span>
                    <?php } else { ?>
                        <span class="txt detail-price-old"><?php echo $price; ?></span> 
                        <span class="txt detail-price-new"><?php echo $special; ?></span>
                    <?php } ?>

                    <?php if ($tax) { ?>
                        <p><?php echo $text_tax; ?> <?php echo $tax; ?></p>
                    <?php } ?>

                    <?php if ($points) { ?>
                        <p><small><?php echo $text_points; ?> <?php echo $points; ?></small></p>
                    <?php } ?>

                    <?php if ($discounts) { ?>
                        <?php foreach ($discounts as $discount) { ?>
                            <p><small><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></small></p>
                        <?php } ?>
                    <?php } ?>

                    <?php if ($options) { ?>
                        <div class="detail_option">
                            <h2><?php echo $text_option; ?></h2>
                            <?php foreach ($options as $option) { ?>
                                <?php if ($option['type'] == 'checkbox') { ?>
                                    <?php if ($option['required']) { ?>
                                        <span class="required">*</span>
                                        <label><?php echo $option['name']; ?>:</label><br />
                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                            </label>
                                            <br />
                                        <?php } ?>
                                        <br />
                                    <?php } ?>
                                <?php } ?>
                                <?php if ($option['type'] == 'radio') { ?>
                                    <?php if ($option['required']) { ?>
                                        <span class="required">*</span>
                                        <label><?php echo $option['name']; ?>:</label><br />
                                        <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                            <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                            </label>
                                            <br />
                                        <?php } ?>
                                        <br />
                                    <?php } ?>
                                <?php } ?>
                                <?php if ($option['type'] == 'select') { ?>
                                    <?php if ($option['required']) { ?>
                                        <span class="required">*</span>
                                        <label><?php echo $option['name']; ?>:</label><br />
                                        <select name="option[<?php echo $option['product_option_id']; ?>]">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                                </option>
                                            <?php } ?>
                                        </select>
                                    <?php } ?>
                                    <br /><br />
                                <?php } ?>
                            <?php } ?>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>

            <div class="qty">
                <div class="left">
                    <label><?php echo $text_qty; ?></label>
                    <input type="text" class="txt" name="quantity" size="2" value="<?php echo $minimum; ?>" />
                    <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                </div>
                <input type="button" class="btn left" value="<?php echo $button_cart; ?>" id="button-cart" />
                <div class="clear"></div>
                <?php if ($minimum > 1) { ?>
                    <div class="minimum"><?php echo $text_minimum; ?></div>
                <?php } ?>
            </div>

            <?php if ($review_status) { ?>
                <div class="review">
                    <img src="catalog/view/theme/fizruk/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
                </div>
                <div class="review">
                    <div class="share">
                        <div class="addthis_default_style">
                            <a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a>
                        </div>
                        <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
                    </div>
                </div>
            <?php } ?>

        </div>
        <div class="clear"></div>

        <div id="tabs" class="htabs">
            <a href="#tab-description" class="ahtabs selected"><?php echo $tab_description; ?></a>
            <?php if ($attribute_groups) { ?>
                <a href="#tab-attribute" class="ahtabs"><?php echo $tab_attribute; ?></a>
            <?php } ?>
            <?php if ($review_status) { ?>
                <a href="#tab-review" class="ahtabs"><?php echo $tab_review; ?></a>
            <?php } ?>
            <?php if ($products) { ?>
                <a href="#tab-related" class="ahtabs"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
            <?php } ?>
        </div>

        <div id="tab-description" class="tab-content"><?php echo $description; ?></div>

        <?php if ($attribute_groups) { ?>
            <div id="tab-attribute" class="tab-content" style="display: none;">
                <table class="attribute">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <thead>
                        <tr>
                            <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                            <td><?php echo $attribute['name']; ?>:</td>
                            <td><?php echo $attribute['text']; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                    <?php } ?>
                </table>
            </div>
        <?php } ?>

        <?php if ($review_status) { ?>
            <div id="tab-review" class="tab-content">
                <div id="review"></div>
                <h2 id="review-title"><?php echo $text_write; ?></h2>
                <b><?php echo $entry_name; ?></b><br />
                <input type="text" name="name" value="" />
                <br />
                <br />
                <b><?php echo $entry_review; ?></b>
                <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
                <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
                <br />
                <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
                <input type="radio" name="rating" value="1" />
                &nbsp;
                <input type="radio" name="rating" value="2" />
                &nbsp;
                <input type="radio" name="rating" value="3" />
                &nbsp;
                <input type="radio" name="rating" value="4" />
                &nbsp;
                <input type="radio" name="rating" value="5" />
                &nbsp;<span><?php echo $entry_good; ?></span><br />
                <br />
                <b><?php echo $entry_captcha; ?></b><br />
                <input type="text" name="captcha" value="" />
                <br />
                <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
                <br />
                <div class="buttons">
                    <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
        <?php } ?>

    </div>

    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>


<?php /* ?>

  <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  
  <?php if ($products) { ?>
  <div id="tab-related" class="tab-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a></div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>
  <?php if ($tags) { ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<?php echo $footer; ?>


<?php */ ?>