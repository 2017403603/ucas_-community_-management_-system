class Vote < ApplicationRecord

  validates :name,
            presence: { message: "名称不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }
  validates :start_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "投票开始格式不对" }
  validates :end_time, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}/, message: "投票结束格式不对" }

  scope :by_name_search, -> name { where("name like ?", "%#{name}%") if name.present? }
  scope :by_society_id, -> society_id {where("society_id = ?", society_id)}
  cattr_accessor :vote_options
  after_validation :check_time
  after_save :create_vote_options

  # 检查开始和截止的时间是否合法
  def check_time
    if self.errors.messages.blank?
      if start_time >= end_time
        self.errors.messages[:time] = '投票开始时间不能大于等于结束时间'
      end
    end
  end

  # 创建选项
  def create_vote_options
    VoteOption.new.create_vote_options(id, vote_options)
  end

  # 新增投票
  def create_vote_with_vote_options(data)
    self.vote_options = data[:vote_options]
    data.delete(:vote_options)
    Vote.create(data)
  end

  # 修改投票
  def update_vote_with_vote_options(data, vote)
    self.vote_options = data[:vote_options]
    data.delete(:vote_options)
    vote.update(data)
  end

  # 进行投票
  def vote(vote, vote_options, user_id)
    res = {}
    if vote_options.blank?
      code = 201
      message = '选项不能为空'
    elsif VoteRecord.by_user_id(user_id).relate_with_other?('vote_id', vote.id).blank?
      # 符合投票条件
      vote_options.each do |e|
        data = {
            vote_id: vote.id,
            vote_option_id: e,
            user_id: user_id,
            create_time: Time.now.inspect
        }
        VoteRecord.create(data)
      end
      code = 200
      message = '投票成功'
    else
      code = 403
      message = '失败,你已经投过票了'
    end
    res['code'] = code
    res['message'] = message
    res
  end
end
