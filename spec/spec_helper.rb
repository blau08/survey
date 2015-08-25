require('rspec')
require('pry')
require('pg')
require('sinatra/activerecord')
require('question')
require('survey')

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:each) do
    Question.all().each() do |question|
      question.destroy()
    end
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end
end
