class User < ActiveRecord::Base
  has_many :comments, foreign_key: :created_by
  has_many :ticket_work
  has_many :ticket_involvements

  # This user worked time (String) at date (DateTime) on ticket (int)
  #
  # Ex. @user.worked("3h 30min", 3.days.ago, 194)
  def worked(time, date, ticket, comment=nil)
    h = time[/\d*h/].to_i
    m = time[/\d*m/].to_i
    seconds = h.hours + m.minutes
    labor = billing_rate * seconds / 1.hour
    ticket_work.create(ticket_id: ticket, created_at: date, time_spent: seconds, labor: labor)
    cmnt = "#{name} worked for "
    cmnt += "#{h} hours" if h > 0
    cmnt += " and " if h > 0 and m > 0
    cmnt += "#{m} minutes" if m > 0
    cmnt += "\n#{comment}" unless comment.nil?
    comments.create(body: cmnt, ticket_id: ticket, created_at: date, is_labor: true)
  end

  def name
    [first_name, last_name].join(" ")
  end
end
