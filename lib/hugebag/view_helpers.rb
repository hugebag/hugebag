# require 'active_support/dependencies'

module Hugebag
  module ViewHelpers
    # unloadable

    NEW_LINK_PREFIX  = 'new_'
    EDIT_LINK_PREFIX = 'edit_'
    LINK_PATH_SUFFIX = '_path'

    def show_link(model_instance)
      link_to t(:show_link), model_instance
    end

    def edit_link(model_instance)
      edit_model_helper = "#{EDIT_LINK_PREFIX}#{model_singular_name(model_instance.class)}#{LINK_PATH_SUFFIX}"
      link_to t(:edit_link), send(edit_model_helper, model_instance)
    end

    def destroy_link(model_instance)
      link_to t(:destroy_link), model_instance, :method => :delete, :data => {:confirm => t(:destroy_confirmation)}
    end

    def new_model_link(model_class)
      new_model_path = "#{NEW_LINK_PREFIX}#{model_singular_name(model_class)}#{LINK_PATH_SUFFIX}"
      link_to new_model_text(model_class), send(new_model_path)
    end

    def new_model_text(model_class)
      t(:new_model_text, :model_name => model_name(model_class))
    end

    def edit_model_text(model_class)
      t(:edit_model_text, :model_name => model_name(model_class))
    end

    def root_link
      link_to t(:root_link), root_path
    end

    # @deprecated Use models_link instead
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

    def models_link(model_class, options={})
      model_name = model_class.model_name

      if options[:link_text]
        link_text = options.extract!(:link_text)[:link_text]
      else
        link_text = model_name.human

        unless options[:singular]
          link_text = link_text.pluralize
          options.delete(:singular)
        end

        if options[:downcase]
          link_text.downcase!
          options.delete(:downcase)
        end
      end

      # TODO check if call to underscore() is needed
      models_path = "#{model_name.plural.underscore}#{LINK_PATH_SUFFIX}"
      link_to link_text, send(models_path), options
    end

    private

    def model_singular_name(model_class)
      model_class.model_name.singular
    end

    def model_name(model_class)
      model_class.model_name.human.downcase
    end
  end
end
