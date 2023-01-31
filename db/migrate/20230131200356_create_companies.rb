class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      # didn't do ID - rails assumes that we always do that
      t.string "name"
      t.string "city"
      t.string "state"
      t.string "url"
      # t.string "address"

      t.timestamps
    end
  end
end
