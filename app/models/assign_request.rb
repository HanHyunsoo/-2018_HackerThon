class AssignRequest < ActiveRecord::Base
    has_and_belongs_to_many :categories
    has_one :good
    has_many :assign_request_comments, dependent: :destroy #혜민이한테 물어보기
    mount_uploader :img_url, ImguploaderUploader
    validates :category_ids, :acceptance => true
    # validates_acceptance_of :category_ids, message: 'tick the checkbox!'


    
    # , :join_table => "assign_requests_categories", :foreign_key => "assign_request_id"
end
