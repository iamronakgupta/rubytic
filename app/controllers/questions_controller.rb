class QuestionsController < ApplicationController

  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
    @code = ""
  end

  def edit
    @question = Question.find params[:id]
  end

  def update 
    @question = Question.find params[:id]

    if @question.update(question_params)
      redirect_to @question
    else
      render :new, status: :unprocessable_entity
    end

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new, status: :unprocessable_entity
    end
  end

  def run_test
    @question = Question.find params[:question_id]
    if @question
      File.write('spec/questions/test_code.rb', @question.test_code)
      File.write('app/questions/ruby_code.rb', params[:code])

      new_line = "require_relative '../../app/questions/ruby_code'"

      # Read the content of the file
      file_content = File.read("spec/questions/test_code.rb")

      # Remove lines containing 'require' and insert the new line
      file_content.gsub!(/^.*require.*$/, new_line)

      # Write the modified content back to the file
      File.open("spec/questions/test_code.rb", "w") { |file| file.puts file_content }

      rspec_command = 'rspec spec/questions/test_code.rb'
      system(rspec_command)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :test_code)
  end
end
