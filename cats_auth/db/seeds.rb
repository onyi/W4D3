# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  
  Cat.destroy_all
  cat1 = Cat.create!(birth_date: '2014-12-31', color: 'black', name: 'Hulk', sex: 'M', description: 'this is description')
  cat2 = Cat.create!(birth_date: '2013-12-31', color: 'gray', name: 'Ironman', sex: 'F', description: 'this is description')
  cat3 = Cat.create!(birth_date: '2016-12-31', color: 'white', name: 'Thor', sex: 'M', description: 'this is description')
  cat4 = Cat.create!(birth_date: '2010-12-31', color: 'white', name: 'Thanos', sex: 'M', description: 'this is description')
  cat5 = Cat.create!(birth_date: '2012-12-31', color: 'brown', name: 'Spiderman', sex: 'F', description: 'this is description')
  cat6 = Cat.create!(birth_date: '2007-12-31', color: 'black', name: 'HulkJr', sex: 'F', description: 'this is description')
  cat7 = Cat.create!(birth_date: '2014-12-31', color: 'gray', name: 'Vision', sex: 'F', description: 'this is description')
  cat8 = Cat.create!(birth_date: '2012-12-31', color: 'white', name: 'Venom', sex: 'M', description: 'this is description')

end

# COLORS = %w(red blue yellow black orange white pink)
# SEXS = %w(M F)
# 5.times { Cat.new(birth_date: Faker::Date.between((1..50).to_a.sample.days.ago, Date.today), color: COLORS.sample, name: Faker::Creature::Cat.name, sex: SEXS.sample, description: Faker::Lorem.sentence(5)).save } 
