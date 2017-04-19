class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |a|
			a.string :answer, null: false
			a.integer :user_id, null: false
			a.integer :question_id, null: false

			a.timestamps
		end
	end
end
