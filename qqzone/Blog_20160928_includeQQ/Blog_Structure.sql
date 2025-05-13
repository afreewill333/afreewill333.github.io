CREATE TABLE `blog` (
`id` int(11) NOT NULL,
`name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`entry_number` int(11) NULL DEFAULT NULL,
`recent_comment_number` int(11) NULL DEFAULT NULL,
`recent_entry_number` int(11) NULL DEFAULT NULL,
`recent_guestbook_number` int(11) NULL DEFAULT NULL,
`recent_category_number` int(11) NULL DEFAULT NULL,
`friend_link_number` int(11) NULL DEFAULT NULL,
`often_link_number` int(11) NULL DEFAULT NULL,
`backend_page_size` int(11) NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`comment_audit` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `category` (
`id` int(11) NOT NULL,
`blog_id` int(11) NULL DEFAULT NULL,
`name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`display_order` int(11) NULL DEFAULT NULL,
`description` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`type_id` int(11) NOT NULL,
`father_id` int(11) NULL DEFAULT NULL,
`level` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_4` (`blog_id`),
INDEX `category_fk` (`father_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `comment` (
`id` int(11) NOT NULL,
`photo_id` int(11) NULL DEFAULT NULL,
`file_id` int(11) NULL DEFAULT NULL,
`entry_id` int(11) NULL DEFAULT NULL,
`mood_id` int(11) NULL DEFAULT NULL,
`link_id` int(11) NULL DEFAULT NULL,
`author` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`email` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`content` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`created_time` datetime NULL DEFAULT NULL,
`ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_10` (`photo_id`),
INDEX `FK_Relationship_11` (`file_id`),
INDEX `FK_Relationship_12` (`mood_id`),
INDEX `FK_Relationship_3` (`entry_id`),
INDEX `link_id` (`link_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `entry` (
`id` int(11) NOT NULL,
`category_id` int(11) NULL DEFAULT NULL,
`title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
`comment_hit` int(11) NULL DEFAULT NULL,
`allow_comment` int(11) NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`created_time` datetime NULL DEFAULT NULL,
`updated_time` datetime NULL DEFAULT NULL,
`hits` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_2` (`category_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `file` (
`id` int(11) NOT NULL,
`category_id` int(11) NULL DEFAULT NULL,
`upload_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`comment_hit` int(11) NULL DEFAULT NULL,
`allow_comment` int(11) NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`hits` int(11) NULL DEFAULT NULL,
`size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`upload_time` datetime NULL DEFAULT NULL,
`updated_time` datetime NULL DEFAULT NULL,
`save_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`save_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`author` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`md5` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`downloads` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_7` (`category_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `guestbook` (
`id` int(11) NOT NULL,
`blog_id` int(11) NULL DEFAULT NULL,
`author` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`email` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`content` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`created_time` datetime NULL DEFAULT NULL,
`ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_9` (`blog_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `link` (
`id` int(11) NOT NULL,
`category_id` int(11) NULL DEFAULT NULL,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`description` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`url` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`display_order` int(11) NULL DEFAULT NULL,
`comment_hit` int(11) NULL DEFAULT NULL,
`allow_comment` int(11) NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`created_time` datetime NULL DEFAULT NULL,
`updated_time` datetime NULL DEFAULT NULL,
`hits` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `link_fk` (`category_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `mood` (
`id` int(11) NOT NULL,
`blog_id` int(11) NULL DEFAULT NULL,
`content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`comment_hit` int(11) NULL DEFAULT NULL,
`allow_comment` int(11) NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`created_time` datetime NULL DEFAULT NULL,
`updated_time` datetime NULL DEFAULT NULL,
`hits` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_8` (`blog_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `photo` (
`id` int(11) NOT NULL,
`category_id` int(11) NULL DEFAULT NULL,
`name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`comment_hit` int(11) NULL DEFAULT NULL,
`allow_comment` int(11) NULL DEFAULT NULL,
`status` int(11) NULL DEFAULT NULL,
`upload_time` datetime NULL DEFAULT NULL,
`updated_time` datetime NULL DEFAULT NULL,
`hits` int(11) NULL DEFAULT NULL,
`size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`upload_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`save_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`save_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`author` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`md5` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`width` int(11) NULL DEFAULT NULL,
`height` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_6` (`category_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user` (
`id` int(11) NOT NULL,
`blog_id` int(11) NULL DEFAULT NULL,
`username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
INDEX `FK_Relationship_1` (`blog_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `category` ADD CONSTRAINT `category_fk` FOREIGN KEY (`father_id`) REFERENCES `category` (`id`);
ALTER TABLE `category` ADD CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);
ALTER TABLE `comment` ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `link` (`id`);
ALTER TABLE `comment` ADD CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`);
ALTER TABLE `comment` ADD CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`);
ALTER TABLE `comment` ADD CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`mood_id`) REFERENCES `mood` (`id`);
ALTER TABLE `comment` ADD CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`entry_id`) REFERENCES `entry` (`id`);
ALTER TABLE `entry` ADD CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
ALTER TABLE `file` ADD CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
ALTER TABLE `guestbook` ADD CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);
ALTER TABLE `link` ADD CONSTRAINT `link_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
ALTER TABLE `mood` ADD CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);
ALTER TABLE `photo` ADD CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
ALTER TABLE `user` ADD CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);

