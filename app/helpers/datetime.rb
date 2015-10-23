module Datetime
  def display_time(datetime)
    datetime.to_time.strftime('%d %B, %Y')
  end
end
