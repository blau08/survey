class CreateTables < ActiveRecord::Migration
  def change
    create_table(:surveys) do |s|
      s.column(:description, :string)
    end

    create_table(:questions) do |q|
      q.column(:description, :string,)
      q.column(:survey_id, :int)
    end
  end
end
