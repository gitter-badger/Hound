class Membership < ActiveRecord::Base
  belongs_to :repo
  belongs_to :user

  def to_s
    "#{self.class} ##{id}"
  end
end
