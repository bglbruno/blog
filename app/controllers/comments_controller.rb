class CommentsController < ApplicationController

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @comment.post }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comentário adicionado com sucesso.' }
      else
        format.html { redirect_to @comment.post }
      end
    end
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post, notice: 'Comentário removido com sucesso.' }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :message, :post_id)
    end

end
