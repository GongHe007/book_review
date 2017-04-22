class Api::RepliesController < ApiController
  def create
    reply = Reply.new(user_id: current_user_id, book_review_id: params[:book_review_id], content: params[:content], online: true)
    if reply.save
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
end