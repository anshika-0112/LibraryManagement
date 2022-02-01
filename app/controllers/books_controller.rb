class BooksController < ApplicationController
    before_action :set_book, only:[:show,:destroy,:edit,:update]
    before_action :authenticate_user!, except:[:index]
    def show
    end

    def index
        @books=Book.all
    end

    def new
        @book=Book.new
    end

    def create
        @book=Book.new(book_params)
        if @book.save
            flash[:notice]="Book Added Successfully"
            redirect_to @book
        else
            render :new,status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @book.update(book_params)
            flash[:notice]="Book Details Updated Successfully"
            redirect_to @book
        else
            render :new,status: :unprocessable_entity
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path
    end

    private

    def set_book
        @book=Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:name,:author,:number_of_copies)
    end

end