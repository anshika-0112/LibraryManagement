class BookRegistriesController < ApplicationController

    def new
    end

    def create
        @book= Book.find(params[:book_id])
        if @book.number_of_copies>0
            if BookRegistry.where(user_id: current_user.id,book_id: @book.id).first.nil?
                @book_registry=BookRegistry.new(user_id: current_user.id,book_id: params[:book_id])
                @book.update(number_of_copies:@book.number_of_copies-1)
                @book_registry.save
                flash[:notice]="Request to Issue this Book is placed successfully"
                redirect_to @book_registry
            else
                flash.now[:alert]="You have already requested to issue this book"
                render :show
            end
        else
            flash[:alert]="Book is not available now. Try again later."
            redirect_to @book
        end
    end

    def index
        @book_requests= BookRegistry.where(book_return_date: nil)
    end

    def edit
        @book_registry=BookRegistry.find(params[:id])
    end

    def update
        @book_registry=BookRegistry.find(params[:id])
        if @book_registry.update(params.require(:book_registry).permit(:book_taken_date,:book_return_date))
            flash[:notice]="Book Request Approved"
            redirect_to @book_registry
        else
            render :index
        end
    end

    def destroy
        @book_registry=BookRegistry.find(params[:id])
        @book=Book.find(@book_registry.book_id)
        @book_registry.destroy
        if @book_registry.book_return_date.nil?
            flash[:notice]="Request Rejected to Issue the book successfully"
        else
            flash[:notice]="Book Returned Successfully"
        end
        redirect_to books_path
        @book.update(number_of_copies:@book.number_of_copies+1)
    end
end