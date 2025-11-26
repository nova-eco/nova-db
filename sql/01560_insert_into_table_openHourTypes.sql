USE nova;

/*
 * @script     01560_insert_into_table_openHourTypes.sql
 *
 * @created    26th November 2025
 * @author     admin <admin@nova.eco>
 */
INSERT INTO `openHourTypes` VALUES
('256dd1b8-f8f8-4ba8-9bc6-4e994ef71de0','An \'OpenHour\' type for the start of a lunch period.','lunch_start',200,'2025-11-12 07:24:39','2025-11-12 07:24:39'),
('53ab952d-8dc9-4f0e-aa4d-10b99318a447','An \'OpenHour\' type for the end of a working day.','day_end',400,'2025-11-12 07:24:39','2025-11-12 07:24:39'),
('85616e0f-66b2-4c82-a2bc-7ab183f06905','An \'OpenHour\' type for the start of a working day.','day_start',100,'2025-11-12 07:24:39','2025-11-12 07:24:39'),
('b6940197-1fa4-4d1a-b615-588eb15d807b','An \'OpenHour\' type for the end of a lunch period.','lunch_end',300,'2025-11-12 07:24:39','2025-11-12 07:24:39');
