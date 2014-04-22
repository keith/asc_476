module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, 'remove_fields(this)')
  end

  def link_to_remove_closest(name, selector)
    link_to_function(name, "$(this).closest(\"#{selector}\").remove()", class: 'btn btn-primary')
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    new_object.professor = Professor.new if new_object.is_a? Position
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder, removable: true)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class: 'btn btn-primary')
  end

  def sortable(column, title=nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{ sort_direction }" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to(title, params.merge({ sort: column, direction: direction }), { class: css_class })
  end

  def get_possessive(name)
    if @position.applicant.name.last == 's'
      name += "'"
    else
      name += "'s"
    end
    return name
  end
end
