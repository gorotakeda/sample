class NotesController < ApplicationController
  before_action :note_set, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
   if @note.save
     redirect_to notes_path, notice: "Note was successfully created"
   elsif 
     render :new
   end
  end


  def show
  end

  def edit
  end

  def update
   if @note.update(note_params)
     redirect_to note_path(@note), notice: "Note was successfully updated"
   elsif 
     render :show
   end
  end

  def destroy
    if @note.destroy
      redirect_to notes_path, notice: "Note was successfully destroied"
    end
  end

  private

  def note_set
    @note = Note.find(params[:id])
  end
  def note_params
    params.require(:note).permit(:title, :body)
  end

end
