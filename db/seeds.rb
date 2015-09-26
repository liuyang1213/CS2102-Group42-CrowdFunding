ActiveRecord::Base.transaction do
  User.create(name: 'Tom', password: 'helloword')
end