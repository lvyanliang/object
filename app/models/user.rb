class User < ActiveRecord::Base
  attr_accessible :password, :status, :username
end
