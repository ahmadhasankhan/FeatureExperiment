class PostNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(post)
    # Do something later
  end
end
