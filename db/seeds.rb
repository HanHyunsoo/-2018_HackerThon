# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
boards = Board.create([{title: '자유게시판'}, {title: '공지사항'}])
categories = Category.create([{name: '가방'}, {name: '가죽'}, {name: '가구'}])
autorities = Autority.create([{name: '관리자'}, {name: '수공업자'}, {name: '일반회원'}])
#관리자 1/ 수공업자 2/ 일반회원 3


    User.create(email: 'admin', password: '123123', name: '관리자',
                mail: 'admin@1', authorization: 1, business_number: '0',
                phone_number: '010-1111-1111', address:'0',
                postcode: '0', details: '0', extra_info: '0')
                

    User.create(email: '111', password: '123123', name: '김승래',
                mail: 'admin@1', authorization: 3, business_number: nil,
                phone_number: '010-1111-1111', address:'0',
                postcode: '0', details: '0', extra_info: '0')
                


    User.create(email: '222', password: '123123', name: '박결',
                mail: 'admin@1', authorization: 2, business_number: '111',
                phone_number: '010-1111-1111', address:'0',
                postcode: '0', details: '0', extra_info: '0')
                
    User.create(email: '333', password: '123123', name: '이혜민',
                mail: 'admin@1', authorization: 2, business_number: '222',
                phone_number: '010-1111-1111', address:'0',
                postcode: '0', details: '0', extra_info: '0')


    Good.create!(s_id:'2', c_id:'1' price:'100', image_url:'1.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'200', image_url:'2.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'300', image_url:'3.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'400', image_url:'4.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'500', image_url:'5.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'600', image_url:'6.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'700', image_url:'7.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'800', image_url:'8.jpg')
    Good.create!(s_id:'2', c_id:'1' price:'900', image_url:'9.jpg')