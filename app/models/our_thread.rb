class OurThread < ActiveRecord::Base
  has_many :my_comments, :dependent => :destroy 
  validates :title, presence: true
end
