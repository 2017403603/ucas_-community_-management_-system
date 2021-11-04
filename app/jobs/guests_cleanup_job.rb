class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    job_logger = Logger.new('log/job.log')
    job_logger.info(args.inspect)
  end
end
