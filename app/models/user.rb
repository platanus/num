class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :accounts, dependent: :destroy

  def self.export_for_firebase
    exported_json = "{
  \"user\" : {
    \"by_email\" : {"
    User.where.not(confirmed_at: nil).each do |user|
      exported_json += "
      \"#{user.email.gsub('.','%2E')}\" : {
        \"account_number\" : \"#{user.accounts.first.number}\",
        \"account_type\" : \"#{user.accounts.first.account_type.name}\",
        \"bank_name\" : \"#{user.accounts.first.bank.name}\",
        \"user_email\" : \"#{user.email}\",
        \"user_name\" : \"#{user.name}\",
        \"user_rut\" : \"#{user.dni}\""
      if user.username?
        exported_json += ",
        \"username\" : \"#{user.username}\""
      end
      exported_json += "
      },"
    end
    exported_json = exported_json[0..-2] # Remove last comma
    exported_json += "
    },
    \"by_username\" : {"
    User.where.not(confirmed_at: nil).where.not(username: nil).each do |user|
      exported_json += "
      \"#{user.username}\" : \"#{user.email}\","
    end
    exported_json = exported_json[0..-2] # Remove last comma
    exported_json += "
    }
  }
}"
    File.open('ruby_num_db.json', 'w') { |file| file.write(exported_json) }
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  dni                    :string
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  username               :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
