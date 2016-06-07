class MyCommentsController < ApplicationController

  before_action :set_our_thread, only: [:create, :edit, :update, :destroy]
  before_action :set_my_comment, only: [:edit, :update, :destroy]

  def create
    @my_comment = @our_thread.my_comments.new(my_comment_params)
    @my_comment.user_id = current_user.id
    if @my_comment.save
      redirect_to our_thread_path(@our_thread.id)
    else
      redirect_to our_thread_path(@our_thread.id)
    end
  end

  def edit
  end

  def update
    if @my_comment.user_id == current_user.id
      if @my_comment.update(my_comment_params)
        redirect_to our_thread_path(@our_thread.id)
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end


  def destroy
    if @my_comment.user_id == current_user.id
      @my_comment.destroy
    else
    end
    redirect_to our_thread_path(@our_thread.id)
  end


private

  def my_comment_params
    params[:my_comment].permit(:title)
  end

  def set_our_thread
    @our_thread = OurThread.find(params[:our_thread_id])
  end

  def set_my_comment
    @my_comment = @our_thread.my_comments.find(params[:id])
  end

end
