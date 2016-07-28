json.extract! @tournament, :id, :title, :size, :location, :deadline
json.owner @tournament.user.username
