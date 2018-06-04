class AddPolyToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :cm_duty_id, :integer
    add_column :comments, :cm_duty_type, :string
  end
end
