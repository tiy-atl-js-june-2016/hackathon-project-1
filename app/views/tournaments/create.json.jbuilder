json.extract! @tournament, :id, :title, :size, :location, :deadline, :starting_at
json.owner @tournament.organizer.username
