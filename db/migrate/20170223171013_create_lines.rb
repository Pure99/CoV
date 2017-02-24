class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.date :date
      t.decimal :pr_1_mpa, precision: 10, scale: 1
      t.decimal :pr_1_p, precision: 10, scale: 1
      t.decimal :pr_28_mpa, precision: 10, scale: 1
      t.decimal :pr_28_p, precision: 10, scale: 1
      t.decimal :pr_pr_mpa, precision: 10, scale: 1
      t.decimal :pr_pr_p, precision: 10, scale: 1
      t.text :note
      t.boolean :mark
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
