class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.string :company
      t.string :point_of_contact
      t.date :date
      t.date :follow_up_date
      t.string :feedback
      t.string :status
      t.string :mode
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :profile, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
