require 'spec_helper'

describe AutoRedshiftCopySample do
  it 'has a version number' do
    expect(AutoRedshiftCopySample::VERSION).not_to be nil
  end

  it 'call main' do
    expect(AutoRedshiftCopySample).to receive(:main)
    AutoRedshiftCopySample::main
  end
end
