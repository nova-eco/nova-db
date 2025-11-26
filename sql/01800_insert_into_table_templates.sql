USE nova;

/*
 * @script     01800_insert_into_table_templates.sql
 *
 * @created    26th November 2025
 * @author     admin <admin@nova.eco>
 */
INSERT INTO `templates` VALUES
('225072ad-1b38-4136-b6a3-ba8e5ea42312','e6d1fa69-3d25-4bae-83cc-2facd49bbb99','A template for a registration message.','registrationmessage','\n		<html>\n		<body>\n			Hi {{ forename}} {{ surname }},\n\n			Please click on the link below to verify your new user registration.\n\n			<a href=\"http://localhost:3000/registration/{{ registrationId }}/verify/{{ accessCode }}\">Verify link</a>\n     \n			Kind regards,\n\n			Admin (nova.eco)\n		</body>\n		</html>\n  ','2025-11-12 07:24:39','2025-11-12 07:24:39'),
('c25bffe5-72e4-4adc-9a75-b57f442883bd','ea2cdd44-720f-47d9-b7ab-28920f44c478','A template for a company name.','companyname','Company: {{name}}','2025-11-12 07:24:39','2025-11-12 07:24:39');
