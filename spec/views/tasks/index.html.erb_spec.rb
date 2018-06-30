require 'rails_helper'

RSpec.describe 'tasks/index.html.erb' do

  before do
    @first_task = Task.create(title: 'first_title', description: 'first_desc', end_at: Time.now)
    @new_task = Task.create(title: 'new_title', description: 'new_desc', end_at: Time.now + 1.day)
  end

  # 兩排序規則需要同時存在？
  # describe '步驟11' do
  #   it '任務列表以建立時間排序' do
  #    visit '/tasks'
  #    page.body.index(@new_task.title).should < page.body.index(@first_task.title)
  #   end
  # end

  describe '步驟14' do
    it '列表頁能夠以結束時間排序(離結束時間越近排序越前)' do
     visit '/tasks'
     page.body.index(@new_task.title).should > page.body.index(@first_task.title)
    end
  end

end