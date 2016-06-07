class OurThreadsController < ApplicationController

  before_action :set_our_thread, only: [:show, :edit, :update, :destroy]

  def index
    @our_threads = OurThread.all
  end

  def show
  end

  def new
    @our_thread = OurThread.new
  end

  def create
    @our_thread = OurThread.new(our_thread_params)
    @our_thread.user_id = current_user.id
    if @our_thread.save
      redirect_to our_threads_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @our_thread.user_id == current_user.id
      if @our_thread.update(our_thread_params)
        redirect_to our_threads_path
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    if @our_thread.user_id == current_user.id
      @our_thread.destroy
      redirect_to our_threads_path
    else
      redirect_to our_threads_path
    end
  end


private

  def our_thread_params
    params[:our_thread].permit(:title)
  end

  def set_our_thread
    @our_thread = OurThread.find(params[:id])
  end

end
