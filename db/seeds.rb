# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create([{name:"wenxue"},{name:"jishu"}])
em = Employee.create(email:"107422244@qq.com",password:"11111111",name:"jamst")

Employee.create([{email:"371671349@qq.com",password:"11111111",name:"aw"},{email:"945642317@qq.com",password:"11111111",name:"pang8"}])


roles = Role.create([{name:"admin"},{name:"xiaoshou"},{name:"kefu"}])

permissions = Permission.create([{name:"员工管理",action_tag:"index",controller_tag:"employees"},{name:"文章管理",action_tag:"index",controller_tag:"blogs"},{name:"类型管理",action_tag:"index",controller_tag:"categories"}])