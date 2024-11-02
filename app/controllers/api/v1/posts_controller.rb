class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user

  def index
    posts = Post.includes(:user).all
    render json: posts.as_json(include: { user: { only: :username } }), status: :ok
  end

  def create
    post = @current_user.posts.build(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
