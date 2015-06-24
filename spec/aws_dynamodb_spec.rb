require 'spec_helper'

include AutoRedshiftCopySample

describe AwsDynamodb do
  let(:dynamodb) { AwsDynamodb.new }
  let(:message_id) { 'a12345' }
  let(:file_name) { 'test.csv.gz' }
  let(:not_exist_message_id) { 'xxxxxx' }
  let(:items) { ExistMessages.new }
  let(:not_exist_items) { NotExistMessages.new }

  describe 'add' do
    it 'should success' do
      expect(dynamodb).to receive(:put_message_id).with(anything)
      dynamodb.add({message_id: message_id, file_name: file_name})
    end
  end

  describe 'exist?' do
    it 'exist' do
      expect(dynamodb).to receive(:get_message_id).with(anything).and_return(items)
      result = dynamodb.exist?(message_id)
      expect(result).to eq(true)
    end

    it 'not exist' do
      expect(dynamodb).to receive(:get_message_id).with(anything).and_return(not_exist_items)
      result = dynamodb.exist?(not_exist_message_id)
      expect(result).to eq(false)
    end
  end

  class ExistMessages
    def item
      [{message_id: 'a12345'}]
    end
  end

  class NotExistMessages
    def item
      nil
    end
  end
end
