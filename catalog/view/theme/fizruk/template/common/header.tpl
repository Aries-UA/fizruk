<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><?php echo $title; ?></title>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <meta name="copyright" content="Aries corp." />
    <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <base href="<?php echo $base; ?>" />
    <link href="catalog/view/theme/fizruk/css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
</head>
<html lang="<?php echo $lang; ?>">
<body>
    <div id="wrapper">

        <div class="header_bg">
            <div class="header">
                <a href="/" class="logo left">
                    <img src="catalog/view/theme/fizruk/images/logo.png" alt="" />
                </a>
                <div id="headerCart">
                    <?php echo $cart; ?>
                </div>
                <div class="separator_1 left"></div>
                <div class="search_wrapper left">
                    <div class="search">
                        <input type="button" id="btn_search" class="btn_search left" value="" />
                        <?php if ($filter_name) { ?>
                            <input type="text" id="inp_search" name="filter_name" class="inp_search left" value="<?php echo $filter_name; ?>" />
                        <?php } else { ?>
                            <input type="text" id="inp_search" name="filter_name" class="inp_search left" value="<?php echo $text_search; ?>" onclick="this.value = '';" />
                        <?php } ?>  
                    </div>
                    <div class="user_info">
                        <?php if (!$logged) { ?>
                        <p class="right">Добро пожаловать <span>Гость</span>!</p>
                        <p class="right">
                            <?php echo $text_welcome; ?>
                        </p>
                        <?php } else { ?>
                            <p class="right">
                                <?php echo $text_logged; ?>
                            </p>
                        <?php } ?>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>

        <div class="content_bg">
            <div class="content">
                <div class="menu">
                    <div class="top_menu">
                        <a href="">Главная</a>
                        <div class="delim_menu"></div>
                        <a href="">Оплата и доставка</a>
                        <div class="delim_menu"></div>
                        <a href="">О Компании</a>
                        <div class="delim_menu"></div>
                        <a href="">Обратная связь</a>
                    </div>
                </div>

                <div id="notification"></div>

                <div class="center">
