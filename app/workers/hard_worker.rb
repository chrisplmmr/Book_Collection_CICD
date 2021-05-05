class HardWorker
  include Sidekiq::Worker

  def perform(client_email, message)
    # Send the mail
    puts 'FUCK LOL'
  end
end
