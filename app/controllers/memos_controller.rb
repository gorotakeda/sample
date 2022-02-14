class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update]
  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
   if @memo.save
     redirect_to memos_path
   elsif 
     render :new, status: :unprocessable_entity 
   end
  end

  def show
    
  end

  def edit
   
  end

  def update
   if @memo.update(memo_params)
     redirect_to memo_path(@memo)
   elsif 
     render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    memo = Memo.find(params[:id])
    if memo.destroy
      redirect_to memos_path
    end
  end

  private
  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:title, :body)
  end

end
