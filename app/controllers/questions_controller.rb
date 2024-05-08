class QuestionsController < ApplicationController

  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
    @code = ""
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
      File.write('test_code.rb', @question.test_code)
      File.write('ruby_code.rb', params[:code])
      
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :test_code)
  end
end
