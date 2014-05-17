module CapybaraHelpers
  def wait_for_ajax_to_finish
    page.document.synchronize do
      raise AjaxStillWorking unless page.evaluate_script('jQuery.active == 0')
    end
  end

  def sign_in_user
    visit new_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
  end

end


class AjaxStillWorking < Capybara::ElementNotFound;end
