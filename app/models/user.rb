class User < ApplicationRecord
  belongs_to  :signin
  has_many :tasks,dependent: :destroy




  #生成哈希摘要
  def User.digest(string)
    cost=ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #生成记忆令牌
  #
  #
  #
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  #持久保存会话，在数据库中记住用户
  def remember
    self.remember_token=User.new_token
    update_attribute(:remember_digest,User.digest(remember_token))
  end
  #若指定的令牌和摘要匹配，则返回true
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  #忘记用户
  def forget
    update_attribute(:remember_digest,nil)
  end
end
