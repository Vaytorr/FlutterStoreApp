[Versão em português desse arquivo](https://github.com/guibrandalisee/FlutterStoreApp/blob/master/READMEPT.md)

# Flutter Store App

***This is a Clothing Store app made using Flutter/Dart and Firebase***

**This app is the most complex project I worked in so far using flutter, but this still is one of my first projects**

**I made this app to learn how to use flutter, so don't expect much**

**This app was made following an udemy tutorial**

**__________________________________________________________________________________________________________________**

# The app consists in 9 screens, being them

***Home Screen***

<img src="https://user-images.githubusercontent.com/41174096/127560901-2addf721-9668-4e02-8bef-dd6176e83fea.png" height="500">

*This screen is just an image grid that you can put your featured products*

<img src="https://user-images.githubusercontent.com/41174096/127561177-7ad4987c-13bd-495e-8cbc-e5915e26efd6.png" height="500">


*It is important to say that in the 4 "main" screens you have access to a drawer for navigation between screens it can be popped up pressing the hamburger menu icon in the top left corner*

***Product Category Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561106-63d8f510-4fee-40b0-b1a2-b5efedf085ec.png" height="500">



*Here you can add the categories of your products, in this example i only used T-Shirts but it works with more than one category*

***Products Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561231-2ffc4a9a-45a8-4891-8f4f-554621243f2f.png" height="500">

*Once you clicked a category in the previous screen this screen will pop up showing you every product featured in that category*

*The products here can be shown to the user in 2 manners a grid view as shown above or a list view as shown below*

<img src="https://user-images.githubusercontent.com/41174096/127561308-8cae5e66-392a-4e91-a608-a4aa1d7e40bb.png" height="500">

***Product Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561376-ead0f58d-9271-42f6-a869-628823ce9651.png"  height="500">

*When you click in a product this screen will pop up*

*It will give you the option to choose the product size and if you're logged in, to add the product to the cart*

*In case you are not logged in the "Add to cart" button will be replaced with a button for you to login*

***Login Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561426-00155e7c-2903-4f51-a87e-8d1ba165c681.png" height="500">

*Here the user can login obviously, but they can also recover the password clicking the "forgot my password" button*

*The recover password function is done automatically by firebase*

<img src="https://user-images.githubusercontent.com/41174096/127561482-56ca7249-d602-47a4-8227-bbd83905fa5f.png" height="500">

***Sign up Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561500-8667e2a1-5a9f-405a-af8f-900b6c6c644a.png" height="500">

*Well this is a sign up screen... nothing special here*

***Our Store Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561621-57e72cdc-00b5-4061-ae32-00b25d3306e0.png" height="500">

*Here you can see all the stores registered in the database, you can also call them or find them on google maps*

***My Orders Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561594-195a8fb5-340e-46af-8b45-d13726f021ba.png" height="500">

*Here you can see the description of all the orders you placed and the status of them*

***Cart Screen***

<img src="https://user-images.githubusercontent.com/41174096/127561604-35035f26-2e5e-41aa-aa1a-dd1e7ce9e771.png" height="500">

*Here you can see all the products you added to the cart, change the quantity of them, add a discount coupon and make checkout*

**Please note that there is no payment API configured to work with this app**

# How to add data to the app

***You can use the [companion app](https://github.com/guibrandalisee/FlutterStoreManagerAPP) to do this***

**For the app to work you have to add your own google-services.json**

find out how to do it **[here](https://firebase.google.com/docs/flutter/setup)**

**This app is quite old, so, somethings may not work properly with newer versions of plugins used**
