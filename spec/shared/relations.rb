RSpec.shared_context 'relations' do
  let(:users) { container.relations[:users] }

  before do
    conf.relation(:users) { schema(infer: true) }
  end
end
