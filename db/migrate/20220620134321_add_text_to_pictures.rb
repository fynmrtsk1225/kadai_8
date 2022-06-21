class AddTextToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :content, :text
    add_column :pictures, :image, :text
  end
end
