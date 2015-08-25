require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/question")
require("./lib/survey")
require("pg")

ActiveRecord::Base.establish_connection(ENV['postgres://dwktfcccddsevw:3Ka_xkNUEFNOzZzxToNHH6ypML@ec2-54-83-58-191.compute-1.amazonaws.com:5432/d8jr2mkt7jfb8f'])


get('/') do
  erb(:index)
end

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

post('/surveys') do
  description = params.fetch('description')
  survey = Survey.create({:description => description})
  @surveys = Survey.all()
  erb(:surveys)
end

patch('/surveys') do
  update_description = params.fetch('update_description')
  update_survey = Survey.find(params.fetch("survey_edit").to_i())
  update_survey.update({:description => update_description})
  @surveys = Survey.all()
  erb(:surveys)
end

delete('/surveys') do
  delete_survey = Survey.find(params.fetch("survey_delete").to_i())
  delete_survey.destroy()
  @surveys = Survey.all()
  erb(:surveys)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:manage_survey)
end

post('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  question_description = params.fetch('description')
  @question = @survey.questions().new({:description => question_description})
  if @question.save()
    erb(:manage_survey)
  else
    erb(:errors)
  end
end

patch('/surveys/:id') do
  question = Question.find(params.fetch('question_id').to_i())
  update_description = params.fetch('update_description')
  question.update({:description => update_description})
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:manage_survey)
end

delete('/surveys/:id') do
  question = Question.find(params.fetch('question_id').to_i())
  question.destroy()
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:manage_survey)
end
