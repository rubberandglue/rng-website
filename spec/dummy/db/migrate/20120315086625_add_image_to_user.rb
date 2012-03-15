class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string

    add_column :users, :image_width, :integer

    add_column :users, :image_height, :integer

  end
end
