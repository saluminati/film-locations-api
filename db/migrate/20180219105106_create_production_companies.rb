class CreateProductionCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :production_companies do |t|
      t.string :name, null: false, default: "", limit: 100
      t.timestamps
    end
  end
end
