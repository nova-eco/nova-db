USE nova;

/*
 * @script     01360_insert_into_table_servicePriceTypes.sql
 *
 * @created    26th November 2025
 * @author     admin <admin@nova.eco>
 */
INSERT INTO `servicePriceTypes` VALUES
('3526f2fd-6e5a-4063-ae6c-cf0271301b68','A minimum company product price discount type.','min','2025-11-12 07:24:39','2025-11-12 07:24:39'),
('9aec9fd2-a15d-4c7c-8a47-ef0bbef0ca43','An OAP specific company product price discount type.','discount:oap','2025-11-12 07:24:39','2025-11-12 07:24:39'),
('9ed1776f-0875-43cd-9b41-0f40d6107506','A \'discount\' company product price type.','discount:general','2025-11-12 07:24:39','2025-11-12 07:24:39');
