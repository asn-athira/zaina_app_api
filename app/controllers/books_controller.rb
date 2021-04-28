class BooksController < ApplicationController
  #before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    if @books
      render json: @books, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
  end

  #Get books of logged user
  def get_user_books
    @books = @current_user.books
    if @books
      render json: @books, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
  end

  # GET /books/1
  def show
    @book=Book.find(params[:id])
    if @book
      render json: @book, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
  end

  def edit
    @book=Book.find(params[:id])
    if @book
      render json: @book, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
    
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    @book.user_id=@current_user.id

    if @book.save
      render json: { alert: "Book created Sucessfully"}, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    if @book.save
     render json: { alert: "Book Updated Sucessfully"}, status: :ok
    else
      render json: { errors: @book.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    render json: {  alert: "Book Deleted Sucessfully"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.permit(:name, :code, :author, :description)
    end
end
