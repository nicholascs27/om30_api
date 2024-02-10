class CreateMunicipe < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|

      t.string   :full_name
      t.string   :cpf
      t.string   :cns
      t.string   :email
      t.string   :telephone
      t.date     :birth_date
      t.boolean  :status

      t.timestamps
    end
  end
end
