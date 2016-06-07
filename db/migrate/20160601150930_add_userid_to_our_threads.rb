class AddUseridToOurThreads < ActiveRecord::Migration
  def change
    add_column :our_threads, :user_id, :integer
  end
end
