class Ticket < ActiveRecord::Base
  has_many :ticket_work
  has_many :ticket_involvements
end
