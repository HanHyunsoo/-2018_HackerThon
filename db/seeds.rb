# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

autorities = Autority.create([{name: '관리자'}, {name: '수공업자'}, {name: '일반회원'}])
statuses = Status.create([{name: '의뢰 접수'}, {name: '디자인 조율'}, {name: '제작 준비'}, {name: '제작중'}, {name: '제작 완료'}])
boards = Board.create([{name: '자유게시판'}, {name: '공지사항'}])
# User.create(name: '위니크', email: 'zzz0484@likelion.org', )

#seed파일 적용 명령어
#rake db:migrate 후 rake db:seed

