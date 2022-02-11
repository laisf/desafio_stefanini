class SignupPage < SitePrism::Page
  set_url "/teste/qa"

  element :inpt_name, '#name'
  element :inpt_email, '#email'
  element :inpt_password, '#password'
  element :btn_register, '#register'
  element :div_page_info, '.page-info'
  element :th_first_id, '#tdUserId1'
  element :th_second_id, '#tdUserId2'
  element :th_name, '#tdUserName1'
  element :th_email, '#tdUserEmail1'
  element :th_exclude, '#removeUser1'
  elements :div_table_contents, 'div.register-form.expanded > table'

  def fill_fields(user)
    $sign_up_page.has_inpt_name?
    inpt_name.set user[:name]
    $sign_up_page.has_inpt_email?
    inpt_email.set user[:email]
    $sign_up_page.has_inpt_password?
    inpt_password.set user[:password]
    $sign_up_page.has_btn_register?
    btn_register.click
  end
end