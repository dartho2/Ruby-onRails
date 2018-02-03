module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end


    content_tag("div class=material-button-toggle",  link_to(name, '#', class: "add_fields fa fa-plus material-button-toggle", data: {id: id, fields: fields.gsub("\n", "")})
    )
  end
end
