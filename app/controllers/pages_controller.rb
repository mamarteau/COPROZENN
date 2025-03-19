class PagesController < ApplicationController
  def home
    @meetings = Meeting.all
    @decision = Decision.new
    @title = "Gérer votre copro en toute serenité!"
  end
end
