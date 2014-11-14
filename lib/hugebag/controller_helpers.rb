module ControllerHelpers
  def redirect_to_with_create_success(model_instance)
    redirect_to model_instance, :notice => t(:create_model_success, :model_name => model_name(model_instance))
  end

  def redirect_to_with_update_success(model_instance)
    redirect_to model_instance, :notice => t(:update_model_success, :model_name => model_name(model_instance))
  end

  def redirect_to_models_with_destroy_success(model_class)
    models_url_method_name = "#{model_class.model_name.plural}_url"
    redirect_to send(models_url_method_name), :notice => t(:destroy_model_success,
                                                           :model_name => model_class.model_name.human)
  end

  def set_flash_notice_for_create_success(model_class)
    # TODO Put the key in a locale file
    set_flash_notice(:create_model_success, model_class)
  end

  def set_flash_notice_for_update_success(model_class)
    # TODO Put the key in a locale file
    set_flash_notice(:update_model_success, model_class)
  end

  def set_flash_notice_for_destroy_success(model_class)
    # TODO Put the key in a locale file
    set_flash_notice(:destroy_model_success, model_class)
  end

  private

  def model_name(model_instance)
    model_instance.class.model_name.human
  end

  def set_flash_notice(message_sym, model_class)
    model_name = model_class.model_name.human
    flash[:notice] = t(message_sym, :model_name => model_name)
  end
end