class VoteOption < ApplicationRecord
  validates :name,
            presence: { message: "名称不能为空" },
            length: { in: 1..45, message: "名称长度在1-45个字符内" }

  def create_vote_options(vote_id, vote_options)
    VoteOption.where(vote_id: vote_id).destroy_all
    unless vote_options.blank?
      vote_option_arr = vote_options.map {|e| {vote_id: vote_id, name: e}}
      VoteOption.create(vote_option_arr)
    end
  end
end