class Guest < User
  def role
    'guest'
  end

  rails_admin do
    hide
  end
end
