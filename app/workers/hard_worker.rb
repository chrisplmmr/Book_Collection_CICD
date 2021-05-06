class HardWorker
  include Sidekiq::Worker

  def perform(_client_email, _message)
    # Send the mail
  end
end
