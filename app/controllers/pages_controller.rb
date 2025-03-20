class PagesController < ApplicationController
  def home
    @meetings = Meeting.all
    @decision = Decision.new
    @title = "Gérer votre copro en toute serenité!"
  end

  def floors
    @title = "Plan de l'immeuble"
  end

  def user_infos
    user_email = User::USER_APPARTMENTS[params[:appartment_id]] if params[:appartment_id].present?
    user = User.find_by(email: user_email) if user_email

    respond_to do |format|
      format.json do
        render json: {
          html: render_to_string(
            partial: "shared/appartment_user_infos",
            locals: { user: user },
            formats: :html,
            layout: false
          )
        }
      end
    end
  end
end
