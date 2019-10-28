# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


courses = Course.create([
  {
    name:'testcoures',
    slug:'testcoures',
    thumbnail:'testcoures',
  }
])

groups = Group.create([
  {
    name:'testgroup',
    slug:'testgroup',
    decription:'testgroup',
    thumbnail:'testgroup',
    startdate:'21/09/2019',
    course_id: '1',
  }
])

user  = User.create([
  {
    email:'abc@ntq-solution.com.vn',
    encrypted_password:'trunganh1514',
    provider:'id11314',
    uid:'1',
    pictures:'14abc',
    givenname:'trung',
    fullname:'trunganh',
    dateofbirth:'11/02/2001',
  }
])
