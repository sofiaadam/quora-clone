get '/' do
  @question = Question.all.order('created_at DESC').first(6)
  # @top_quest = QuestionVote.count('vote_type').to_s
  erb :"static/index"
end

