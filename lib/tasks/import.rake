require 'csv'

desc "Import questions from csv file"
task :import => [:environment] do

  file = "db/questions.csv"

  CSV.foreach(file, :headers => true) do |row|
    Question.create(
      category_id: row[0],
      text: row[1],
      answer_variants: [AnswerVariant.create(text: row[2], value: true),
                        AnswerVariant.create(text: row[3]),
                        AnswerVariant.create(text: row[4]),
                        AnswerVariant.create(text: row[5]),]
    )
  end

end