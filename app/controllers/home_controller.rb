class HomeController < ApplicationController
  def show
    @questionnaires = Questionnaire
                          .where(deleted_at: nil)
                          .order("RANDOM()")
                          .limit(6)
  end
end
