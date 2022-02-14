class VlogsController < ApplicationController
  before_action :set_vlog, only: [:show, :edit, :update, :destroy]
  def index
    @vlogs = Vlog.all
  end

  def new
    @vlog = Vlog.new
  end

  def create
    @vlog = Vlog.new(vlog_params)
   if @vlog.save
     redirect_to vlogs_path, notice: "Vlog was successfully created"
   elsif 
     render :new, status: :unprocessable_entity 
   end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
   if @vlog.update(vlog_params)
     redirect_to vlog_path, notice: "Vlog was successfully updated"
   elsif 
     render :edit, status: :unprocessable_entity 
   end
  end

  def destroy
    
    if @vlog.destroy
      redirect_to vlogs_path, notice: "Vlog was successfully destroied"
    end
  end

  private
  def set_vlog
    @vlog = Vlog.find(params[:id])
  end
  def vlog_params
    params.require(:vlog).permit(:title, :body)
  end
end
