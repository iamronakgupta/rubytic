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

  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :test_code)
  end
end