module Hugebag
  module ViewHelpers
    LINK_PATH_SUFFIX = '_path'

    def pre(text)
      content_tag :pre, text
    end

    def title(page_title)
      content_for(:title) { page_title }
    end

    def heading(page_heading)
      content_for(:heading) { page_heading }
    end

    def title_heading(page_title_heading)
      title(page_title_heading)
      heading(page_title_heading)
    end

    def model_title_heading(model_class)
      title_heading(model_class.model_name.human.pluralize)
    end

    def show_link(model_instance)
      link_to t(:show_link), model_instance
    end

    def edit_link(model_instance)
      model_singular_name = model_instance.class.model_name.singular
      edit_model_helper = "edit_#{model_singular_name}_path"
      link_to t(:edit_link), send(edit_model_helper, model_instance)
    end

    def destroy_link(model_instance)
      link_to t(:destroy_link), model_instance, :method => :delete, :data => {:confirm => t(:destroy_confirmation)}
    end

    def link_to_models(model_class, options={})
      model_name = model_class.model_name
      link_text  = model_name.human

      unless options[:singular]
        link_text = link_text.pluralize
        options.delete(:singular)
      end

      if options[:downcase]
        link_text.downcase!
        options.delete(:downcase)
      end

      # TODO check if call to underscore() is needed
      link_to link_text, send("#{model_name.plural.underscore}#{LINK_PATH_SUFFIX}"), options
    end
  end
end
