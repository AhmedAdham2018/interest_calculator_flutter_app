import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String calcResult = '';

  double principal = 0;

  double rate = 0;

  double years = 0;

  final _formKey = GlobalKey<FormState>();

  String dropdownValue = 'USD';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/pound.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Principal Value.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Principal.',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                ),
                onChanged: (newVal) {
                  principal = double.parse(newVal);
                  print('principal: $principal');
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Rate Value.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Rate of interest.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                  ),
                  onChanged: (newVal) {
                    rate = double.parse(newVal);
                    print('rate : $rate');
                  }),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                    width: 250,
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Principal Value.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Term',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                          ),
                        ),
                        onChanged: (newVal) {
                          years = double.parse(newVal);
                          print('term : $years');
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 20,
                    elevation: 16,
                    style: TextStyle(color: Colors.orange),
                    underline: Container(
                      height: 3,
                      color: Colors.orange,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['EGP', 'GBP', 'EUR', 'USD']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Calculate'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          double investmentValue =
                              (rate * years * principal) / 100;
                          double totalValue = principal + investmentValue;
                          setState(() {
                            calcResult =
                                'After $years years your investment will be worth $totalValue $dropdownValue .';
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text('Reset'),
                      color: Colors.orange,
                      onPressed: () {
                        setState(() {
                          calcResult = ' ';
                        });
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  calcResult,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
