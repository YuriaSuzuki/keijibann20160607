class CreateOurThreads < ActiveRecord::Migration
  def change
    create_table :our_threads do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
