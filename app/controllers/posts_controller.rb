class PostsController < ApplicationController

  def new

  end

  def create
    @post = Post.new(post_params)
    #has body
    @post.user = current_user
    @post.links.new(link_data)

    @post.circles.new(circle_data)

    if @post.save

      redirect_to posts_url
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def destory

  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  # extract out submission info from form and make link objects for post
  def link_data
    params.permit(links: [:url])
      .require(:links)
      .values
  end

  def circle_data
     params.permit(circle: [:id]).require(:circle).values
  end


  # def
  #   return [] if params[:users].nil?
  #   params.require(:users).require(:user_ids)
  # end

end