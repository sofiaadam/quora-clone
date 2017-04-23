
get '/questions' do
    @question = Question.all.order('created_at DESC')
    erb :"question/index"
end

get '/topquestions' do
    @top_quest = QuestionVotes.all.count('vote_type DESC')
    erb :"/"
end


get '/questions/new' do
    erb :'question/new'
end

post '/questions/new' do
    question = Question.new(params[:question])
    question.user_id = current_user.id
    if question.save
        "<h1>Created!</h1>"
        redirect '/questions'
    else
        "<h1> error </h1>"
    end
end

get '/questions/:id' do
    @question = Question.find(params[:id])
    erb :'/question/show'
end


post '/questions/:id/answer' do 
    @question = Question.find(params[:id])
    answer = Answer.new(answer: params[:answer])
    answer.question_id = @question.id
    answer.user_id = current_user.id
    if answer.save
        flash[:img] = "Answer submitted"
        redirect "/questions/#{params[:id]}"
    else
        flash[:img] = "Something went wrong"
        redirect "/questions/#{params[:id]}"
    end
end


