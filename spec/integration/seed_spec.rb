RSpec.describe 'Seeding' do
  include_context 'database'
  include_context 'relations'
  include_context 'seeds'

  let(:subject) { ROM::Seed::SeedSet.new(users) }
  let(:relation) { subject.relation }

  it 'inserts new seeds' do
    user = {id: 3, username: 'briang', gender: 'male'}
    subject.data(user).call

    result = relation.to_a
    expect(result).to include(user)
  end

  it 'unrestricted ensures only new seeds are created' do
    subject
      .data(
        {username: 'kira'},
        {username: 'kira', gender: '1'},
        {username: 'kira', gender: '2'},
        {username: 'kira', gender: '3'}
      )
      .unrestrict
      .call

    # NOTE: clean out attributes
    result = users.to_a.select {|v| v[:username] == 'kira' }
    expect(result.count).to eq(5)
  end
end
