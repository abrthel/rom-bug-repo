RSpec.shared_context 'database setup' do
  let(:conf) { ROM::Configuration.new(:sql, DB_URI) }

  let!(:conn) { conf.gateways[:default].connection }

  let(:container) { ROM.container(conf) }

  before do
    conn.loggers << LOGGER
  end
end

RSpec.shared_context 'database' do
  include_context 'database setup'

  before do
    [:users].each {|table| conn.drop_table?(table) }

    conn.create_table :users do
      primary_key :id
      String :username, null: false
      String :gender,   default: 'unknown'
    end
  end

  after do
    container.disconnect
  end
end
