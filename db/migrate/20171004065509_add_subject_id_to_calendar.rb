class AddSubjectIdToCalendar < ActiveRecord::Migration[5.0]
  def change
    add_reference :calendars, :subject, index: true
  end
end
