require 'byebug'
# post '/questions/:id/upvote' do
#     current_vote = current_user.question_votes.find_by(question_id: params[:id])
#     if current_vote.nil?
#         @vote = current_user.question_votes.new(question_id: params[:id], vote_type: true)
#         @vote.save
#     redirect '/'
#     end
# end  QUORA ONLY HAS DOWNVOTE FOR TOPICS

post '/questions/:id/downvote' do
   current_vote = current_user.question_votes.find_by(question_id: params[:id])
    if current_vote.nil?
        @vote = QuestionVote.new(question_id: params[:id], vote_type: false, user_id: current_user.id)
        @vote.save
        # redirect "/questions/#{params[:id]}"
    else
        current_vote = current_user.question_votes.find_by(question_id: params[:id])
        current_vote.destroy
        # redirect "/questions/#{params[:id]}"
    end
    return QuestionVote.where(question_id: params[:id], vote_type: false).count.to_json
end

# delete '/questions/:id/downvote' do
#     current_vote = QuestionVote.find(params[:id])
#     current_vote.destroy(vote_type: false)
    
# end



post '/questions/:id/answer/:a_id/upvote' do
    # byebug
    current_vote = current_user.answer_votes.find_by(answer_id: params[:a_id])
    if current_vote.nil?
        @vote = AnswerVote.new(answer_id: params[:a_id], vote_type: true, user_id: current_user.id)
        @vote.save
    end

    # redirect "/questions/#{params[:id]}"
    # elsif    
    #     current_vote = current_user.answer_votes.find_by(answer_id: params[:a_id])
    #     current_vote.destroy
    #     redirect "/questions/#{params[:id]}"
    # else
    #     redirect "/questions/#{params[:id]}"
return AnswerVote.where(answer_id: params[:id], vote_type: true).count.to_json
end

post '/questions/:id/answer/:a_id/downvote' do
    current_vote = current_user.answer_votes.find_by(answer_id: params[:a_id])
    if current_vote.vote_type == true
        current_vote.destroy
        # @vote = current_user.answer_votes.new(answer_id: params[:a_id], vote_type: false)
        # @vote.save
    #     redirect "/questions/#{params[:id]}"
    # else
    #     redirect "/questions/#{params[:id]}"
    end
return AnswerVote.where(answer_id: params[:id], vote_type: true).count.to_json
end
