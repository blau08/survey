require('spec_helper')

describe(Question) do
  describe('#survey') do
    it('returns the survey that the question is associated with') do
      test_survey = Survey.new({:description => "Country"})
      test_question = test_survey.questions().new({:description => "Mongolia or Switzerland?"})
      test_survey.save()
      expect((test_question.survey())).to(eq(test_survey))
    end
  end

    it('validates presence of description') do
      question = Question.new({:description=> ''})
      expect(question.save()).to(eq(false))
    end

    it('keep length of description under 50 characters') do
      test_question =  Question.new({:description => 'mobbed'.*(10)})
      expect(test_question.save()).to(eq(false))
    end
end
