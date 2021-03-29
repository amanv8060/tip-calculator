# Creating a Tip Calculator in Flutter

Version Flutter 2.0.2 , VSCode 1.54.3

Calculating tip is a simple task (we can do it verbally ) but  we can make mistakes when the numbers are huge  , So Let's make a tip calculator to ease this .  

In this tutorial , you'll learn 
 - How to update variables 
 - Basic Flutter widgets such as ListTile
 - And How to make a Tip Calculator app for sure

# Getting Started
Assuming that you have flutter already installed , lets begin by downloading the starter project from [here](https://github.com/amanv8060/tip-calculator/archive/4e5af032574e8d158973abdedba79df86ad2f887.zip) 

After Downloading :
 - Extract and open the Folder in Your Favourite Editor (if required rename the folder to tipcalculator)
 - Run `flutter pub get`( downloads the dependencies required for your flutter project)
 - Run `flutter run` , it would launch Your app 
 
 With the launch of your app You see a screen similar to this 

<img src ="https://cdn.jsdelivr.net/gh/amanv8060/tip-calculator/images/initial.png" height=400 width=200/>

# Let's Jump in

You can see there is a file named tipCalculator.dart which contains a class `TipCalculator` that extends StatefulWidget. We'll will do all the work in this file only . 
So in this file start by creating 3 variables of type double as the number will contain decimal numbers . 

```dart
  //This variable stores tip Percentage we default to 15 , 
  double _tipPercentage = 15;
 
  //This variable stores amount of tip , initially we set it to 0 .
  double _tip = 0.0;

  //This Variable Will Store Bill Value , initially we also set it to 0 .
  double _bill = 0.0;
  
  ```
  
  Since Now we have these 3 variables we can start working on ui . So in your `build` method inside the Container we will create a ListView as follows 
 
 ```dart
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          ListTile(
            title: Text("Enter Bill Amount"),
          ),
          ListTile(
            title: Text("Enter Tip Percentage"),
          ),
          ListTile(
            title: Text("Tip Value"),
            trailing: Text(_tip.toString() + " \$"),
          ),
          ListTile(
            title: Text("Total Bill Amount"),
            trailing: Text((_tip + _bill).toString() + " \$"),
          ),
        ],
      ),
    );
  }
 ```
 Your App Screen should now look like this 
 
<img src ="https://cdn.jsdelivr.net/gh/amanv8060/tip-calculator/images/half.png" height=400 width=200/>
 
 So what you are doing above is creating a ListView inside a Container that has 4 ListTiles  

- First  ListTile is for Entering the Bill Amount .
- Second one is is for entering the tip percentage . 
- Third one will show the Tip amount .
- And Fourth one would show the total amount user should pay including tip

> ListView in flutter is nothing but a Widget that  that displays its children one after another in the scroll direction .

So moving forward we will now add the textfield so that user can input the the Bill Amount and tip percentage , for that we will use `trailing` property of ListTile , what `trailing` does is display the the widget that you pass to it at the rightmost end of ListTile . 

So we will begin with first ListTile  , we will create a `Container` of  width 60 pixels , we will then create `TextFormField` as its child , so Now TextFormField will only take 60 pixels space in the List Tile . Now in this `TextFormField` we will change the default TextAlignment to right using `textAlign: TextAlign.right` , we will also change the default keyboard that will be shown to user , so that user only sees number keyboard using `keyboardType: TextInputType.number` . We will also add a $ symbol at the end of the field , using `decoration: InputDecoration(suffixText: "\$")` . We will then set the initial value to bill so that 0 is shown is initially using 
`initialValue: _bill.toString()` . Now we will update the variables whenever the data in TextFormField is changed  , for that we will utilise `onchanged` callback of the TextFormField , it gives us value as a string whenever the value of TextFormField is changed . 
So we will first check if the number is valid number or not using `double.tryparse(value)`  , it returns null whenever the value is not a double number . So accordingly if it is a valid number we will update the variable `_bill` and `_tip` . So that our first ListTile code now looks like 
 
```dart
 ListTile(
            title: Text("Enter Bill Amount"),
            trailing: Container(
              width: 60,
              child: TextFormField(
                decoration: InputDecoration(suffixText: "\$"),
                textAlign: TextAlign.right,
                initialValue: _bill.toString(),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (double.tryParse(value) != null) {
                    setState(() {
                      _bill = double.parse(value);
                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  } else {
                    setState(() { 
                      _bill = 0.0;
                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  }
                },
              ),
            ),
          ),
```

> We are updating our variables inside of a function called setstate function beacuse , it updates the variables and then notifies the listeners so that class rebuilds itself to reflect the changes in the variable 

> Also if it is not a double number we set the value to 0. 

Similarly we will update the code of second ListTile as follows and update the value of `_tipPercentage` and `_tip` . 

```dart
 ListTile(
            title: Text("Enter Tip Percentage"),
            trailing: Container(
              width: 60,
              child: TextFormField(
                decoration: InputDecoration(suffixText: "%"),
                textAlign: TextAlign.right,
                initialValue: _tipPercentage.toString(),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (double.tryParse(value) != null) {
                    setState(() {
                      _tipPercentage = double.parse(value);

                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  } else {
                    setState(() {
                      _tipPercentage = 0.0;
                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  }
                },
              ),
            ),
          ),
```

And boom!! Hot reload your app and your app screen should like this 

<img src ="https://cdn.jsdelivr.net/gh/amanv8060/tip-calculator/images/final.png" height=400 width=200/>

# References
- Read More on ListView [here](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- Read More on TextFormField [here](https://api.flutter.dev/flutter/material/TextFormField-class.html)
- Read More on Container [here](https://api.flutter.dev/flutter/widgets/Container-class.html)

# Where to go from here 

You can download the final code from [here](https://github.com/amanv8060/tip-calculator/archive/refs/heads/main.zip)

You have made a Basic TipCalculator app . You can make it look more colorful and stylish or add more functionalities and make a complete Calculator app  that has this feature too .
