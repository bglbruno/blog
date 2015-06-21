# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
200.times do |i|
  p = Post.create(title: 'Post ' + i.to_s, content: '123456789101112131415')
  p.save
  50.times do |j|
    c = Comment.create(author: 'Autor ' + j.to_s, message: 'Mensagem ' + j.to_s, post: p)
    c.save
  end
end
