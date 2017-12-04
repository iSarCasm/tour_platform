# == Schema Information
#
# Table name: tour_excursions
#
#  id                 :integer          not null, primary key
#  ticket_operator_id :integer
#  active_tour_id     :integer
#  ticket_date        :datetime
#  stock              :integer
#  adult_buy          :decimal(, )
#  adult_sell         :decimal(, )
#  senior_buy         :decimal(, )
#  senior_sell        :decimal(, )
#  child_buy          :decimal(, )
#  child_sell         :decimal(, )
#  infant_buy         :decimal(, )
#  infant_sell        :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  excursion_id       :integer
#

RailsAdmin.config do |config|
  config.model TourExcursion do
    parent TicketOperator

    list do
      field :id
      field :ticket_operator
      field :active_tour
      field :excursion
      field :ticket_date
      field :stock
      field :adult_buy
      field :senior_buy
      field :infant_buy
      field :child_buy
    end

    create { set_template 'tour_excursion' }
    update { set_template 'tour_excursion' }

    edit do
      field :ticket_operator, :filter_select_with_defaults
      field :active_tour
      field :excursion
      field :ticket_date
      field :stock
      field :adult_buy
      field :adult_sell
      field :senior_buy
      field :senior_sell
      field :infant_buy
      field :infant_sell
      field :child_buy
      field :child_sell
      field :notes
    end

    show do
      set_template 'tour_excursion_show'
      field :ticket_operator
      field :active_tour
      field :excursion
      field :ticket_date
      field :stock
      field :adult_buy
      field :adult_sell
      field :senior_buy
      field :senior_sell
      field :infant_buy
      field :infant_sell
      field :child_buy
      field :child_sell
      field :notes
    end
  end
end
