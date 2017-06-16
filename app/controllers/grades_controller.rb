class GradesController < ApplicationController
  before_action :find_grade, only: [:show, :edit, :update, :destroy]
  
  def index
    @grades = Grade.all
  end
  
  def new
    @grade = Grade.new
  end
  
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      redirect_to grades_path
    else
      render 'new'
    end
  end
  
  def edit

  end
  
  def update 
    if @grade.update(grade_params)
      redirect_to grades_path
    else
      render 'edit'
    end    
  end
  
  def destroy
    @grade.destroy
    redirect_to grades_path
  end
  
  private
  def grade_params
    params.require("grade").permit(:name, :identity, :score)
  end
  
  def find_grade
    @grade = Grade.find_by(id: params[:id])
    redirect_to grades_path if @grade.nil?
  end
end
