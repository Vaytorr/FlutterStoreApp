[English version of this file](https://github.com/guibrandalisee/FlutterStoreApp#readme)

# Flutter Store App

***Esse é um aplicativo de loja feito usando Flutter/Dart e Firebase***

**Esse é um dos projetos mais complexos que eu já fiz usando Flutter, mas ainda assim é um dos meus primeiros**

**Fiz esse app para aprender Flutter, então não crie grandes expectativas sobre ele**

**Esse app foi feito seguindo um tutorial da udemy**

**__________________________________________________________________________________________________________________**

# O app possue 9 telas, sendo elas

***Tela Principal***

<img src="https://user-images.githubusercontent.com/41174096/127560901-2addf721-9668-4e02-8bef-dd6176e83fea.png" height="500">

*Essa tela é só um grid de imagens onde você pode mostrar seus produtos em destaque*

<img src="https://user-images.githubusercontent.com/41174096/127561177-7ad4987c-13bd-495e-8cbc-e5915e26efd6.png" height="500">


*É importante dizer que nas 4 telas "principais" você tem acesso ao drawer para navegação entre elas, ele pode ser exibido ao apertar o icone no canto superior esquerdo da tela*

***Tela de Categorias de Produto***

<img src="https://user-images.githubusercontent.com/41174096/127561106-63d8f510-4fee-40b0-b1a2-b5efedf085ec.png" height="500">

*Aqui você pode adicionar as categorias de seus produtos, neste exemplo eu adicionei apenas camisetas, mas pode haver mais que uma categoria*

***Tela de Produtos***

<img src="https://user-images.githubusercontent.com/41174096/127561231-2ffc4a9a-45a8-4891-8f4f-554621243f2f.png" height="500">

*Quando você clicar em uma das categorias na tela anterior, essa tela aparecerá mostrando todos os produtos contidos naquela categoria*

*Os produtos podem ser exibidos ao usuario de 2 maneiras, em um grid como visto na imagem acima, ou em uma lista como visto na imagem abaixo*

<img src="https://user-images.githubusercontent.com/41174096/127561308-8cae5e66-392a-4e91-a608-a4aa1d7e40bb.png" height="500">

***Tela de Produto***

<img src="https://user-images.githubusercontent.com/41174096/127561376-ead0f58d-9271-42f6-a869-628823ce9651.png"  height="500">

*Quando você clicar em um produto essa tela aparecerá*

*Aqui você tem a opção de escolher um tamanho para o produto, e se estiver logado em uma conta, também há a opção de adicionar ao carrinho*

*Em caso de não estiver logado, o botão de "Adicionar ao Carrinho" sera substituido por um botão de login*

***Tela de Login***

<img src="https://user-images.githubusercontent.com/41174096/127561426-00155e7c-2903-4f51-a87e-8d1ba165c681.png" height="500">

*Aqui o usuario pode realizar o login, obviamente, mas ele também pode recupear sua senha ao precionar o botão "esqueci minha senha" caso a tenha esquecido*

*A função de recuperar a senha é feita automaticamente pelo firebase*

<img src="https://user-images.githubusercontent.com/41174096/127561482-56ca7249-d602-47a4-8227-bbd83905fa5f.png" height="500">

***Tela de Cadastro***

<img src="https://user-images.githubusercontent.com/41174096/127561500-8667e2a1-5a9f-405a-af8f-900b6c6c644a.png" height="500">

*Bom... Essa é uma tela para criar uma conta, nada de especial aqui*

***Tela de "Nossas Lojas"***

<img src="https://user-images.githubusercontent.com/41174096/127561621-57e72cdc-00b5-4061-ae32-00b25d3306e0.png" height="500">

*Aqui você pode ver todas as lojas registradas no banco de dados, você também pode ligar para elas, ou acha-las no google maps*

***Tela de Pedidos***

<img src="https://user-images.githubusercontent.com/41174096/127561594-195a8fb5-340e-46af-8b45-d13726f021ba.png" height="500">

*Aqui você pode ver a descrição de todos os pedidos realizados e suas atualizações*

***Carrinho***

<img src="https://user-images.githubusercontent.com/41174096/127561604-35035f26-2e5e-41aa-aa1a-dd1e7ce9e771.png" height="500">

*Aqui você pode ver todos os produtos adicionados ao carrinho, mudar a quantidade dele, adicionar um cupon de desconto e finalizar a compra*

**Note que não existe um sistema de pagamento imbutido no app**

# Como adicionar conteudo ao app

***Você pode utilizar o [aplicativo de gerenciamento](https://github.com/guibrandalisee/FlutterStoreManagerAPP) para fazer isso***

***Mas se quiser também pode fazer isso manualmente no firebase como visto abaixo***
***__________________________________________________________________________________________________________________***

**Como adicionar imagens ao grid da tela inicial**

<img src="https://user-images.githubusercontent.com/41174096/127562190-6877396f-7fde-4bf5-b210-327a5450ea8a.png" height="400">


**Como adicionar uma categoria de item**

<img src="https://user-images.githubusercontent.com/41174096/127562162-768c78ed-1060-4cab-858b-f9efb5782bc1.png" height="400">


**Como adicionar itens dentro de uma categoria**

<img src="https://user-images.githubusercontent.com/41174096/127562140-078f18cb-0e20-49a7-b4ae-09b2887dcae4.png" height="400">

**Como adicionar endereços de lojas**

<img src="https://user-images.githubusercontent.com/41174096/127562176-b7742cf1-05d5-4cf2-9356-91e0b0a1e56e.png" height="400">

**Como adicionar cupons de desconto**

<img src="https://user-images.githubusercontent.com/41174096/127562122-e24719e2-a4a0-480f-9107-d7206e540683.png" height="400">

*Sempre adicione um cupon utilizando letras maiúsculas*

**Para que o app funcione você precisa de seu próprio google-services.json**

descubra como conseguir um **[aqui](https://firebase.google.com/docs/flutter/setup)**

**Esse app é meio antigo então ele pode não funcionar ao utilizar novas versões dos pacotes utilizados**
