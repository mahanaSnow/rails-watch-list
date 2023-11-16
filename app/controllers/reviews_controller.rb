class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review.list = @list.reviews.build(review_params)
    if @review.save
      redirect_to list_path(@list), notice: 'Review added successfully.'
    else
      render 'lists/show'
    end
  end
end
