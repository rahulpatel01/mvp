class Notification < ApplicationRecord
  after_create_commit { NotificationBroadcastJob.perform_now(Notification.count)}
end
