require 'helper'

describe EY::Notifier do
  context 'configuration' do
    it 'is callable from .configure' do
      EY::Notifier.configure do |c|
        expect(c).to be_kind_of(EY::Notifier::Configuration)
      end
    end
  end
end
