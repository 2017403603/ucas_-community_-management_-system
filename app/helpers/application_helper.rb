module ApplicationHelper
  #常量表
  def get_dict (key)
    dict = {}
    dict[:society_type] = {"1" => "校级", "2" => "院级", "3" => "其他"}
    dict[:status] = {"1" => "可用", "2" => "停用", "3" => " 待审核"}
    dict[:sex] = {"1" => "男", "2" => "女"}
    dict[:admin] = {"1" => "是", "2" => "否"}
    dict[key]
  end

  #根据关联id获取相应多的子数据
  def get_data_by_pid (pid_key,pid,model,limit=nil)
    data = model.where(pid_key => pid)
    if limit
      data.limit(limit)
    end
    data
  end

end
