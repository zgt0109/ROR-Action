# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text(65535)
#

class Category < ActiveRecord::Base
  has_many :events
end
