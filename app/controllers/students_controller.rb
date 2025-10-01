class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(sid: params[:student][:sid], name: params[:student][:name], email: params[:student][:email])
    if @student.save
      flash[:notice] = '１レコード追加しました'
      redirect_to '/'
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = 'レコードを削除しました'
      redirect_to '/'
    else
      render 'index', status: :unprocessable_entity
    end
  end
    
  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(sid: params[:student][:sid], name: params[:student][:name], email: params[:student][:email])
      flash[:notice] = 'レコードを編集しました'
      redirect_to '/'
    else
      render 'edit', status: :unprocessable_entity
    end
  end
end
