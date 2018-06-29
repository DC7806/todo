require 'rails_helper'

RSpec.describe 'tasks/index.html.erb' do

  before do
    @first_task = Task.create(title: 'first_title', description: 'first_desc')
    @new_task = Task.create(title: 'new_title', description: 'new_desc')
  end

  describe '步驟11' do
    it '任務列表以建立時間排序' do
     visit '/tasks'
     page.body.index(@new_task.title).should < page.body.index(@first_task.title)
    end
  end

end