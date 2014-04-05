class RepositorySyncerWorker
  include SuckerPunch::Job

  def perform(user_id)
    ActiveRecord::Base.connection_pool.with_connection do 
      user = User.find(user_id)
      RepositorySyncer.new(user).sync
    end
  end
end
