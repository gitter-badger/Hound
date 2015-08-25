class StyleConfig < ActiveRecord::Base
  belongs_to :owner

  def to_s
    "#{self.class} ##{id}"
  end
end
