class CommentsController < ApplicationController

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to @post, notice: 'Comentário adicionado.' 
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @comment.post, notice: 'Comentário atualizado.'
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
      params.require(:comment).permit(:author, :message)
    end

end
