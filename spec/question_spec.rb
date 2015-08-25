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
end
