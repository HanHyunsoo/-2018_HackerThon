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
