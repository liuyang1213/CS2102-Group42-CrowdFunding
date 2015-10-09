module Datetime
  def display_time(datetime)
    datetime.to_time.strftime('%Y-%m-%d %H:%M')
  end
end
