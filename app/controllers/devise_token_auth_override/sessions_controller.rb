module DeviseTokenAuthOverride
  class SessionsController < DeviseTokenAuth::SessionsController

    # def destroy
    #   if token_value = params[:token_value] and current_user.driver?
    #     if token = current_user.mobile_access_tokens.find_by(value: token_value)
    #       token.update(status: 'unactive')
    #     end
    #   end
      
    #   super

    # end

  end
end