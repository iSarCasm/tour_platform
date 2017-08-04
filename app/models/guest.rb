class Guest < User
  def base_role
    'guest'
  end

  rails_admin do
    hide
  end
end
