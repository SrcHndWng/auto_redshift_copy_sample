require 'auto_redshift_copy_sample/version'
require 'settings'
require 'aws_sqs'
require 'aws_dynamodb'
require 'pgsql'
require 'command'

module AutoRedshiftCopySample
  class << self
    def main
      while true
        receive = sqs.receive
        if !receive.messages.nil?
          receive.messages.each do |message|
            next if dynamodb.exist?(message.message_id)

            receipt_handle = message[:receipt_handle]
            json = JSON.parse(message.body)
            file_name = json['Records'][0]['s3']['object']['key']
            puts file_name

            pgsql.exec(command.read(file_name))

            dynamodb.add({message_id: message.message_id, file_name: file_name})
            sqs.delete(receipt_handle)

            sleep(Settings.wait.second)
          end
        end

        puts "Waiting"
        sleep(Settings.wait.second)
      end
    rescue => e
      puts e.message
      puts e.backtrace.to_s
    end

    private

    def sqs
      @sqs ||= AwsSqs.new
    end

    def dynamodb
      @dynamodb ||= AwsDynamodb.new
    end

    def pgsql
      @pgsql ||= Pgsql.new
    end

    def command
      @command ||= Command.new
    end
  end
end
