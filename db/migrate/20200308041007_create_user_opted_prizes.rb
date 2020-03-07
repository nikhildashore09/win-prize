class CreateUserOptedPrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_opted_prizes do |t|
      t.references :user, foreign_key: true
      t.references :prize, foreign_key: true
    end
  end
end
