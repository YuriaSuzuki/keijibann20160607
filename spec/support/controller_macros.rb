module ControllerMacros
  def login(object)
    @request.env["devise.mapping"] = Devise.mappings[object.class.name.underscore.to_sym]
   sign_in object
  end
end
