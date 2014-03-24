class TicketWork < ActiveRecord::Base
  self.table_name = "ticket_work"
  belongs_to :ticket
  belongs_to :user
end
