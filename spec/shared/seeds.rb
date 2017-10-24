RSpec.shared_context 'seeds' do
  before do
    conn[:users].insert id: 1, username: 'kira', gender: 'female'
    conn[:users].insert id: 2, username: 'edgar', gender: 'male'
  end
end
