class Article < ActiveRecord::Base
        # attr_accessible :name, :board_id
        belongs_to :board
end
