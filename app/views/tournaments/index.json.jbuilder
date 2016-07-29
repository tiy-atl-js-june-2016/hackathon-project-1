json.tournaments @tournaments do |tournament|
  json.extract! tournament, :id, :title, :size, :location, :deadline, :starting_at, :created_at
  json.organizer tournament.organizer.username
end
json.page_info page_entries_info(@tournaments)
