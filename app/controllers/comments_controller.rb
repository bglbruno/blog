class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @comment.post, notice: 'Comentário adicionado com sucesso.' }
      else
        format.html { redirect_to @comment.post }
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :message, :post_id)
    end

end
