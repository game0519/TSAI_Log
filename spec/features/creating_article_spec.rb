require 'rails_helper'

feature 'Article Creation Test' do
  scenario 'Create An Article' do
    visit '/articles/new'
    fill_in '標題', with: '我是試測文'
    fill_in '類別編號', with: '123'
    fill_in '圖片連結', with: '我是測試的內文'
    fill_in '內文', with: '我是內文，不是勝文'
    click_button '新增文章'
    expect(page).to have_content('文章建立完成')
  end
end
