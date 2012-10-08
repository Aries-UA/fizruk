<?php
// Heading
$_['heading_title']    = 'Группы покупателей';

// Text
$_['text_success']     = 'Группы покупателей изменены!';

// Column
$_['column_name']      = 'Название группы покупателей';
$_['column_sort_order']= 'Порядок сортировки';
$_['column_action']    = 'Действие';

// Entry
$_['entry_name']       = 'Название группы покупателей:';
$_['entry_description']         = 'Описание:';
$_['entry_approval']            = 'Подтверждение новых покупателей:<br /><span class="help">Зарегистрированные покупатели должны быть проверены и подтверждены администратором, только после этого смогут пользоваться своей учетной записью и преимуществами зарегистрированных пользователей.</span>';
$_['entry_company_id_display']  = 'Использовать поле "Регистрационный номер компании":'; // <br /><span class="help"></span>
$_['entry_company_id_required'] = 'Требуется рег. номер компании:<br /><span class="help">Выберите, каким группам пользователей необходимо указывать их рег. номер компании для использования в платёжных адресах при оформлении заказа.</span>';
$_['entry_tax_id_display']      = 'Использовать налоговый номер:<br /><span class="help">Отображать поле налогового номера компании в платежных адресах?</span>';
$_['entry_tax_id_required']     = 'Требуется указание налогового номера:<br /><span class="help">Выберите, каким группам пользователей необходимо указывать их налоговый номер компании (Tax ID) для использования в платёжных адресах при оформлении заказа.</span>';
$_['entry_sort_order']          = 'Порядок сортировки:';

// Error
$_['error_permission'] = 'У Вас нет прав для изменения групп покупателей!';
$_['error_name']       = 'Название группы должно быть от 3 до 64 символов!';
$_['error_default']    = 'Эта группу покупателей нельзя удалить, поскольку она назначена для основного магазина!';
$_['error_store']      = 'Эта группу покупателей нельзя удалить, поскольку она используется в %s магазине(ах)!';
$_['error_customer']   = 'Эта группу покупателей нельзя удалить, поскольку в нее входит %s покупатель(ей)!';
?>