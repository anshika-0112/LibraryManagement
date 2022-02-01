class Book < ApplicationRecord
    has_many :book_registries
    has_many :users, :through=> :book_registries

    validates :name, presence: true, length:{minimum:3,maximum:25}
    validates :author,presence: true,length:{minimum:3,maximum:25}
    validates :number_of_copies,presence:true
end