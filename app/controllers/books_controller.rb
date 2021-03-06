class BooksController < ApplicationController
    before_action :set_book, only:[:show,:destroy,:edit,:update]
    before_action :authenticate_user!
    before_action :require_admin, except:[:index,:show]

    def show
        @book_registry=BookRegistry.find_by(user_id: current_user.id,book_id: @book.id)
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

    def require_admin
        if current_user.user_type!="Admin"
          flash[:alert]="Only Admins are allowed to perform this action"
          redirect_to books_path
        end
    end

    def set_book
        @book=Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:name,:author,:number_of_copies,category_ids:[])
    end

end