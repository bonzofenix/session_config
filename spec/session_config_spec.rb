require 'spec_helper'

describe SessionConfig do
  class ExampleClass
    extend SessionConfig
  end
  let(:session_config_dir){ "#{ENV['HOME']}/.example_class" }

  it 'has a version number' do
    expect(SessionConfig::VERSION).not_to be nil
  end

  describe '@set_conf' do
    describe 'when configuration has not been set' do
      before{ `rm -rf #{session_config_dir}` }

      it 'should write conf to the yaml' do
        expect do
          ExampleClass.set_conf :foo, 'baz'
        end.to change{ ExampleClass.get_conf :foo }.from(nil).to('baz')
      end
    end

    describe 'when configuration has been set' do
      before{ ExampleClass.set_conf :foo, 'bar' }

      it 'should merge conf to the yaml' do
        expect do
          ExampleClass.set_conf :foo, 'baz'
        end.to change{ ExampleClass.get_conf :foo }.from('bar').to('baz')
      end
    end
  end

  describe '@session_config_dir' do
    it 'should save in ~/.example_class by default' do
      expect(ExampleClass.session_config_dir).to eq("#{ENV['HOME']}/.example_class")
    end
  end
end
