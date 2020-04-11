<?php echo $header; ?>
<div class="container cont_page">
<?php echo $pixelshopcat_pos1;?>
<?php if ($pixelshopcat_pos2 || $pixelshopcat_pos3) { ?>
<div class="row">
	<?php echo $pixelshopcat_pos2;?>
	<?php echo $pixelshopcat_pos3;?>	
</div>
<?php } ?>
  <div class="row">
	<?php if(($menu_open_category =='1') && ($main_menu =='1') && ($column_left)) { ?>
		<script type="text/javascript">
		if(window.matchMedia("(min-width: 992px)").matches){
			$('header #menu-list').addClass("nsmenu-block");
			var banner_privilege_h  = $('header .banner-privilege').outerHeight();
			if(banner_privilege_h != null ){
				$('header #menu-list').css('margin-top', banner_privilege_h+9);
			}
			$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight()});});
			
		}
		$(window).resize(function() {
			if ($(window).width() > 992) {
				$('header #menu-list').addClass("nsmenu-block");
				var banner_privilege_h  = $('header .banner-privilege').outerHeight();
				if(banner_privilege_h != null ){
					$('header #menu-list').css('margin-top', banner_privilege_h+9);
				}
				$(function(){$('#column-left').css({'margin-top': $('header #menu-list').outerHeight()});});
			} else {
				$('header #menu-list').removeClass("nsmenu-block");
			}
		});
		</script>
	<?php } ?>
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-6'; ?>
	<?php $cols_class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-9'; ?>
	<?php $cols_class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
	<?php $cols_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	<ul class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
		<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>			<?php if($i+1<count($breadcrumbs)){ ?>				<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">					<a itemprop="item" href="<?php echo $breadcrumb['href']; ?>">						<?php if($i == 0){?>						  <meta itemprop="name" content="<?php echo $breadcrumb['text']; ?>" />						  <span><?php echo $breadcrumb['text']; ?></span>						<?php } else { ?>						  <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>						<?php } ?>					</a>					<meta itemprop="position" content="<?php echo $i+1; ?>" />				  </li>			<?php } else { ?>				<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">				<link itemprop="item" href="<?php echo $breadcrumb['href']; ?>">				<?php if($i == 0){?>				  <meta itemprop="name" content="<?php echo $breadcrumb['text']; ?>" />				  <span><?php echo $breadcrumb['text']; ?></span>				<?php } else { ?>				  <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>				<?php } ?>				<meta itemprop="position" content="<?php echo $i+1; ?>" />				</li>			<?php } ?>		<?php } ?>
	</ul>
  <?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
	  <?php if(!isset($pixelshop_store['config_catalog_category_description_dropped'])) { ?>
	  <?php if ($thumb || $description) { ?>
		  <div class="category_description psbtb">
			<?php if ($thumb) { ?>
			<div class="psfl-l"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
			<?php } ?>
			<?php if ($description) { ?>
				<div itemprop="description"><?php echo $description; ?></div>
			<?php } ?>
		  </div>
		  <?php } ?>
     <?php } ?>
	  <?php if ($categories) { ?>
      <div class="row">
          <?php foreach ($categories as $category) { ?>
			<div class="col-sm-6 col-md-4 col-lg-3">  	
				<div class="thumbnail subcategory">
					<a href="<?php echo $category['href']; ?>">
						<div class="pull-left">
							<img alt="<?php echo $category['name']; ?>" src="<?php echo $category['thumb']; ?>"> 
						</div>
						<div class="name-wrapper">
							<div class="display-table">
								<div class="display-table-cell">
									<h5><?php echo $category['name']; ?></h5>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
          <?php } ?>         
      </div>
      <?php } ?>
      <?php if ($products) { ?>
			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="btn-group hidden-xs localstorage">
						<button type="button" id="grid-view" class="btn btn-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
						<button type="button" id="list-view" class="btn btn-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
					<?php if($pixelshop_store['config_price_list_view_on_off']) { ?>
						<button type="button" id="price-view" class="btn btn-view" data-toggle="tooltip" title="<?php echo $button_price; ?>">
							<i class="fa fa-align-justify"></i>
						</button>
					<?php } ?>
					</div>
				</div>
				<div class="col-xs-12 col-sm-5 col-md-6 text-right">
					<div class="input-group">
						<span class="input-group-addon ps-sort-input"><i class="fa fa-sort-amount-asc fa-rw" aria-hidden="true"></i>&nbsp;<span class="hidden-xs hidden-sm hidden-md"><?php echo $text_sort; ?></span></span>
						<select id="input-sort" class="form-control" onchange="location = this.value;">
							<?php foreach ($sorts as $sorts) { ?>
								<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3 col-md-3 text-right">
					<div class="input-group">
						<span class="input-group-addon ps-limit-input"><i class="fa fa-eye"></i>&nbsp;<span class="hidden-xs hidden-sm hidden-md"><?php echo $text_limit; ?></span>
						</span>
						<select id="input-limit" class="form-control" onchange="location = this.value;">
							<?php foreach ($limits as $limits) { ?>
							<?php if ($limits['value'] == $limit) { ?>
							<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>
			</div>
		
	<div>
      <div class="row row-price">
        <?php foreach ($products as $product) { ?>
			<div class="product-layout product-grid <?php echo $cols_class;?>">
			<div class="product-thumb">
			
				<?php if($config_on_off_category_page_quickview =='1'){?>
					<div class="quickview"><a class="btn btn-quickview" onclick="quickview_open(<?php echo $product['product_id']?>);"><i class="fa fa-external-link fa-fw"></i><?php echo $config_quickview_btn_name[$lang_id]['config_quickview_btn_name']; ?></a></div>
				<?php } ?>
				<div class="image">	
					<div class="stickers-ns">
							<?php if (($on_off_sticker_special == '1') && $product['special']) { ?>
								<div class="sticker-ns special">
									<i class="<?php echo $pixelshop_store['config_change_icon_sticker_special'];?> fa-fw"></i>					
									<span><?php echo $pixelshop_store['config_change_text_sticker_special'][$lang_id]['config_change_text_sticker_special']; ?></span>	
								</div>
							<?php } ?>
							<?php if(($on_off_sticker_topbestseller == '1') && ($product['top_bestsellers'] >= $pixelshop_store['config_limit_order_product_topbestseller'])) { ?>
								<div class="sticker-ns bestseller">
									<i class="<?php echo $pixelshop_store['config_change_icon_sticker_topbestseller'];?> fa-fw"></i>
									<span><?php echo $pixelshop_store['config_change_text_sticker_topbestseller'][$lang_id]['config_change_text_sticker_topbestseller']; ?></span>	
								</div>
							<?php } ?>
							<?php if(($on_off_sticker_popular == '1') && ($product['viewed']>=$pixelshop_store['config_min_quantity_popular'])) { ?>
								<div class="sticker-ns popular">
									<i class="<?php echo $pixelshop_store['config_change_icon_sticker_popular'];?> fa-fw"></i>
									<span><?php echo $pixelshop_store['config_change_text_sticker_popular'][$lang_id]['config_change_text_sticker_popular']; ?></span>								
								</div>
							<?php } ?>
							<?php if(($on_off_sticker_newproduct == '1') && (isset($product['date_available'])&&(round((strtotime(date("Y-m-d"))-strtotime($product['date_available']))/86400))<=$pixelshop_store['config_limit_day_newproduct'])) { ?>
								<div class="sticker-ns newproduct">
									<i class="<?php echo $pixelshop_store['config_change_icon_sticker_newproduct'];?>"></i>
									<?php echo $pixelshop_store['config_change_text_sticker_newproduct'][$lang_id]['config_change_text_sticker_newproduct']; ?>	
								</div>
							<?php } ?>
					</div>	
					<?php if($pixelshop_store['config_on_off_category_page_slider_additional_image'] =='1') { ?>		
					<div class="image-carousel-category">			
						<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>		
					<?php foreach ($product['additional_img'] as $img) { ?>			
						<a class="hidden additional-image" href="<?php echo $product['href']; ?>"><img class="img-responsive" src="<?php echo $img;?>" alt="" title="" /></a>			
					<?php } ?>
					</div>
					<?php } elseif($pixelshop_store['config_on_off_category_page_slider_additional_image'] =='2') { ?>
						<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> <?php if($product['additional_image_hover']) { ?> data-additional-hover="<?php echo $product['additional_image_hover'];?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
					<?php } else { ?>	
						<a href="<?php echo $product['href']; ?>"><img <?php if ($product['product_quantity'] <= 0 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>"<?php } ?> src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
					<?php } ?>
					<?php if($show_special_timer_page =='1' && $product['special']){ ?>
						<div class="action-timer">
							<div id="countdown-category-<?php echo $product['product_id'];?>"></div>		
						</div>
						<script type="text/javascript">
							$(function(){
								var note = $('#note'),
								ts = new Date('<?php echo $product['str_timer_1'];?>', '<?php echo $product['str_timer_2'];?>', '<?php echo $product['str_timer_3']?>'),
								newYear = true;
								if((new Date()) > ts){
									ts = (new Date()).getTime() + 10*24*60*60*1000;
									newYear = false;
								}
								$('#countdown-category-<?php echo $product['product_id'];?>').countdown({
									timestamp: ts,
									callback: function(days, hours, minutes, seconds){						
										var message = "";		
										message += days;
										message += hours;
										message += minutes;
										message += seconds;											
										note.html(message);
										}
								});
							});
						</script>
					<?php } ?>	
					<div class="action-top">
						<?php if($on_off_category_page_model_product) { ?>
							<div class="product-model"><?php echo $product['model']?></div>
						<?php } ?>
						<?php if($on_off_category_page_wishlist) { ?>
							<div class="wishlist"><button class="btn btn-wishlist" type="button" data-placement="left" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button></div>
						<?php } ?>
						<?php if($on_off_category_page_compare) { ?>
							<div class="compare"><button class="btn btn-compare" type="button" data-placement="left" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button></div>
						<?php } ?>
						<?php if($ns_on_off_module_quick_order =='1') { ?>
							<div class="quick-order">
								<?php if($on_off_category_page_fastorder){ ?>
								<button class="btn btn-fastorder <?php if (($product['product_quantity'] <= 0) and $disable_fastorder_button){ ?>hidden-quick-order<?php } ?>" type="button" data-placement="left" data-toggle="tooltip" onclick="fastorder_open(<?php echo $product['product_id']?>);" title="<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>">
									<?php if($icon_open_form_send_order !=''){ ?>
										<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="<?php echo $icon_open_form_send_order;?> fa-fw"></i>
									<?php } else { ?>
										<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="fa fa-shopping-bag fa-fw"></i>
									<?php } ?>
								</button>
								<?php } ?>
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="caption">
					<div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					<?php if($on_off_category_page_model_product) { ?>
						<div class="product-model-priceview"><?php echo $product['model']?></div>
					<?php } ?>					
					<div class="product-description-list cat-p"><?php echo $product['description']; ?></div>	
					<?php if($short_attribute_status_category) { ?>
					<?php if($category_one_attribute_status) { ?>
						<?php if ($product['attribute_groups']) { ?>
							<div class="short-attributes-groups-category-list">
								<?php foreach ($product['attribute_groups'] as $key => $attribute_group) { ?>
									<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
										<?php if ($attribute['attribute_id'] == $pixelshop_store['category_one_attribute_id']) { ?>
											<?php if($attribute_name_status_category) { ?><span class="attr-name"><?php echo $attribute['name']; ?>:</span><?php } ?>
											<span class="attr-text"><?php echo $attribute['text']; ?></span>
										<?php } ?>
									<?php } ?>	
								<?php } ?>
							</div>
						<?php } ?>
					<?php } else { ?>
						<?php if ($product['attribute_groups']) { ?>
							<div class="short-attributes-groups-category-list">
								<?php foreach ($product['attribute_groups'] as $key => $attribute_group) { ?>
									<?php if ($key < $pixelshop_store['short_attribute_group_category']) { ?>
										<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
											<?php if ($key < $pixelshop_store['short_attribute_group_category_item']) { ?>
												<?php if($attribute_name_status_category) { ?><span class="attr-name"><?php echo $attribute['name']; ?>:</span><?php } ?>
												<span class="attr-text"><?php echo $attribute['text']; ?></span>
											<?php } ?>
										<?php } ?>	
									<?php } ?>
								<?php } ?>
							</div>
						<?php } ?>
					<?php } ?>
				<?php } ?>
					<?php if ($show_options) { ?>
						<div id="option_productpage_<?php echo $product['product_id']; ?>" class="option productpage-opt">
							<?php foreach ($product['options'] as $key => $option) { ?>	
								<?php if ($option['type'] == 'select' || $option['type'] == 'radio') { ?>
									<div class="form-group">
										<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
											<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
											<?php echo $option['name']; ?>
										</label>
									  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<?php if ($option_value['image'] || $option_value['color']) { ?>
												<?php if ($option['status_color_type'] =='1') { ?>
													<div class="image-radio">
													  <label>
														<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>
													  </label>
													</div>
												<?php } else { ?>
													<div class="image-radio">
													  <label>
														<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
													  </label>
													</div>
												<?php } ?>
											<?php } else { ?>
												<div class="radio-checbox-options">
													<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
													<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage">
														<span class="option-name"><?php echo $option_value['name']; ?></span>
														<?php if ($option_value['price']) { ?>
														<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
														<?php } ?>
													</label>
												</div>
											<?php } ?>
										<?php } ?>
									  </div>
									</div>
									<?php } ?>
									<?php if ($option['type'] == 'checkbox') { ?>
									<div class="form-group">
									  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
											<?php if ($option['required']) { ?><i class="fa fa-exclamation-triangle required" data-toggle="tooltip" data-placement="left" title="<?php echo $required_text_option; ?>"></i><?php } ?>
											<?php echo $option['name']; ?>
										</label>
									  <div id="input-option-productpage<?php echo $option['product_option_id']; ?>">
										<?php foreach ($option['product_option_value'] as $option_value) { ?>
											<?php if ($option_value['image'] || $option_value['color']) { ?>
												<?php if ($option['status_color_type'] =='1') { ?>
													<div class="image-radio">
													  <label>
														<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<span for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" class="color-option" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" style="background-color:<?php echo $option_value['color']?>"></span>
													  </label>
													</div>
												<?php } else { ?>
													<div class="image-radio">
													  <label>
														<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
														<img for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" data-toggle="tooltip" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /> 
													  </label>
													</div>
												<?php } ?>
											<?php } else { ?>
												<div class="radio-checbox-options">
													<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage" />
													<label for="input-value-<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>_productpage">
														<span class="option-name"><?php echo $option_value['name']; ?></span>
														<?php if ($option_value['price']) { ?>
														<span class="option-price"><?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?></span>
														<?php } ?>
													</label>
												</div>
											<?php } ?>										
										<?php } ?>
									  </div>
									</div>
									<?php } ?>
								<?php } ?>
								<?php if (!empty($product['discounts'])) { ?>
                  <ul class="product-price list-unstyled" style="border:none;">
                      <?php foreach ($product['discounts'] as  $discount) { ?>
                          <li><?php echo sprintf('%s %s %s',     $discount['quantity'], ' или более: ', $discount['price']); ?></li>
                      <?php } ?>
                  </ul>
              <?php } ?>
						</div>
					<?php } ?>		
							<?php if($on_off_category_page_rating) { ?>
								<div class="rating">
								
									<span class="rating-box">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
											<?php if ($product['rating'] < $i) { ?>
												<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } else { ?>
												<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } ?>
										<?php } ?>
									<?php if($on_off_category_page_quantity_reviews) { ?>
										<span class="quantity-reviews"><a data-placement="right"  data-toggle="tooltip" title="<?php echo $text_reviews_title;?>" href="<?php echo $product['href']; ?>/#tab-review"><?php echo $product['reviews']; ?></a></span>
									<?php } ?>
									</span>
								</div>
							<?php } ?>
							<?php if ($product['price']) { ?>
								<div class="price">
									<?php if (!$product['special']) { ?>
										<span class="price-default"><?php echo $product['price']; ?></span>
									<?php } else { ?>
										<span class="price-old"><?php echo $product['price']; ?></span>
										<span class="price-new"><?php echo $product['special']; ?>
										<?php if ($product['special']) { ?>
											<span class="procent-skidka"><?php echo round($product['skidka']);?> %</span>
										<?php } ?>
										</span>
									<?php } ?>
									<?php if ($product['tax']) { ?>
										<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
									<?php } ?>
								</div>
							<?php } ?>
							<div class="price-view-price">
								<?php if (!$product['special']) { ?>
									<span class="price-default"><span class="change-price<?php echo $product['product_id']; ?>" data-price="<?php echo $product['price_no_format']; ?>"><?php echo $product['price']; ?></span></span>
								<?php } else { ?>
									<span class="price-old change-price<?php echo $product['product_id']; ?>" data-price="<?php echo $product['price_no_format']; ?>">&nbsp;<?php echo $product['price']; ?>&nbsp;</span> <span class="price-new change-special<?php echo $product['product_id']; ?>" data-price="<?php echo $product['special_no_format']; ?>"><?php echo $product['special']; ?></span>
								<?php } ?>
								<?php if ($product['tax']) { ?>
								  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								<?php } ?>
							</div>
							<div class="quantity_cart-view-price">
								<div class="quick-cell-content pquantity">
									<div class="input-group popup-quantity">
										<span class="input-group-btn">
											<button onclick="btnminus_cat_price<?php echo $product['product_id'];?>('<?php echo $product['minimum']; ?>');" type="button" class="btn btn-update-popup">-</button>
										</span>
											<input id="htopcat_list<?php echo $product['product_id'];?>" class="htopcat<?php echo $product['product_id'];?> form-control" name="<?php echo $product['product_id']; ?>" oninput="recalc(<?php echo $product['product_id']; ?>);" size="2" value="<?php echo $product['minimum']; ?>">
										<span class="input-group-btn">
											<button onclick="btnplus_cat_price<?php echo $product['product_id'];?>();" type="button" class="btn btn-update-popup">+</button>
										</span>
									</div>
								</div>
							</div>
							<script type="text/javascript">
								function btnminus_cat_price<?php echo $product['product_id'];?>(a){
									document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value>a?document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value--:document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value=a;										
									recalc(<?php echo $product['product_id'];?>);						
								}
								function btnplus_cat_price<?php echo $product['product_id'];?>(){
									document.getElementById("htopcat_list<?php echo $product['product_id'];?>").value++;
									recalc(<?php echo $product['product_id'];?>);							
								};																				
							</script>
						<div class="actions">
							<?php if (($product['product_quantity'] <= 0) && $disable_cart_button){ ?>
								<div class="cart"><button class="btn btn-general" type="button" disabled><?php if($change_text_cart_button_out_of_stock ==1) { ?><i class="fa fa-minus-square out_of_stock"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
							<?php } else { ?>
								<div class="cart"><button class="btn btn-general" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>','productpage', $('.quantity_cart-view-price').find('input.htopcat<?php echo $product['product_id'];?>[name^=<?php echo $product['product_id']; ?>]').val());"><?php if($change_text_cart_button_out_of_stock ==1 && $product['product_quantity'] <= 0) { ?><i class="fa fa-minus-square out_of_stock"></i> <span><?php echo $disable_cart_button_text; ?></span><?php } else { ?><i class="fa fa-shopping-basket"></i> <span><?php echo $button_cart; ?></span><?php } ?></button></div>
							<?php } ?>
							<div class="list-quick-order">	
								<?php if($ns_on_off_module_quick_order =='1') { ?>
								<?php if($on_off_category_page_fastorder){ ?>
									<button class="btn btn-fastorder <?php if (($product['product_quantity'] <= 0) && $disable_fastorder_button){ ?>hidden-quick-order<?php } ?>" type="button" data-toggle="tooltip" onclick="fastorder_open(<?php echo $product['product_id']?>);" title="<?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?>">
										<?php if($icon_open_form_send_order !=''){ ?>
											<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="<?php echo $icon_open_form_send_order;?> fa-fw"></i>
										<?php } else { ?>
											<i style="color:#<?php echo $color_button_open_form_send_order ;?>;" class="fa fa-shopping-bag fa-fw"></i>
										<?php } ?>
										<span class="hidden-xs"><?php echo $config_text_open_form_send_order[$lang_id]['config_text_open_form_send_order']; ?></span>
									</button>
								<?php } ?>
								<?php } ?>
							</div>
						</div>						
				</div>				
          </div>
			<div class="catalogCard-extra">
			<?php if($config_on_off_category_page_description_grid) { ?>
				<div class="product-description-grid cat-p-grid"><?php echo $product['description']; ?></div>
			<?php } ?>
				<?php if($short_attribute_status_category) { ?>
					<?php if($category_one_attribute_status) { ?>
						<?php if ($product['attribute_groups']) { ?>
							<div class="short-attributes-groups-category">
								<?php foreach ($product['attribute_groups'] as $key => $attribute_group) { ?>
									<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
										<?php if ($attribute['attribute_id'] == $pixelshop_store['category_one_attribute_id']) { ?>
											<?php if($attribute_name_status_category) { ?><span class="attr-name"><?php echo $attribute['name']; ?>:</span><?php } ?>
											<span class="attr-text"><?php echo $attribute['text']; ?></span>
										<?php } ?>
									<?php } ?>	
								<?php } ?>
							</div>
						<?php } ?>
					<?php } else { ?>
						<?php if ($product['attribute_groups']) { ?>
							<div class="short-attributes-groups-category">
								<?php foreach ($product['attribute_groups'] as $key => $attribute_group) { ?>
									<?php if ($key < $pixelshop_store['short_attribute_group_category']) { ?>
										<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
											<?php if ($key < $pixelshop_store['short_attribute_group_category_item']) { ?>
												<?php if($attribute_name_status_category) { ?><span class="attr-name"><?php echo $attribute['name']; ?>:</span><?php } ?>
												<span class="attr-text"><?php echo $attribute['text']; ?></span>
											<?php } ?>
										<?php } ?>	
									<?php } ?>
								<?php } ?>
							</div>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			</div>
        </div>
        <?php } ?>
      </div>
      </div>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
        <div class="col-sm-12 text-right"><?php echo $results; ?></div>
      </div>
		<br />
		  <script type="text/javascript"><!--
	function price_format(n){ 	
		c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
		d = '<?php echo $currency['decimal_point']; ?>';
		t = '<?php echo $currency['thousand_point']; ?>';
		s_left = '<?php echo $currency['symbol_left']; ?>';
		s_right = '<?php echo $currency['symbol_right']; ?>';
		n = n * <?php echo $currency['value']; ?>;
		i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
		j = ((j = i.length) > 3) ? j % 3 : 0; 
		return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
	}
	//--></script>
      <?php } ?>
	  <?php if(isset($pixelshop_store['config_catalog_category_description_dropped']) && $pixelshop_store['config_catalog_category_description_dropped'] ==1) { ?>
	   <?php if ($thumb || $description) { ?>
		  <div class="category_description psbt">
			<?php if ($thumb) { ?>
			<div class="psfl-l"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
			<?php } ?>
			<?php if ($description) { ?>
				<div><?php echo $description; ?></div>
			<?php } ?>
		  </div>
		  <?php } ?>
		 <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
		<?php echo $content_bottom; ?></div>
		<?php echo $column_right; ?></div>
		<?php if ($pixelshopcat_pos4 || $pixelshopcat_pos5) { ?>
		<div class="row">
			<?php echo $pixelshopcat_pos4;?>
			<?php echo $pixelshopcat_pos5;?>	
		</div>
		<?php } ?>
		<?php if ($pixelshopcat_pos6 || $pixelshopcat_pos7 || $pixelshopcat_pos8 || $pixelshopcat_pos9) { ?>
			<div class="row">
				<?php echo $pixelshopcat_pos6;?>
				<?php echo $pixelshopcat_pos7;?>
				<?php echo $pixelshopcat_pos8;?>
				<?php echo $pixelshopcat_pos9;?>
			</div>
		<?php } ?>	
		<?php echo $pixelshopcat_pos10;?>
</div>
<?php echo $pixelshopcat_pos11;?>
<?php if($pixelshop_store['config_on_off_category_page_slider_additional_image'] =='1') { ?>	
<script type="text/javascript">
$(window).load(function() {
if (localStorage.getItem('display') != 'price'){
	$(".additional-image").removeClass('hidden');
		$(".image-carousel-category").owlCarousel({
			singleItem:true,
			navigation : true, 
			pagination:false,
			navigationText: ['<div class="btn btn-carousel-image-additional next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-image-additional prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],		
			transitionStyle: '<?php echo $pixelshop_store['config_select_category_page_additional_animate_method'];?>'
		});
} 
$('#list-view').click(function(e){
$(".additional-image").addClass('hidden');
        e.preventDefault();
	setTimeout(function () {
		$(".image-carousel-category").each(function() { 
		 var items = $(this);
			for (var i = 0; i < items.length; i++) {
				if($(items).data('owlCarousel')){
					$(items).data('owlCarousel').destroy();
				}
				$(".additional-image").removeClass('hidden');
					$(items).owlCarousel({
								navigation : true,
								singleItem:true,
								pagination:false,
								navigationText: ['<div class="btn btn-carousel-image-additional list next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-image-additional prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],		
								transitionStyle: '<?php echo $pixelshop_store['config_select_category_page_additional_animate_method'];?>'
					});	
			} 
		}); 
	}, 200);
});	
$('#grid-view').click(function(e){
$(".additional-image").addClass('hidden');
    e.preventDefault();
	setTimeout(function () {
		$(".image-carousel-category").each(function() { 
		 var items = $(this);
			for (var i = 0; i < items.length; i++) {
				if($(items).data('owlCarousel')){
					$(items).data('owlCarousel').destroy();
				}
				$(".additional-image").removeClass('hidden');
					$(items).owlCarousel({
								navigation : true, 								
								pagination:false,
								navigationText: ['<div class="btn btn-carousel-image-additional list next-prod"><i class="fa fa-angle-left arrow"></i></div>', '<div class="btn btn-carousel-image-additional prev-prod"><i class="fa fa-angle-right arrow"></i></div>'],		
								singleItem:true,
								transitionStyle: '<?php echo $pixelshop_store['config_select_category_page_additional_animate_method'];?>'
					});	
			} 
		}); 
	}, 200);	 
});
$('#price-view').click(function(e){	
$(".additional-image").addClass('hidden');
e.preventDefault(); 
	$(".image-carousel-category").each(function() { 
		var items = $(this);
		for (var i = 0; i < items.length; i++) {
			$(items).data('owlCarousel').destroy();
		} 
	}); 
});
});
</script>
<?php } ?>
<?php echo $footer; ?>
