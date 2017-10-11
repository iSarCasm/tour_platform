# == Schema Information
#
# Table name: seatplans
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  plan        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RailsAdmin.config do |config|
  config.model Seatplan do
    navigation_label 'Settings'
    weight 999

    list do
      field :title
      field :description
      field :total_seats
      field :total_rows
    end

    edit do
      field :title
      field :description
      field :plan do
        partial 'seatplan_plan_edit'
      end
    end

    show do
      field :id
      field :title
      field :description
      field :total_seats
      field :total_rows
      field :plan do
        pretty_value do
          bindings[:view].render(
            partial: 'rails_admin/seatplan_plan_show',
            locals: { seatplan: bindings[:object] }
          )
        end
      end
      field :created_at
      field :updated_at
    end
  end
end
