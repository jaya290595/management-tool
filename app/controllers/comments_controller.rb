class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:account_id]
      @commentable = Account.find(params[:account_id])
      
    elsif params[:team_id]
      @commentable = Team.find(params[:team_id])
    end
    @comment =@commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save 
    redirect_to @commentable, notice: "Your comment was successfully created."
  end




  # def show
  #   @account = Account.find(params[:id])
  #   @commentable = @account
  #   @comments = @commentable.comments
  #   @comment = Comment.new
  # end

  private

  # def load_commentable
  #     resource, id = request.path.split('/')[1,2]
  #     @commentable = resource.singularize.classify.constantize.find(id)
  # end

  def comment_params
      params.require(:comment).permit(:content)
    end
end
