class DiariesController < ApplicationController
  before_action :diary_set, only: [:show, :edit, :update]
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
   if @diary.save
     redirect_to diaries_path, notice: "Diary was successfuly creaed"
   elsif 
     render :new, status: :unprocessable_entity 
   end
  end

  def show
    
  end

  def edit
    
  end

def update
    
   if @diary.update(diary_params)
     redirect_to diaries_path, notice: "Diary was successfuly updated"
   elsif 
     render edit, status: :unprocessable_entity
   end
end

def destroy
  diary = Diary.find(params[:id])
  if diary.destroy
    redirect_to diaries_path, notice: "Diary was successfuly deleted"
  end
end

  private

  def diary_set
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :body)
  end

end
