feature 'Creating properties' do
  scenario 'I cant create a new peoperty without signing in' do
    visit '/properties/new'
    expect(current_path).to eq('/properties')
  end
end
