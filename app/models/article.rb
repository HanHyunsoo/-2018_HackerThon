class Article < ActiveRecord::Base
    # attr_accessor :title, :board_id
    mount_uploader :img, ImguploaderUploader
    belongs_to :board
    
    #u_id는?
end
