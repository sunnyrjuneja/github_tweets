class RepositoriesController < ApplicationController
  before_action :require_sign_in
  before_action :correct_user_and_repo, only: [:show]

  def index
    @repos = current_user.repositories
  end

  def show
  end

  def update
  end

  private

    def require_sign_in
      redirect_to '/auth/github' unless signed_in?
    end

    def correct_user_and_repo
      @repo = Repository.find_by_id(params[:id])
      redirect_to repositories_path unless @repo && current_user?(@repo.user)
    end
end
