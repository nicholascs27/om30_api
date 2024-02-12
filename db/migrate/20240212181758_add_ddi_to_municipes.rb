class AddDdiToMunicipes < ActiveRecord::Migration[7.0]
  def change
    add_column :municipes, :ddi, :string
  end
end
