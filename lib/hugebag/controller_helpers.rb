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

  private

  def model_name(model_instance)
    model_instance.class.model_name.human
  end
end