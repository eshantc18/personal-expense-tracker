import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personalexpense/Widgets/authentication.dart';
import 'package:provider/provider.dart';
import 'Chart.dart';
import 'transaction_list.dart';
import 'newTransaction.dart';
import 'userDetails.dart';
import 'sign_in.dart';
import '../Classes/transaction.dart';
import 'package:currency_picker/currency_picker.dart';
// import './Widgets/userTransaction.dart';

// void main() => runApp(MyApp());

class LoggedIn extends StatelessWidget {
  final int option;
  LoggedIn(this.option);

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PerExpense',
      home: MyHomePage(option),
      theme: ThemeData(
          accentColor: Color.fromARGB(255, 92, 0, 150),
          // primaryColor: Color.fromARGB(255, 193, 0, 227),
          fontFamily: 'AveriaLibre',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                ),
              ),
          appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 92, 0, 150),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'QuickSans',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              )
              // this does not work for appbar
              // textTheme: ThemeData.light().textTheme.copyWith(
              //       headline6: TextStyle(
              //       color: Colors.yellow,
              //       fontFamily: 'QuickSans',
              //       fontSize: 20,
              //       fontStyle: FontStyle.normal,
              //     ))
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final option;
  MyHomePage(this.option);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Currency _currency;
  bool _hideChart = false;

  final List<Transaction> _trans = [
    Transaction(title: "Shoes", id: 't1', price: 300, date: DateTime.now()),
    Transaction(
        title: "SmartWatch", id: 't2', price: 500, date: DateTime.now()),
    Transaction(title: "Football", id: 't3', price: 600, date: DateTime.now()),
    Transaction(
        title: "Videogame", id: 't4', price: 1200, date: DateTime.now()),
    Transaction(title: "Bat", id: 't5', price: 800, date: DateTime.now()),
    Transaction(title: "Bag", id: 't6', price: 600, date: DateTime.now()),
    Transaction(title: "Earbuds", id: 't7', price: 400, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _trans.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  List<Transaction> get _sortedTransactions {
    return _trans.where((transaction) {
      return transaction.date.isAfter(DateTime.now());
    }).toList();
  }

  void _addNewTransaction(String title, double price, DateTime date) {
    final transaction = Transaction(
        title: title, id: date.toString(), price: price, date: date);

    setState(() {
      _trans.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _trans.removeWhere((element) => element.id == id);
    });
  }

  // void _showCurrency(BuildContext context) {
  //   showCurrencyPicker(
  //     context: context,
  //     showFlag: true,
  //     showCurrencyName: true,
  //     showCurrencyCode: true,
  //     onSelect: (Currency currency) {
  //       _currency = currency;
  //       print('Select currency: ${currency.name}');
  //     },
  //   );
  // }

  void _initiateAddition(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            // Used so that when tap on background the modal sheet closes and not on tapping the sheet
            child: newTransaction(_addNewTransaction),
            onTap: (() {}),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            // Used so that when tap on background the modal sheet closes and not on tapping the sheet
            child: const UserDetails("Eshant", "eshantc18", 700, 2100),
            onTap: (() {}),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
  /*  Store iputs of textfield
  String? titleInput;
  String? amountInput;
  */

  Widget build(BuildContext context) {
    final appbar = AppBar(
      // backgroundColor: Colors.amberAccent,
      // foregroundColor: Colors.black,

      title: const Text(
        'Personal Expense', style: TextStyle(fontStyle: FontStyle.normal),
        // AppBarTheme is used to hava nice theme
        // style: TextStyle(
        //     fontWeight: FontWeight.normal,
        //     fontStyle: FontStyle.italic,
        //     color: Colors.white),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          _showDetails(context);
        },
        icon: const Icon(Icons.home),
      ),
      actions: [
        IconButton(
            onPressed: () {
              if (widget.option == 1) {
                FirebaseAuth.instance.signOut();
              }

              if (widget.option == 2) {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogout();
              }
            },
            icon: Icon(Icons.logout_rounded)),
        // IconButton(
        //   icon: const Icon(Icons.account_circle),
        //   onPressed: () {
        //     _showDetails(context);
        //   },
        // ),
      ],
    );

    return Scaffold(
      appBar: appbar,
      /*  Adding SingleChildScrollView around UserTransaction() makes the hole screen scrollable 
      Widget SingleCHildScrollView() needs height to work thus it covers whole screen here
      Other way is to wrap Widget TransactionList() around Container and then fix height and finally
      use Widget SinglechildScrollView()
      */

      // body: SingleChildScrollView(child: UserTransaction()),
      // Aproach is changes so the file userTransaction is no longer for use
      // body: UserTransaction(),

      body: Column(
        children: [
          !_hideChart
              ? Container(
                  height: MediaQuery.of(context).size.height *
                      0.22, // MediaQuery.of(context) gives dynamic details about device orientation, measures, user settings
                  child: Chart(_recentTransactions))
              : Text("Chart"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Display Chart",
              ),
              Switch(
                  value: _hideChart,
                  onChanged: (val) {
                    setState(() {
                      _hideChart = val;
                    });
                  }),
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.59,
              child: TransactionList(_trans, _deleteTransaction)),
          // Chart(_recentTransactions, _currency),
          // TransactionList(_trans, _currency),
        ],
      ),

      backgroundColor: Color.fromARGB(255, 252, 252, 252),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _initiateAddition(context),
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // floatingActionButton: Row(
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.fromLTRB(30, 7, 7, 7),
      //       child: FloatingActionButton(
      //         child: const Icon(Icons.currency_exchange_rounded),
      //         onPressed: (() {
      //           _showCurrency(context);
      //         }),
      //       ),
      //     ),
      //     Flexible(fit: FlexFit.tight, child: SizedBox()),
      //     Container(
      //       margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
      //       child: FloatingActionButton(
      //         child: const Icon(Icons.add),
      //         onPressed: (() {
      //           _initiateAddition(context);
      //         }),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
