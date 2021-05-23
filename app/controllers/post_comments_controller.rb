class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.save
    redirect_to posts_path
    # つぶやき一覧へリダイレクト
  end
  def destroy
    @post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to posts_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:post_comment)
  end
end