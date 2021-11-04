class MenuList < ApplicationRecord
scope :by_status, -> { where(status: 1) }
scope :by_sort, -> { order(:sort) }
# 左边菜单显示多权限判断
# 普通用户 pid: [1,2] 社团管理员 pid: [1,2,3] 系统管理员 pid: [1,2,3,4]
scope :by_pids, -> pids { where("pid in (?) or id in (?)",pids, pids) }
end
