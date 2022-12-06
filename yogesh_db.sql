-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 11:17 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yogesh_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `pinned` tinyint(4) DEFAULT NULL,
  `archived` tinytext DEFAULT NULL,
  `locked_comments` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `stream_sort_date` datetime DEFAULT NULL,
  `stream_channel` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer`
--

CREATE TABLE `contentcontainer` (
  `id` int(11) NOT NULL,
  `guid` char(36) NOT NULL,
  `class` char(60) NOT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `tags_cached` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_blocked_users`
--

CREATE TABLE `contentcontainer_blocked_users` (
  `contentcontainer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_default_permission`
--

CREATE TABLE `contentcontainer_default_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_class` char(60) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_module`
--

CREATE TABLE `contentcontainer_module` (
  `contentcontainer_id` int(11) NOT NULL,
  `module_id` char(100) NOT NULL,
  `module_state` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_permission`
--

CREATE TABLE `contentcontainer_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_setting`
--

CREATE TABLE `contentcontainer_setting` (
  `id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_tag`
--

CREATE TABLE `contentcontainer_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contentcontainer_class` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contentcontainer_tag_relation`
--

CREATE TABLE `contentcontainer_tag_relation` (
  `contentcontainer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_tag`
--

CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_tag_relation`
--

CREATE TABLE `content_tag_relation` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `content_id` int(11) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `show_in_stream` tinyint(1) DEFAULT 1,
  `hash_sha1` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_history`
--

CREATE TABLE `file_history` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `size` bigint(20) NOT NULL,
  `hash_sha1` varchar(40) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_default_group` tinyint(1) NOT NULL DEFAULT 0,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_registration` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_directory` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `notify_users` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `is_admin_group`, `is_default_group`, `is_protected`, `show_at_registration`, `show_at_directory`, `sort_order`, `notify_users`) VALUES
(1, 'Administrators', 'Default group for administrators of this HumHub Installation', '2022-12-06 11:14:35', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 100, 0),
(2, 'Users', 'Default group for all newly registered users of the network', '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, 0, 1, 0, 1, 0, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_permission`
--

CREATE TABLE `group_permission` (
  `permission_id` varchar(150) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_space`
--

CREATE TABLE `group_space` (
  `id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live`
--

CREATE TABLE `live` (
  `id` int(11) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `id` int(11) NOT NULL,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1670321669),
('m131023_164513_initial', 1670321669),
('m131023_165411_initial', 1670321669),
('m131023_165625_initial', 1670321669),
('m131023_165755_initial', 1670321669),
('m131023_165835_initial', 1670321669),
('m131023_170033_initial', 1670321670),
('m131023_170135_initial', 1670321670),
('m131023_170159_initial', 1670321670),
('m131023_170253_initial', 1670321670),
('m131023_170339_initial', 1670321670),
('m131203_110444_oembed', 1670321670),
('m131213_165552_user_optimize', 1670321670),
('m140226_111945_ldap', 1670321670),
('m140303_125031_password', 1670321670),
('m140304_142711_memberautoadd', 1670321670),
('m140321_000917_content', 1670321670),
('m140324_170617_membership', 1670321670),
('m140507_150421_create_settings_table', 1670321670),
('m140507_171527_create_settings_table', 1670321670),
('m140512_141414_i18n_profilefields', 1670321670),
('m140513_180317_createlogging', 1670321670),
('m140701_000611_profile_genderfield', 1670321670),
('m140701_074404_protect_default_profilefields', 1670321670),
('m140702_143912_notify_notification_unify', 1670321670),
('m140703_104527_profile_birthdayfield', 1670321670),
('m140704_080659_installationid', 1670321670),
('m140705_065525_emailing_settings', 1670321670),
('m140706_135210_lastlogin', 1670321670),
('m140829_122906_delete', 1670321671),
('m140830_145504_following', 1670321671),
('m140901_080147_indizies', 1670321671),
('m140901_080432_indices', 1670321671),
('m140901_112246_addState', 1670321671),
('m140901_153403_addState', 1670321671),
('m140901_170329_group_create_space', 1670321671),
('m140902_091234_session_key_length', 1670321671),
('m140907_140822_zip_field_to_text', 1670321671),
('m140930_205511_fix_default', 1670321671),
('m140930_205859_fix_default', 1670321671),
('m140930_210142_fix_default', 1670321671),
('m140930_210635_fix_default', 1670321671),
('m140930_212528_fix_default', 1670321671),
('m141015_173305_follow_notifications', 1670321671),
('m141019_093319_mentioning', 1670321671),
('m141020_162639_fix_default', 1670321672),
('m141020_193920_rm_alsocreated', 1670321672),
('m141020_193931_rm_alsoliked', 1670321672),
('m141021_162639_oembed_setting', 1670321672),
('m141022_094635_addDefaults', 1670321672),
('m141106_185632_log_init', 1670321672),
('m150204_103433_html5_notified', 1670321672),
('m150210_190006_user_invite_lang', 1670321672),
('m150302_114347_add_visibility', 1670321672),
('m150322_194403_remove_type_field', 1670321672),
('m150322_195619_allowedExt2Text', 1670321672),
('m150429_223856_optimize', 1670321672),
('m150629_220311_change', 1670321672),
('m150703_012735_typelength', 1670321672),
('m150703_024635_activityTypes', 1670321672),
('m150703_033650_namespace', 1670321672),
('m150703_130157_migrate', 1670321672),
('m150704_005338_namespace', 1670321672),
('m150704_005418_namespace', 1670321672),
('m150704_005434_namespace', 1670321673),
('m150704_005452_namespace', 1670321673),
('m150704_005504_namespace', 1670321673),
('m150713_054441_timezone', 1670321673),
('m150714_093525_activity', 1670321673),
('m150714_100355_cleanup', 1670321673),
('m150831_061628_notifications', 1670321673),
('m150910_223305_fix_user_follow', 1670321673),
('m150924_133344_update_notification_fix', 1670321673),
('m150924_154635_user_invite_add_first_lastname', 1670321673),
('m150927_190830_create_contentcontainer', 1670321673),
('m150928_103711_permissions', 1670321673),
('m150928_134934_groups', 1670321673),
('m150928_140718_setColorVariables', 1670321673),
('m151010_124437_group_permissions', 1670321673),
('m151010_175000_default_visibility', 1670321673),
('m151013_223814_include_dashboard', 1670321673),
('m151022_131128_module_fix', 1670321673),
('m151106_090948_addColor', 1670321673),
('m151223_171310_fix_notifications', 1670321673),
('m151226_164234_authclient', 1670321674),
('m160125_053702_stored_filename', 1670321674),
('m160205_203840_foreign_keys', 1670321674),
('m160205_203913_foreign_keys', 1670321674),
('m160205_203939_foreign_keys', 1670321674),
('m160205_203955_foreign_keys', 1670321674),
('m160205_204000_foreign_keys', 1670321674),
('m160205_204010_foreign_keys', 1670321674),
('m160205_205540_foreign_keys', 1670321674),
('m160216_160119_initial', 1670321674),
('m160217_161220_addCanLeaveFlag', 1670321675),
('m160220_013525_contentcontainer_id', 1670321675),
('m160221_222312_public_permission_change', 1670321675),
('m160225_180229_remove_website', 1670321675),
('m160227_073020_birthday_date', 1670321675),
('m160229_162959_multiusergroups', 1670321675),
('m160309_141222_longerUserName', 1670321675),
('m160408_100725_rename_groupadmin_to_manager', 1670321675),
('m160415_180332_wall_remove', 1670321675),
('m160501_220850_activity_pk_int', 1670321675),
('m160507_202611_settings', 1670321675),
('m160508_005740_settings_cleanup', 1670321675),
('m160509_214811_spaceurl', 1670321675),
('m160517_132535_group', 1670321675),
('m160523_105732_profile_searchable', 1670321675),
('m160714_142827_remove_space_id', 1670321675),
('m161031_161947_file_directories', 1670321675),
('m170110_151419_membership_notifications', 1670321676),
('m170110_152425_space_follow_reset_send_notification', 1670321676),
('m170111_190400_disable_web_notifications', 1670321676),
('m170112_115052_settings', 1670321676),
('m170118_162332_streamchannel', 1670321676),
('m170119_160740_initial', 1670321676),
('m170123_125622_pinned', 1670321676),
('m170211_105743_show_in_stream', 1670321676),
('m170224_100937_fix_default_modules', 1670321676),
('m170723_133337_content_tag', 1670321676),
('m170723_133338_content_tag_sort_order', 1670321676),
('m170805_211208_authclient_id', 1670321676),
('m170810_220543_group_sort', 1670321676),
('m171015_155102_contentcontainer_module', 1670321676),
('m171025_142030_queue_update', 1670321676),
('m171025_200312_utf8mb4_fixes', 1670321676),
('m171027_220519_exclusive_jobs', 1670321676),
('m180305_084435_membership_pk', 1670321677),
('m180315_112748_fix_email_length', 1670321677),
('m181029_160453_collation', 1670321677),
('m190211_133045_channel_length', 1670321677),
('m190309_201944_rename_settings', 1670321677),
('m190920_142605_fix_language_codes', 1670321677),
('m200217_122108_profile_translation_fix', 1670321677),
('m200218_122109_profile_translation_fix2', 1670321677),
('m200323_162006_fix_visibility', 1670321677),
('m200604_204445_remove_post_field', 1670321678),
('m200715_171721_defaultOption', 1670321678),
('m200715_184207_commentIndex', 1670321678),
('m200729_080349_commentIndex_fix_order', 1670321678),
('m200930_151639_add_about', 1670321678),
('m201020_130431_fix_default_file_setting_value', 1670321678),
('m201025_095247_spaces_of_users_group', 1670321678),
('m201115_083832_add_notify_users_to_group', 1670321678),
('m201130_073907_default_permissions', 1670321678),
('m201130_073908_disable_legacy_richtextparser', 1670321678),
('m201217_081828_fix_oembed_setting', 1670321678),
('m201228_064513_default_group', 1670321678),
('m210111_105355_hash', 1670321678),
('m210203_122333_profilePermissions', 1670321678),
('m210204_054203_fix_settings_unique_index', 1670321678),
('m210211_051243_container_tag', 1670321678),
('m210217_055359_protected_group', 1670321678),
('m210310_103412_fix_hash', 1670321678),
('m210331_115144_default_timezone', 1670321678),
('m210506_060737_profile_field_directory_filter', 1670321678),
('m210721_055137_content_locked_comments', 1670321678),
('m210727_102150_follow_friend', 1670321678),
('m210924_114847_container_blocked_users', 1670321679),
('m211022_152413_file_history', 1670321679),
('m211124_180441_admin_group_label', 1670321679),
('m220121_193617_oembed_setting_update', 1670321679),
('m220207_183901_add_payload_column_to_notification_table', 1670321679),
('m220302_135158_add_content_id', 1670321679),
('m220606_205507_mailer_settings', 1670321679),
('m220608_125539_displaysubformat', 1670321679);

-- --------------------------------------------------------

--
-- Table structure for table `module_enabled`
--

CREATE TABLE `module_enabled` (
  `module_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT 0,
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  `group_key` varchar(75) DEFAULT NULL,
  `send_web_notifications` tinyint(1) DEFAULT 1,
  `payload` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text DEFAULT NULL,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_skype` varchar(255) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_flickr` varchar(255) DEFAULT NULL,
  `url_myspace` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile_field`
--

CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text DEFAULT NULL,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 1,
  `directory_filter` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_field`
--

INSERT INTO `profile_field` (`id`, `profile_field_category_id`, `module_id`, `field_type_class`, `field_type_config`, `internal_name`, `title`, `description`, `sort_order`, `required`, `show_at_registration`, `editable`, `visible`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_attribute`, `translation_category`, `is_system`, `searchable`, `directory_filter`) VALUES
(1, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":20,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'firstname', 'First name', NULL, 100, 1, 1, 1, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:39', NULL, 'givenName', NULL, 1, 1, 0),
(2, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":30,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'lastname', 'Last name', NULL, 200, 1, 1, 1, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:39', NULL, 'sn', NULL, 1, 1, 0),
(3, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":50,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'title', 'Title', NULL, 300, NULL, NULL, 1, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:39', NULL, 'title', NULL, 1, 1, 0),
(4, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Select', '{\"options\":\"male=>Male\\nfemale=>Female\\ncustom=>Custom\",\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}', 'gender', 'Gender', NULL, 300, NULL, NULL, 1, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(5, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":150,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'street', 'Street', NULL, 400, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(6, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":10,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'zip', 'Zip', NULL, 500, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(7, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'city', 'City', NULL, 600, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(8, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\CountrySelect', '{\"options\":null,\"canBeDirectoryFilter\":true,\"fieldTypes\":[],\"isVirtual\":false}', 'country', 'Country', NULL, 700, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(9, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'state', 'State', NULL, 800, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(10, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Birthday', '{\"defaultHideAge\":\"0\",\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}', 'birthday', 'Birthday', NULL, 900, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(11, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\TextArea', '{\"fieldTypes\":[],\"isVirtual\":false,\"canBeDirectoryFilter\":false}', 'about', 'About', NULL, 900, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(12, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'phone_private', 'Phone Private', NULL, 100, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(13, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'phone_work', 'Phone Work', NULL, 200, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(14, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'mobile', 'Mobile', NULL, 300, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(15, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\UserEmail', '{\"isVirtual\":true,\"fieldTypes\":[],\"canBeDirectoryFilter\":false}', 'email_virtual', 'E-Mail', NULL, 350, 0, 0, 0, 0, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, NULL, 0, 0),
(16, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'fax', 'Fax', NULL, 400, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(17, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'im_skype', 'Skype Nickname', NULL, 500, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(18, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"email\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'im_xmpp', 'XMPP Jabber Address', NULL, 800, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(19, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url', 'Url', NULL, 100, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(20, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_facebook', 'Facebook URL', NULL, 200, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(21, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_linkedin', 'LinkedIn URL', NULL, 300, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(22, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_xing', 'Xing URL', NULL, 400, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(23, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_youtube', 'Youtube URL', NULL, 500, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(24, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_vimeo', 'Vimeo URL', NULL, 600, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(25, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_flickr', 'Flickr URL', NULL, 700, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(26, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_myspace', 'MySpace URL', NULL, 800, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0),
(27, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"canBeDirectoryFilter\":true,\"linkPrefix\":null,\"fieldTypes\":[],\"isVirtual\":false}', 'url_twitter', 'Twitter URL', NULL, 1000, NULL, NULL, 1, 1, '2022-12-06 11:14:40', NULL, '2022-12-06 11:14:40', NULL, NULL, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `profile_field_category`
--

CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_field_category`
--

INSERT INTO `profile_field_category` (`id`, `title`, `description`, `sort_order`, `module_id`, `visibility`, `created_at`, `created_by`, `updated_at`, `updated_by`, `translation_category`, `is_system`) VALUES
(1, 'General', '', 100, NULL, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:39', NULL, NULL, 1),
(2, 'Communication', '', 200, NULL, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:39', NULL, NULL, 1),
(3, 'Social bookmarks', '', 300, NULL, 1, '2022-12-06 11:14:39', NULL, '2022-12-06 11:14:39', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `job` blob NOT NULL,
  `pushed_at` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `reserved_at` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `done_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_exclusive`
--

CREATE TABLE `queue_exclusive` (
  `id` varchar(50) NOT NULL,
  `job_message_id` varchar(50) DEFAULT NULL,
  `job_status` smallint(6) DEFAULT 2,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `module_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `module_id`) VALUES
(1, 'oembedProviders', '{\"Facebook Video\":{\"pattern\":\"/facebook\\\\.com\\\\/(.*)(video)/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_video?url=%url%&access_token=\"},\"Facebook Post\":{\"pattern\":\"/facebook\\\\.com\\\\/(.*)(post|activity|photo|permalink|media|question|note)/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_post?url=%url%&access_token=\"},\"Facebook Page\":{\"pattern\":\"/^(https\\\\:\\\\/\\\\/)*(www\\\\.)*facebook\\\\.com\\\\/((?!video|post|activity|photo|permalink|media|question|note).)*$/\",\"endpoint\":\"https://graph.facebook.com/v12.0/oembed_post?url=%url%&access_token=\"},\"Instagram\":{\"pattern\":\"/instagram\\\\.com/\",\"endpoint\":\"https://graph.facebook.com/v12.0/instagram_oembed?url=%url%&access_token=\"},\"Twitter\":{\"pattern\":\"/twitter\\\\.com/\",\"endpoint\":\"https://publish.twitter.com/oembed?url=%url%&maxwidth=450\"},\"YouTube\":{\"pattern\":\"/youtube\\\\.com|youtu.be/\",\"endpoint\":\"https://www.youtube.com/oembed?scheme=https&url=%url%&format=json&maxwidth=450\"},\"Soundcloud\":{\"pattern\":\"/soundcloud\\\\.com/\",\"endpoint\":\"https://soundcloud.com/oembed?url=%url%&format=json&maxwidth=450\"},\"Vimeo\":{\"pattern\":\"/vimeo\\\\.com/\",\"endpoint\":\"https://vimeo.com/api/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450\"},\"SlideShare\":{\"pattern\":\"/slideshare\\\\.net/\",\"endpoint\":\"https://www.slideshare.net/api/oembed/2?url=%url%&format=json&maxwidth=450\"}}', 'base'),
(2, 'defaultVisibility', '1', 'space'),
(3, 'defaultJoinPolicy', '1', 'space'),
(4, 'includeCommunityModules', '1', 'marketplace'),
(5, 'richtextCompatMode', '0', 'content'),
(6, 'auth.showRegistrationUserGroup', '1', 'user'),
(7, 'displayNameSubFormat', 'title', 'base'),
(8, 'themeParents', '[]', 'base'),
(9, 'name', 'mini-project', 'base'),
(10, 'baseUrl', 'http://localhost/humhub', 'base'),
(11, 'paginationSize', '10', 'base'),
(12, 'displayNameFormat', '{profile.firstname} {profile.lastname}', 'base'),
(13, 'horImageScrollOnMobile', '1', 'base'),
(14, 'cronLastDailyRun', '1670321679', 'base'),
(15, 'auth.needApproval', '0', 'user'),
(16, 'auth.anonymousRegistration', '1', 'user'),
(17, 'auth.internalUsersCanInvite', '1', 'user'),
(18, 'auth.showCaptureInRegisterForm', '1', 'user'),
(19, 'mailer.transportType', 'php', 'base'),
(20, 'mailer.systemEmailAddress', 'social@example.com', 'base'),
(21, 'mailer.systemEmailName', 'mini-project', 'base'),
(22, 'mailSummaryInterval', '2', 'activity'),
(23, 'maxFileSize', '5242880', 'file'),
(24, 'excludeMediaFilesPreview', '1', 'file'),
(25, 'cache.class', 'yii\\caching\\FileCache', 'base'),
(26, 'cache.expireTime', '3600', 'base'),
(27, 'installationId', '0a027b6425bbf192a6affb093cec8f1b', 'admin'),
(28, 'spaceOrder', '0', 'space'),
(29, 'enable', '1', 'tour'),
(30, 'defaultLanguage', 'en-GB', 'base'),
(31, 'enable_html5_desktop_notifications', '0', 'notification'),
(32, 'cronLastRun', '1670321679', 'base'),
(33, 'theme.var.HumHub.default', '#f3f3f3', 'base'),
(34, 'theme.var.HumHub.primary', '#435f6f', 'base'),
(35, 'theme.var.HumHub.info', '#21A1B3', 'base'),
(36, 'theme.var.HumHub.success', '#97d271', 'base'),
(37, 'theme.var.HumHub.warning', '#FFC107', 'base'),
(38, 'theme.var.HumHub.danger', '#FC4A64', 'base'),
(39, 'theme.var.HumHub.link', '#21A1B3', 'base'),
(40, 'theme.var.HumHub.isFluid', 'false', 'base'),
(41, 'theme.var.HumHub.text-color-main', '#555', 'base'),
(42, 'theme.var.HumHub.text-color-secondary', '#7a7a7a', 'base'),
(43, 'theme.var.HumHub.text-color-highlight', '#000', 'base'),
(44, 'theme.var.HumHub.text-color-soft', '#555555', 'base'),
(45, 'theme.var.HumHub.text-color-soft2', '#aeaeae', 'base'),
(46, 'theme.var.HumHub.text-color-soft3', '#bac2c7', 'base'),
(47, 'theme.var.HumHub.text-color-contrast', '#fff', 'base'),
(48, 'theme.var.HumHub.background-color-main', '#fff', 'base'),
(49, 'theme.var.HumHub.background-color-secondary', '#f7f7f7', 'base'),
(50, 'theme.var.HumHub.background-color-page', '#ededed', 'base'),
(51, 'theme.var.HumHub.background-color-highlight', '#fff8e0', 'base'),
(52, 'theme.var.HumHub.background3', '#d7d7d7', 'base'),
(53, 'theme.var.HumHub.background4', '#b2b2b2', 'base'),
(54, 'theme.var.HumHub.background-color-success', '#f7fbf4', 'base'),
(55, 'theme.var.HumHub.text-color-success', '#84be5e', 'base'),
(56, 'theme.var.HumHub.border-color-success', '#97d271', 'base'),
(57, 'theme.var.HumHub.background-color-warning', '#fffbf7', 'base'),
(58, 'theme.var.HumHub.text-color-warning', '#e9b168', 'base'),
(59, 'theme.var.HumHub.border-color-warning', '#fdd198', 'base'),
(60, 'theme.var.HumHub.background-color-danger', '#fff6f6', 'base'),
(61, 'theme.var.HumHub.text-color-danger', '#ff8989', 'base'),
(62, 'theme.var.HumHub.border-color-danger', '#ff8989', 'base'),
(63, 'theme.var.HumHub.mail-font-url', '\'http://fonts.googleapis.com/css?family=Open+Sans:300,100,400,600\'', 'base'),
(64, 'theme.var.HumHub.mail-font-family', '\'Open Sans\', Arial, Tahoma, Helvetica, sans-serif', 'base'),
(65, 'useCase', 'education', 'base');

-- --------------------------------------------------------

--
-- Table structure for table `space`
--

CREATE TABLE `space` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  `about` text DEFAULT NULL,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT 1,
  `url` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `space_membership`
--

CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT 1,
  `can_cancel_membership` int(11) DEFAULT 1,
  `send_notifications` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `url_oembed`
--

CREATE TABLE `url_oembed` (
  `url` varchar(180) NOT NULL,
  `preview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` char(150) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `language` varchar(5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT 1,
  `time_zone` varchar(100) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `authclient_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_friendship`
--

CREATE TABLE `user_friendship` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_http_session`
--

CREATE TABLE `user_http_session` (
  `id` char(64) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_invite`
--

CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` char(150) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_mentioning`
--

CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_password`
--

CREATE TABLE `user_password` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `salt` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment-created_by` (`created_by`),
  ADD KEY `idx_comment_target` (`object_id`,`object_model`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  ADD UNIQUE KEY `index_guid` (`guid`),
  ADD KEY `fk-contentcontainer` (`contentcontainer_id`),
  ADD KEY `fk-create-user` (`created_by`),
  ADD KEY `fk-update-user` (`updated_by`),
  ADD KEY `stream_channe` (`stream_channel`);

--
-- Indexes for table `contentcontainer`
--
ALTER TABLE `contentcontainer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_guid` (`guid`),
  ADD UNIQUE KEY `unique_target` (`class`,`pk`);

--
-- Indexes for table `contentcontainer_blocked_users`
--
ALTER TABLE `contentcontainer_blocked_users`
  ADD PRIMARY KEY (`contentcontainer_id`,`user_id`),
  ADD KEY `fk-contentcontainer-blocked-users-rel-user-id` (`user_id`);

--
-- Indexes for table `contentcontainer_default_permission`
--
ALTER TABLE `contentcontainer_default_permission`
  ADD PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_class`);

--
-- Indexes for table `contentcontainer_module`
--
ALTER TABLE `contentcontainer_module`
  ADD PRIMARY KEY (`contentcontainer_id`,`module_id`);

--
-- Indexes for table `contentcontainer_permission`
--
ALTER TABLE `contentcontainer_permission`
  ADD PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`);

--
-- Indexes for table `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  ADD KEY `fk-contentcontainerx` (`contentcontainer_id`);

--
-- Indexes for table `contentcontainer_tag`
--
ALTER TABLE `contentcontainer_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique-contentcontainer-tag` (`contentcontainer_class`,`name`);

--
-- Indexes for table `contentcontainer_tag_relation`
--
ALTER TABLE `contentcontainer_tag_relation`
  ADD PRIMARY KEY (`contentcontainer_id`,`tag_id`),
  ADD KEY `fk-contentcontainer-tag-rel-tag-id` (`tag_id`);

--
-- Indexes for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  ADD KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  ADD KEY `fk-content-tag-parent-id` (`parent_id`);

--
-- Indexes for table `content_tag_relation`
--
ALTER TABLE `content_tag_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-content-tag-rel-content-id` (`content_id`),
  ADD KEY `fk-content-tag-rel-tag-id` (`tag_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_object` (`object_model`,`object_id`),
  ADD KEY `fk_file-created_by` (`created_by`);

--
-- Indexes for table `file_history`
--
ALTER TABLE `file_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_file_history` (`file_id`),
  ADD KEY `fk_file_history_user` (`created_by`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permission`
--
ALTER TABLE `group_permission`
  ADD PRIMARY KEY (`permission_id`,`group_id`,`module_id`),
  ADD KEY `fk_group_permission-group_id` (`group_id`);

--
-- Indexes for table `group_space`
--
ALTER TABLE `group_space`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-group_space` (`space_id`,`group_id`),
  ADD KEY `fk-group_space-group` (`group_id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  ADD KEY `fk-group-group` (`group_id`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_object` (`object_model`,`object_id`),
  ADD KEY `fk_like-created_by` (`created_by`),
  ADD KEY `fk_like-target_user_id` (`target_user_id`);

--
-- Indexes for table `live`
--
ALTER TABLE `live`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contentcontainer` (`contentcontainer_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_level` (`level`),
  ADD KEY `idx_log_category` (`category`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module_enabled`
--
ALTER TABLE `module_enabled`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_id` (`user_id`),
  ADD KEY `index_seen` (`seen`),
  ADD KEY `index_desktop_notified` (`desktop_notified`),
  ADD KEY `index_desktop_emailed` (`emailed`),
  ADD KEY `index_groupuser` (`user_id`,`class`,`group_key`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `profile_field`
--
ALTER TABLE `profile_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_profile_field_category` (`profile_field_category_id`),
  ADD KEY `index_directory_filter` (`directory_filter`);

--
-- Indexes for table `profile_field_category`
--
ALTER TABLE `profile_field_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel` (`channel`),
  ADD KEY `reserved_at` (`reserved_at`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `queue_exclusive`
--
ALTER TABLE `queue_exclusive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique-setting` (`name`,`module_id`);

--
-- Indexes for table `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url-unique` (`url`);

--
-- Indexes for table `space_membership`
--
ALTER TABLE `space_membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_status` (`status`),
  ADD KEY `fk_space_membership-space_id` (`space_id`),
  ADD KEY `fk_space_membership-user_id` (`user_id`);

--
-- Indexes for table `url_oembed`
--
ALTER TABLE `url_oembed`
  ADD PRIMARY KEY (`url`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_guid` (`guid`),
  ADD UNIQUE KEY `unique_authclient_id` (`authclient_id`);

--
-- Indexes for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user` (`user_id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indexes for table `user_friendship`
--
ALTER TABLE `user_friendship`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  ADD KEY `fk-friend` (`friend_user_id`);

--
-- Indexes for table `user_http_session`
--
ALTER TABLE `user_http_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_http_session-user_id` (`user_id`);

--
-- Indexes for table `user_invite`
--
ALTER TABLE `user_invite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_token` (`token`);

--
-- Indexes for table `user_mentioning`
--
ALTER TABLE `user_mentioning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i_user` (`user_id`),
  ADD KEY `i_object` (`object_model`,`object_id`);

--
-- Indexes for table `user_password`
--
ALTER TABLE `user_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contentcontainer`
--
ALTER TABLE `contentcontainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contentcontainer_tag`
--
ALTER TABLE `contentcontainer_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_tag`
--
ALTER TABLE `content_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_tag_relation`
--
ALTER TABLE `content_tag_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_history`
--
ALTER TABLE `file_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_space`
--
ALTER TABLE `group_space`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live`
--
ALTER TABLE `live`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_field`
--
ALTER TABLE `profile_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `profile_field_category`
--
ALTER TABLE `profile_field_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `space`
--
ALTER TABLE `space`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `space_membership`
--
ALTER TABLE `space_membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_follow`
--
ALTER TABLE `user_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_friendship`
--
ALTER TABLE `user_friendship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_invite`
--
ALTER TABLE `user_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_mentioning`
--
ALTER TABLE `user_mentioning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_password`
--
ALTER TABLE `user_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `contentcontainer_blocked_users`
--
ALTER TABLE `contentcontainer_blocked_users`
  ADD CONSTRAINT `fk-contentcontainer-blocked-users-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-contentcontainer-blocked-users-rel-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contentcontainer_module`
--
ALTER TABLE `contentcontainer_module`
  ADD CONSTRAINT `fk_contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  ADD CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contentcontainer_tag_relation`
--
ALTER TABLE `contentcontainer_tag_relation`
  ADD CONSTRAINT `fk-contentcontainer-tag-rel-contentcontainer-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-contentcontainer-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `contentcontainer_tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `content_tag_relation`
--
ALTER TABLE `content_tag_relation`
  ADD CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `fk_file-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_history`
--
ALTER TABLE `file_history`
  ADD CONSTRAINT `fk_file_history` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_file_history_user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `group_permission`
--
ALTER TABLE `group_permission`
  ADD CONSTRAINT `fk_group_permission-group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_space`
--
ALTER TABLE `group_space`
  ADD CONSTRAINT `fk-group_space-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-group_space-space` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `fk_like-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_like-target_user_id` FOREIGN KEY (`target_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live`
--
ALTER TABLE `live`
  ADD CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_field`
--
ALTER TABLE `profile_field`
  ADD CONSTRAINT `fk_profile_field-profile_field_category_id` FOREIGN KEY (`profile_field_category_id`) REFERENCES `profile_field_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `space_membership`
--
ALTER TABLE `space_membership`
  ADD CONSTRAINT `fk_space_membership-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_space_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `fk_user_follow-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_friendship`
--
ALTER TABLE `user_friendship`
  ADD CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_http_session`
--
ALTER TABLE `user_http_session`
  ADD CONSTRAINT `fk_user_http_session-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_mentioning`
--
ALTER TABLE `user_mentioning`
  ADD CONSTRAINT `fk_user_mentioning-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_password`
--
ALTER TABLE `user_password`
  ADD CONSTRAINT `fk_user_password-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
