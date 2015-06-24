require 'spec_helper'

include AutoRedshiftCopySample

describe Command do
  let(:cmd) { Command.new }

  describe 'read' do
    it 'sample1' do
      text = cmd.read('sample1.csv.gz')
      expect(text).to be_truthy
      expect(text.include?('sample1')).to be_truthy
    end

    it 'sample2' do
      text = cmd.read('sample2.csv.gz')
      expect(text).to be_truthy
      expect(text.include?('sample2')).to be_truthy
    end
  end
end