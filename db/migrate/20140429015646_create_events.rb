class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.datetime :start
      t.datetime :end
      t.string :location

      t.timestamps
    end
  end
end
