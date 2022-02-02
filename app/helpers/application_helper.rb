module ApplicationHelper

    def isRequested?
        !BookRegistry.where(user_id: current_user.id,book_id: @book.id).first.nil?
    end

    def isIssued?
        BookRegistry.where(user_id: current_user.id,book_id: @book.id,book_return_date:nil).first.nil?
    end
end
