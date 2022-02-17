Dado('acessar a pagina de cadastro') do
  $sign_up_page = SignupPage.new
  $sign_up_page.load
end

Dado('não ter nenhum usuario cadastrado') do
  $sign_up_page.has_div_table_contents?
  expect($sign_up_page).to have_no_div_table_contents
end

Quando('adicionar as informacoes do usuario') do |table|
  @user = table.hashes.first
  $sign_up_page.fill_fields(@user)
end

Então('ver o novo usuario adicionado a lista com sucesso') do
  expect($sign_up_page.div_table_contents).to_not be_empty
  expect($sign_up_page.th_first_id.text).to_not be_empty
  expect($sign_up_page.th_name.text).to eql(@user[:name])
  expect($sign_up_page.th_email.text).to eql(@user[:email])
  expect($sign_up_page).to have_th_exclude
end

Então('ver a mensagem de alerta: {string}') do |alert_message|
  expect($sign_up_page).to have_content alert_message
end

Então('não visualizar a listagem de usuarios') do
  expect($sign_up_page).to have_no_div_table_contents
end

Quando('adicionar informacoes de multiplos usuarios') do |table|
  @user = table.hashes.first
  $sign_up_page.fill_fields(@user)
  @user = table.hashes.last
  $sign_up_page.fill_fields(@user)
end

Então('ver que eles foram adicionados a listagem com sucesso') do
  expect($sign_up_page.div_table_contents).to_not be_empty
  expect($sign_up_page.th_first_id.text).to_not be_empty
end

Então('os ids devem estar ordenados') do
  expect($sign_up_page.th_second_id.text).to eql(@user[:id])
end

Quando('clicar em excluir o usuario listado') do
  $sign_up_page.has_th_exclude?
  $sign_up_page.th_exclude.click
end

Então('ver que o usuario foi excluido da listagem com sucesso') do
  expect($sign_up_page).to have_no_div_table_contents
end
