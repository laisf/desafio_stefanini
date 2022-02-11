#language: pt

@sign_up_page
Funcionalidade: Cadastro
  Eu como usuario do sistema.
  Desejo realizar o cadastro de novos usuarios.
  Para que seja possivel armazenar e gerenciar seus dados.

  Contexto: Nenhum usuario cadastrado
  Dado acessar a pagina de cadastro
  E não ter nenhum usuario cadastrado

  @success_sign_up_user
  Cenario: Realizar cadastro de novo usuário com sucesso

      Quando adicionar as informacoes do usuario
        | name       | email               | password     |
        | Rosa Maria | rosamaria@email.com | rosa123maria |
      Então ver o novo usuario adicionado a lista com sucesso

  @try_sign_up_user
  Esquema do Cenario: Realizar tentativa de cadastro

      Quando adicionar as informacoes do usuario
        | name   | email   | password   |
        | <name> | <email> | <password> |
      Então ver a mensagem de alerta: '<alert_message>'
      E não visualizar a listagem de usuarios

      Exemplos:
      | name       | email               | password     | alert_message                              |
      | Rosa       | rosamaria@email.com | rosa123maria | Por favor, insira um nome completo.        |
      |            | rosamaria@email.com | rosa123maria | O campo Nome é obrigatório.                |
      | Rosa Maria | rosamaria&email.com | rosa123maria | Por favor, insira um e-mail válido.        |
      | Rosa Maria |                     | rosa123maria | O campo E-mail é obrigatório.              |
      | Rosa Maria | rodamaria@email.com | rosa         | A senha deve conter ao menos 8 caracteres. |
      | Rosa Maria | rodamaria@email.com |              | O campo Senha é obrigatório.               |

  @validate_id
  Cenario: Realizar cadastro de multiplos usuários com sucesso

      Quando adicionar informacoes de multiplos usuarios
       | name       | email               | password     | id |
       | Rosa Maria | rosamaria@email.com | rosa123maria | 1  |
       | Maria Rosa | rosamaria@email.com | rosa123maria | 2  |
      Então ver que eles foram adicionados a listagem com sucesso
      E os ids devem estar ordenados

  @user_exclude
  Cenario: Excluir cadastro de usuário com sucesso
      Quando adicionar as informacoes do usuario
        | name       | email               | password     |
        | Rosa Maria | rosamaria@email.com | rosa123maria |
      E clicar em excluir o usuario listado
      Então ver que o usuario foi excluido da listagem com sucesso

