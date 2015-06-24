require 'aws-sdk'
require 'settings'

module AutoRedshiftCopySample
  class AwsSqs
    def receive
      sqs.receive_message({queue_url: Settings.sqs.url})
    end

    def delete(receipt_handle)
      sqs.delete_message({queue_url: Settings.sqs.url,
                          receipt_handle: receipt_handle})
    end

    private

    def sqs
      @sqs ||= Aws::SQS::Client.new(
          region: Settings.sqs.region,
          profile: Settings.sqs.profile
      )
    end
  end
end