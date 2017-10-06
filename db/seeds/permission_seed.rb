begin
  puts "Creating Permissions..."
  def setup_actions_controllers_db
    write_permission('everything', 'manage')

    Rails.application.eager_load!
    ActiveRecord::Base.descendants
    models = ApplicationRecord.descendants
    ignored_models = [Guest, RolePermission, HotelFacility]
    models.each do |model|
      next if ignored_models.include? model
      write_permission(model.to_s, 'manage')
      write_permission(model.to_s, 'add')
      write_permission(model.to_s, 'read')
      write_permission(model.to_s, 'edit')
      write_permission(model.to_s, 'remove')
      write_permission(model.to_s, 'export')
    end
  end

  def write_permission(class_name, cancan_action)
    class_name = Permission.subject_classes[class_name]
    cancan_action = Permission.actions[cancan_action]
    permission  = Permission.find_by("subject_class = ? and action = ?", class_name, cancan_action)
    unless permission
      permission = Permission.new
      permission.subject_class = class_name
      permission.action = cancan_action
      permission.save
    end
  end

  setup_actions_controllers_db
rescue StandardError => exception
  puts exception
  puts exception.backtrace
ensure
  puts "Permissions: #{Permission.count}"
end
