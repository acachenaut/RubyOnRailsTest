class NotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @note = @article.notes.create(note_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @note = @article.notes.find(params[:id])
    @note.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def note_params
      params.require(:note).permit(:note)
    end
end
