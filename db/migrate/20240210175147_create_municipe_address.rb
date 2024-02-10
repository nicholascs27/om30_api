class CreateMunicipeAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :municipe_addresses do |t|

      t.string      :street
      t.string      :street_number
      t.string      :neighborhood
      t.string      :address_complement
      t.string      :cep
      t.string      :city
      t.string      :state
      t.string      :ibge_code
      t.references  :municipe, null: false

      t.timestamps
    end
  end
end
