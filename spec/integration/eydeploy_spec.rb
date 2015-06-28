require 'helper'
require 'support/deploy'

describe 'eydeploy.rb' do
  let(:deploy) { Deploy.new }

  before do
    EY::Notifier.notifications[:after_bundle] = []
    deploy.instance_eval(File.open('spec/support/eydeploy.rb').read)
  end

  it 'does not override user deploy hooks' do
    expect(deploy).to receive(:some_method).with(:after_bundle)
    deploy.callback(:after_bundle)
  end

  it 'configures notifications' do
    expect(EY::Notifier.notifications[:after_bundle].length).to eq 1
  end

  it 'notifies' do
    expect(EY::Notifier).to receive(:notify).with(:after_bundle)
    deploy.callback(:after_bundle)
  end
end
