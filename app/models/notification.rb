class Notification < ActiveRecord::Base
  belongs_to :user

  CONFIRMATION_DIALOGS = [
    "Sweet",
    "Awesome",
    "Fantastic",
    "They're the best",
    "Stupendous",
    "Marvelous",
    "Fabulous"
  ]
end
