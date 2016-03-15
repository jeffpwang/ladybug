class User < ActiveRecord::Base

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
     has_many :logs
     has_many :ladybugs, through: :logs
     has_many :distortions, through: :logs
     has_many :beliefs, through: :logs
     has_many :tags, through: :logs

     validates :name, :presence true
     validates :email, :presence true
     
end
