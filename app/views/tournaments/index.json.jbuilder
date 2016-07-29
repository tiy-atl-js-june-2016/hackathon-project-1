json.tournaments json.array! @tournaments do |tournament|
  json.extract! tournament, :id, :title, :size, :location, :deadline, :starting_at, :created_at
  json.organizer tournament.organizer.username
end
json.prev_page_url link_to_prev_page(@tournaments)
json.next_page_url link_to_next_page(@tournaments)
