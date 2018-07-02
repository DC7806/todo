# Create User
user = User.create(user_name: 'aa', email: 'aa@gmail.com') if User.where(user_name: 'aa').empty?
# Assign existing tasks to user
unless Task.all.empty?
  Task.all.each do |t|
    TaskUserRelation.create(task_id: t.id, user_id: user.id)
  end
end