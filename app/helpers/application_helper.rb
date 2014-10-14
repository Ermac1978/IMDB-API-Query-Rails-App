module ApplicationHelper

  #defines date as Jan. 1, 2001
  def formatted_date(date)
    date.stfrtime('%b %d, %Y')
  end

end
