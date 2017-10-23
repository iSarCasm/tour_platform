# == Schema Information
#
# Table name: ticket_operators
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RailsAdmin.config do |config|
  config.model TicketOperator do
    weight 50
  end
end
