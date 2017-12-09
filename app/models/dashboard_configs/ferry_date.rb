# == Schema Information
#
# Table name: ferry_dates
#
#  id             :integer          not null, primary key
#  ferry_id       :integer
#  start_date     :datetime
#  end_date       :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  active_tour_id :integer
#  rate           :decimal(, )
#  max_passengers :integer
#

RailsAdmin.config do |config|
  config.model FerryDate do
    parent Ferry

    list do
      field :ferry
      field :active_tour
      field :start_date
      field :end_date
      field :rate
      field :max_passengers
      field :notes
    end

    create { set_template 'ferry_date' }
    update { set_template 'ferry_date' }

    edit do
      field :ferry
      field :active_tour
      field :start_date
      field :end_date
      field :rate
      field :max_passengers
      field :notes
    end

    show do
      set_template 'ferry_date_show'
      field :ferry
      field :active_tour
      field :start_date
      field :end_date
      field :rate
      field :max_passengers
      field :notes
    end
  end
end
