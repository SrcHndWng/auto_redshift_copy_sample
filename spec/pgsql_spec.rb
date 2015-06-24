require 'spec_helper'

include AutoRedshiftCopySample

describe Pgsql do
  let(:pgsql) { Pgsql.new }

  describe 'exec' do
    it 'should success' do
      expect(pgsql).to receive(:exec).with(anything).and_return(true)
      result = pgsql.exec('select count(*) from test;')
      expect(result).to be_truthy
    end
  end
end
