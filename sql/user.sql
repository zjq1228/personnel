# 添加字段 pid
ALTER TABLE `user`
DROP COLUMN `p_id`,
DROP COLUMN `user_lever`,
ADD COLUMN `p_id`  int(11) NULL COMMENT '父类id' AFTER `id`,
ADD COLUMN `user_lever`  int(11) NULL COMMENT '用户等级（boss是 -1，管理员是0，普通员工是“”）' AFTER `p_id`;
# 添加字段level
ALTER TABLE `user`
DROP COLUMN `level`,
ADD COLUMN `level`  int(11) NULL AFTER `create_time`;

