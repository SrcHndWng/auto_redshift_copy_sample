require 'aws-sdk'
require 'settings'

module AutoRedshiftCopySample
  class AwsDynamodb
    def add(item)
      put_message_id(item)
    end

    def exist?(message_id)
      result = get_message_id(message_id)
      return !result.item.nil?
    end

    private

    def get_message_id(message_id)
      dynamodb.get_item({table_name: Settings.dynamodb.message_ids_table,
                         key: { message_id: message_id }})
    end

    def put_message_id(item)
      dynamodb.put_item({table_name: Settings.dynamodb.message_ids_table,
                         item: item})
    end

    def dynamodb
      @dynamodb ||= Aws::DynamoDB::Client.new(
          region: Settings.dynamodb.region,
          profile: Settings.dynamodb.profile
      )
    end
  end
end