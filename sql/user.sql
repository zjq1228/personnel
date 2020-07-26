# 添加字段 pid
ALTER TABLE `user`
DROP COLUMN `p_id`,
DROP COLUMN `user_lever`,
ADD COLUMN `p_id`  int(11) NULL COMMENT '父类id' AFTER `id`,
ADD COLUMN `user_lever`  int(11) NULL COMMENT '用户等级（boss是 -1，管理员是0，普通员工是“”）' AFTER `p_id`;
# 添加字段level
#户等级boss是 1管理员是2普通员工是3
ALTER TABLE `user`
DROP COLUMN `level`,
ADD COLUMN `level`  int(11) NULL AFTER `create_time`;
#删除字段
ALTER TABLE `user`
DROP COLUMN `realname`;

#修改字段 user_level
ALTER TABLE `user`
CHANGE COLUMN `user_level` `user_level`  int(11) NULL DEFAULT NULL AFTER `create_time`;
#新增 手机号 身份证号
ALTER TABLE `user`
DROP COLUMN `user_phone`,
DROP COLUMN `id_card`,
ADD COLUMN `id_card`  varchar(255) NULL AFTER `p_id`,
ADD COLUMN `user_phone`  varchar(255) NULL AFTER `id_card`;

#新增部门
ALTER TABLE `user`
ADD COLUMN `province`  varchar(255) NULL AFTER `user_phone`;