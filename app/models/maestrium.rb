class Maestrium < ActiveRecord::Base
  belongs_to :user
  attr_accessible :codigo, :nombre, :user, :user_id
end
