import 'package:fast_shopping/app.dart';
import 'package:fast_shopping/store/store.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'models/models.dart';

void main() {
  final store = Store<FastShoppingState>(
    rootReducer,
    middleware: [
      thunkMiddleware,
      ensureShoppingListAvailable,
    ],
    initialState: _initialState,
  );

  store.dispatch(Boot());

  runApp(FastShoppingApp(store: store));
}

final _initialState = FastShoppingState(
  (b) => b
    ..lists.replace(
      [
        ShoppingList(
          (b) => b
            ..name = 'My shopping list'
            ..items.replace(
              [
                Item((b) => b..title = 'Herbatniki duża paczka'),
                Item((b) => b..title = '3x bita śmietana (proszek)'),
                Item((b) => b..title = '0,5l śmietany 30% karton'),
                Item((b) => b
                  ..title = 'Krem karpatka proszek'
                  ..done = true
                  ..doneAt = DateTime.now()),
                Item((b) => b
                  ..title = 'Masa kajmakowa/krówkowa (puszka) '
                      'albo mleko skondensowane jak nie będzie'),
                Item((b) => b..title = 'Kapusta czerwona 2x średnie'),
                Item((b) => b..title = '6 cebul czerwonych'),
              ],
            ),
        ),
      ],
    ),
);
