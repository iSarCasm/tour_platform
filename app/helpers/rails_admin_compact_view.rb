RailsAdmin::FormBuilder.class_eval do
  def generate(options = {})
    without_field_error_proc_added_div do
      options.reverse_merge!(
        action: @template.controller.params[:action],
        model_config: @template.instance_variable_get(:@model_config),
        nested_in: false,
      )

      object_infos +
        visible_groups(options[:model_config], generator_action(options[:action], options[:nested_in])).collect do |fieldset|
          fieldset_for fieldset, options[:nested_in], options[:model_config].send(options[:action]).template
        end.join.html_safe +
        (options[:nested_in] ? '' : @template.render(partial: 'rails_admin/main/submit_buttons'))
    end
  end

  def fieldset_for(fieldset, nested_in, template)
    fields = fieldset.with(
      form: self,
      object: @object,
      view: @template,
      controller: @template.controller,
    ).visible_fields
    return if fields.empty?


    if template
      render_in_template(template, fieldset, fields, nested_in)
    else
      @template.content_tag :fieldset do
        contents = []
        contents << @template.content_tag(:legend, %(<i class="icon-chevron-#{(fieldset.active? ? 'down' : 'right')}"></i> #{fieldset.label}).html_safe, style: fieldset.name == :default ? 'display:none' : '')
        contents << @template.content_tag(:p, fieldset.help) if fieldset.help.present?
        contents << fields.collect { |field| field_wrapper_for(field, nested_in) }.join
        contents.join.html_safe
      end
    end
  end

  def render_in_template(template, fieldset, fields, nested_in)
    @template.render partial: "rails_admin/main/templates/#{template}", locals: {fields: fields, options: options}
  end

  def field_wrapper_for(field, nested_in)
    if field.label
      # do not show nested field if the target is the origin
      unless nested_field_association?(field, nested_in)
        @template.content_tag(:div, class: "form-group control-group #{field.type_css_class} #{field.css_class} #{'error' if field.errors.present?}", id: "#{dom_id(field)}_field") do
          label(field.method_name, capitalize_first_letter(field.label), class: 'col-sm-2 control-label') +
            (field.nested_form ? field_for(field) : input_for(field))
        end
      end
    else
      field.nested_form ? field_for(field) : input_for(field)
    end
  end
end

RailsAdmin::Config::Fields::Base.class_eval do
  def render_compact
    bindings[:view].render partial: "rails_admin/main/compact_view/#{partial}", locals: {field: self, form: bindings[:form]}
  rescue StandardError
    render
  end
end
