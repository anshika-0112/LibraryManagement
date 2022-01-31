class Book < ApplicationRecord

    validates :name, presence: true, length:{minimum:3,maximum:25}
    validates :author,presence: true,length:{minimum:3,maximum:25}
    validates :number_of_copies,presence:true
end