class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # def create
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @list = List.find(params[:list_id])
  #   @bookmark.list = @list
  #   if @bookmark.save
  #     redirect_to list_path(@list)
  #   else
  #     render :new
  #   end
  # end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark added successfully.'
    else
      render 'lists/show'
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully destroyed.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
