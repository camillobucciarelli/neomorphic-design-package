# neomorphicdesign

A set of neomorphic design based widgets.

# How to use ?

## Initialize Neomorphic theme in your main function
```dart
void main() {
  NeomorphicTheme.init(
      baseColor: Color(0xFF243441),
      darkColor: Colors.black.withAlpha(100),
      lightColor: Colors.white.withAlpha(25),
      shadowBlurRadius: 16,
      shadowOffset: 5,
      textStyleDark: TextStyle(color: Colors.black.withAlpha(100)),
      textStyleLight: TextStyle(color: Colors.white.withAlpha(25)),
      textStyleButtonLabel: TextStyle(color: Colors.white.withAlpha(25), fontWeight: FontWeight.bold),
      textStyleTextField: TextStyle(color: Colors.white.withAlpha(200))
  );
  runApp(MyApp());
}
```
## Use widgets as following example
```dart
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20),child: Text('Buttons variants', style: Theme.of(context).textTheme.title.copyWith(color: Colors.white.withAlpha(25)),)),
            NeomorphicRaisedButton(
                label: 'BUTTON',
                horizontalMargin: 20.0, verticalMargin: 20.0,
                horizontalPadding: 16.0, verticalPadding: 16.0,
                leadingIcon: Icon(
                  Icons.four_k,
                  color: Colors.white.withAlpha(25),
                )
            ),
            NeomorphicRaisedButton(
                label: 'BUTTON',
                horizontalMargin: 20.0, verticalMargin: 20.0,
                horizontalPadding: 16.0, verticalPadding: 16.0,
                trailingIcon: Icon(
                  Icons.four_k,
                  color: Colors.white.withAlpha(25),
                )
            ),
            NeomorphicRaisedButton(
                label: 'BUTTON',
                horizontalMargin: 20.0, verticalMargin: 20.0,
                horizontalPadding: 16.0, verticalPadding: 16.0,
                leadingIcon: Icon(
                  Icons.four_k,
                  color: Colors.white.withAlpha(25),
                ),
                trailingIcon: Icon(
                  Icons.four_k,
                  color: Colors.white.withAlpha(25),
                )
            ),
            NeomorphicRaisedButton(
                label: 'BUTTON',
                horizontalMargin: 20.0, verticalMargin: 20.0,
                horizontalPadding: 16.0, verticalPadding: 16.0
            ),
            Padding(padding: EdgeInsets.all(20),child: Text('Checkbox variants', style: Theme.of(context).textTheme.title.copyWith(color: Colors.white.withAlpha(25)),)),SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NeomorphicCheckbox(
                    isChecked: false,
                    uncheckedColor: Colors.red,
                    checkedColor: Colors.lightGreen,
                    height: 32,
                    width: 32,
                    borderRadius: 16.0
                ),
                NeomorphicCheckbox(
                  isChecked: false,
                  height: 32,
                  width: 32,
                  checkedIcon: Icon(
                    Icons.check,
                    color: Colors.lightGreen,
                    size: 16,
                  ),
                  uncheckedIcon: Icon(
                    Icons.close,
                    color: Colors.red.withAlpha(200),
                    size: 16,
                  ),
                  borderRadius: 16.0,
                  onCheck: (c) => print('isCheched: $c'),
                ),
                NeomorphicCheckbox(
                  isChecked: false,
                  height: 32,
                  width: 32,
                  checkedIcon: Icon(
                    Icons.check,
                    color: getIt<NeomorphicTheme>().lightColor,
                    size: 16,
                  ),
                  uncheckedIcon: Icon(
                    Icons.close,
                    color: getIt<NeomorphicTheme>().lightColor,
                    size: 16,
                  ),
                  borderRadius: 16.0,
                  onCheck: (c) => print('isCheched: $c'),
                ),
                NeomorphicCheckbox(
                  isChecked: false,
                  height: 32,
                  width: 32,
                  checkedIcon: Icon(
                    Icons.check,
                    color: Colors.white.withAlpha(25),
                    size: 16,
                  ),
                  uncheckedIcon: Icon(
                    Icons.close,
                    color: Colors.white.withAlpha(25),
                    size: 16,
                  ),
                  borderRadius: 16.0,
                  uncheckedColor: Colors.red,
                  checkedColor: Colors.lightGreen,
                  onCheck: (c) => print('isCheched: $c'),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NeomorphicCheckbox(
                  isChecked: true,
                  uncheckedColor: Colors.red,
                  checkedColor: Colors.lightGreen,
                  height: 32,
                  width: 32,
                  borderRadius: 8.0,
                ),
                NeomorphicCheckbox(
                  isChecked: true,
                  height: 32,
                  width: 32,
                  checkedIcon: Icon(
                    Icons.check,
                    color: Colors.lightGreen,
                    size: 16,
                  ),
                  uncheckedIcon: Icon(
                    Icons.close,
                    color: Colors.red.withAlpha(200),
                    size: 16,
                  ),
                  borderRadius: 8.0,
                  onCheck: (c) => print('isCheched: $c'),
                ),
                NeomorphicCheckbox(
                  isChecked: true,
                  height: 32,
                  width: 32,
                  checkedIcon: Icon(
                    Icons.check,
                    color: Colors.white.withAlpha(25),
                    size: 16,
                  ),
                  uncheckedIcon: Icon(
                    Icons.close,
                    color: Colors.white.withAlpha(25),
                    size: 16,
                  ),
                  borderRadius: 8.0,
                  onCheck: (c) => print('isCheched: $c'),
                ),
                NeomorphicCheckbox(
                  isChecked: true,
                  height: 32,
                  width: 32,
                  checkedIcon: Icon(
                    Icons.check,
                    color: Colors.white.withAlpha(25),
                    size: 16,
                  ),
                  uncheckedIcon: Icon(
                    Icons.close,
                    color: Colors.white.withAlpha(25),
                    size: 16,
                  ),
                  borderRadius: 8.0,
                  uncheckedColor: Colors.red,
                  checkedColor: Colors.lightGreen,
                  onCheck: (c) => print('isCheched: $c'),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Padding(padding: EdgeInsets.all(20),child: Text('TextFields variants', style: Theme.of(context).textTheme.title.copyWith(color: Colors.white.withAlpha(25)),)),
            NeomorphicTextFormField(
              horizontalMargin: 20.0, verticalMargin: 20.0,
              borderRadius: 50,
              horizontalPadding: 25,
              hintText: 'hint',
              autovalidate: true,
              validator: (v)=> v.length < 5 ? 'error message here' : null,
            ),
            NeomorphicTextFormField(
              horizontalMargin: 20.0, verticalMargin: 20.0,
              borderRadius: 50,
              horizontalPadding: 25,
              hintText: 'hint',
            ),
            NeomorphicTextFormField(
              horizontalMargin: 20.0, verticalMargin: 20.0,
              borderRadius: 50,
              horizontalPadding: 25,
              hintText: 'hint',
              initialValue: 'text inserted here',
            ),
            NeomorphicTextFormField(
              horizontalMargin: 20.0, verticalMargin: 20.0,
              borderRadius: 50,
              horizontalPadding: 25,
              hintText: 'hint',
              maxLines: 8,
              maxLength: 500,
            ),
            SizedBox(
              width: double.infinity,
              height: 32,
            ),
            Padding(padding: EdgeInsets.all(20),child: Text('Container variants', style: Theme.of(context).textTheme.title.copyWith(color: Colors.white.withAlpha(25)),)),
            NeomorphicContainer(
              horizontalMargin: 20.0,
              verticalMargin: 20.0,
              containerType: ContainerType.positive,
            ),
            NeomorphicContainer(
              horizontalMargin: 20.0,
              verticalMargin: 20.0,
              containerType: ContainerType.negative,
            )
          ],
        ),
      ),
    );
  }
}
```