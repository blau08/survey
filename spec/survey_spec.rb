require('spec_helper')

describe(Survey) do
  it('converts the name of the survey to uppercase') do
    survey = Survey.create({:description => 'A Questionnaire on Pre-Depression Economics'})
    expect(survey.description).to(eq('A QUESTIONNAIRE ON PRE-DEPRESSION ECONOMICS'))
  end
end
