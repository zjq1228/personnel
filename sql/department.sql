ALTER TABLE `department`
ADD COLUMN `is_del`  varchar(255) NULL COMMENT '0:删除 1：正常' AFTER `remark`;