get '/' do
  @question = Question.all.order('created_at DESC').first(6)
  @answer = Answer.all.order('updated_at DESC').first(4)
  # @answer = Answer.find(params[:a_id])
  erb :"static/index"
end



