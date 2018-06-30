require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe '步驟12' do
    # it '資料驗證' do
    #   task_size = Task.all.size
    #   Task.create(title: 'aa', description: '')
    #   Task.create(title: '', description: 'bb')
    #   expect(Task.all.size).to eq task_size
    # end

    it '資料驗證 - 標題必填' do
      task = Task.create(title: '', description: 'xx')
      expect(task).to_not be_valid
      expect(task.errors.messages[:title].first).to_not be nil?
    end

    it '資料驗證 - 內容必填' do
      task = Task.create(title: 'xx', description: '')
      expect(task).to_not be_valid
      expect(task.errors.messages[:description].first).to_not be nil?
    end

  end

  describe '步驟14' do

    it '資料驗證 - 結束時間必填' do
      task = Task.create(title: 'xx', description: 'xx', end_at: '')
      expect(task).to_not be_valid
      expect(task.errors.messages[:description].first).to_not be nil?
    end

  end

end