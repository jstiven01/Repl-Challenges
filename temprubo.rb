# frozen_string_literal: true

class Event < ApplicationRecord
  def self.checking_free_time(opening_event)
    free_time = []
    temp_time = opening_event.starts_at
    appointments = Event.where(starts_at: opening_event.starts_at.beginning_of_day..opening_event.starts_at.end_of_day)
    while temp_time < opening_event.ends_at
      if appointments
          .select { |appointment| temp_time >= appointment.starts_at && temp_time < appointment.ends_at }.empty?
        free_time.push(temp_time.strftime('%k:%M').strip)
      end
      temp_time += 30.minutes
    end

    free_time
  end

  def self.get_opening_event(requested_date)
    event_opening = Event.find_by(kind: 'opening')
    advance_weeks = 0
    while event_opening.starts_at.beginning_of_day < requested_date.beginning_of_day
      advance_weeks += 1
      event_opening.starts_at = event_opening.starts_at.advance(weeks: advance_weeks)
      event_opening.ends_at = event_opening.ends_at.advance(weeks: advance_weeks)
    end
    event_opening
  end

  def self.availabilities(start_date)
    availabilities_info = []
    date_event_opening = get_opening_event(start_date)
    7.times do |i|
      date_to_check = start_date.advance(days: i)

      if date_to_check.beginning_of_day == date_event_opening.starts_at.beginning_of_day
        availabilities_info.push({ date: date_to_check.strftime('%Y/%m/%d'),
                                   slots: checking_free_time(date_event_opening) })
      else
        availabilities_info.push({ date: date_to_check.strftime('%Y/%m/%d'), slots: [] })
      end
    end

    availabilities_info
  end
end
