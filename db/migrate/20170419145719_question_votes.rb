class QuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |q|
			q.integer :user_id, null: false
			q.integer :question_id, null: false
			q.boolean :vote_type
		end
	end
end
