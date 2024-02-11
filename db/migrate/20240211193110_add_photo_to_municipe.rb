class AddPhotoToMunicipe < ActiveRecord::Migration[7.0]
  def change
    add_column :municipes, :photo, :string
  end
end
