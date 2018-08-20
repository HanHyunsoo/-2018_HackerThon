class Article < ActiveRecord::Base
    # attr_accessor :title, :board_id
    mount_uploader :img, ImguploaderUploader
    belongs_to :board
end
