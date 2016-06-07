class MyComment < ActiveRecord::Base
  belongs_to :our_thread
  validates :title, presence: true
end
