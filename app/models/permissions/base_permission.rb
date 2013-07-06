module Permissions
  class BasePermission
    def allow_all
      @allow_all = true
    end
  
    def allow_action(controllers, actions, &block)
      @allowed_actions ||= {}
      Array(controllers).each do |controller|
        Array(actions).each do |action|
          @allowed_actions[[controller.to_s, action.to_s]] = block || true
        end
      end
    end
  
    def allow_action?(controller, action, resource = nil)
      allowed = @allow_all || @allowed_actions[[controller.to_s, "all"]] || @allowed_actions[[controller.to_s, action.to_s]]
      allowed && (allowed == true || resource && allowed.call(resource))
    end
  
    def allow_param(resources, attributes)
      @allowed_params ||= {}
      Array(resources).each do |resource|
        @allowed_params[resource.to_s] ||= []
        @allowed_params[resource.to_s] += Array(attributes).map(&:to_s)
      end
    end

    def allow_param?(resource, attribute)
      if @allow_all
        true
      elsif @allowed_params && @allowed_params[resource.to_s]
        @allowed_params[resource.to_s].include? attribute.to_s
      end
    end
  
    def permit_params!(params)
      if @allow_all
        params.permit!
      elsif @allowed_params
        @allowed_params.each do |resource, attributes|
          if params[resource].respond_to? :permit
            params[resource] = params[resource].permit(*attributes)
          end
        end
      end
    end
  end
end