class AnswerVotes < ActiveRecord::Migration
	def change
		create_table :answer_votes do |a|
			a.integer :user_id, null: false
			a.integer :answer_id, null: false
			a.boolean :vote_type
		end
	end
end
