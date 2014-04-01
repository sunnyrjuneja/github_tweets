class RepositoriesController < ApplicationController
  def index
    if signed_in?
      @repos = current_user.repositories
    else
      redirect_to '/auth/github'
    end
  end

  def show
  end

  def update
  end
end
