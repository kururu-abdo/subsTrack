import 'package:finance_app/data.dart';
import 'package:finance_app/data/models/service.dart';
import 'package:finance_app/views/widgets/service_conntainer.dart';
import 'package:flutter/material.dart';

class AddSubScription extends StatefulWidget {
  const AddSubScription({ super.key });

  @override
  _AddSubScriptionState createState() => _AddSubScriptionState();
}

class _AddSubScriptionState extends State<AddSubScription> {
  TextEditingController editingController = TextEditingController();
    var servicesFilter = <Service>[];


void filterSearchResults(String query) {
  setState(() {
    servicesFilter = services
        .where((item) => item.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  });
}
@override
void initState() { 
  super.initState();
  servicesFilter=services;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back))
        , centerTitle: true, backgroundColor: Colors.transparent,
        title: const Text("Services"),
        ),
      body: SizedBox.expand(
        child: Padding(padding: const EdgeInsets.all(15),
        child: Column(
          children: [

TextFormField(
  controller: editingController,
  onChanged: (str){
    filterSearchResults(str);
  },
  decoration: InputDecoration(

hintText: 'Search Service',
prefixIcon: const Icon(Icons.search),
suffixIcon: const Icon(Icons.tune),
contentPadding: const EdgeInsets.symmetric(
  vertical: 0
),
border: OutlineInputBorder(
  borderSide: BorderSide(
    color: Theme.of(context).highlightColor,width: .5
  )
),

enabledBorder:  OutlineInputBorder(
  borderSide: BorderSide(
    color: Theme.of(context).highlightColor,width: .5
  )
), 
focusedBorder:  OutlineInputBorder(
  borderSide: BorderSide(
    color: Theme.of(context).highlightColor,width: .5
  )
)

  ),
)
, 

const SizedBox(height: 15,),

Expanded(child: 
ListView.builder(
  itemCount: servicesFilter.length,
  itemBuilder: (BuildContext context, int index) {
    var service = servicesFilter[index];
    return  ServiceContainer(index: index, service: service);
  },
),
)
          ],
        ),
        ),
      ),
    );
  }
}