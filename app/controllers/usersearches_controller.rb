class UsersearchesController < ApplicationController
  
  def show
    if params.include?(:q)
      create
      render :create
    else
      new
      render :new
    end
  end
  
  def new
  end
  
  def create
    @users = User.search(
      params[:q],
      :with => { :activated => false } ,
      :page => (params[:page] || 1),
      :per_page => 10,
      :order => 'created_at DESC'
    )
  end
  
end
