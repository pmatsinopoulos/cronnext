def calculate(minutes:, hour:, command:, current_time:)
  current_hour, current_minutes = current_time.split(':').map(&:to_i)
  new_day = 'today'

  if minutes == '*' && hour == '*'
    new_minutes = current_minutes
    new_hour = current_hour
  end

  if minutes == '*' && hour != '*'
    new_minutes = current_minutes
    new_hour = hour.to_i
    if new_hour < current_hour
      new_day = 'tomorrow'
    end
    if new_hour != current_hour
      new_minutes = 0
    end
  end

  if minutes != '*' && hour == '*'
    new_minutes = minutes.to_i
    new_hour = current_hour
    if new_minutes < current_minutes
      new_hour = new_hour + 1
      if new_hour > 23
        new_hour = 0
        new_day = 'tomorrow'
      end
    end
  end

  if minutes != '*' && hour != '*'
    new_minutes = minutes.to_i
    new_hour = hour.to_i
    if new_hour < current_hour
      new_day = 'tomorrow'
    end
  end

  { hour: new_hour.to_s,
    minutes: new_minutes.to_s,
    day: new_day,
    command: command }
end
