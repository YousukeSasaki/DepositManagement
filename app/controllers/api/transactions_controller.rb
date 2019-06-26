class Api::TransactionsController < ApplicationController

  def number
    @subject = Subject.find_by('number = ?', "#{params[:number]}")
    if @subject.nil?
      head :ok
    else
      respond_to do |format|
        format.html
        format.json
      end
    end
  end


end
