import 'package:flutter/material.dart';
import 'package:hotel_app/model/PropertyProvider.dart';
import 'package:provider/provider.dart';

class PropertyListScreen extends StatefulWidget {
  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<PropertyProvider>(context).getUserApi().then((_) {
        setState(() {
          _isLoading = false;
        });
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    final properties = propertyProvider.propList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Property List'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: properties.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: properties[i].coverImage != null
                    ? Image.network(properties[i].coverImage!)
                    : Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey,
                      ),
                title: Text(properties[i].propertyName),
                subtitle: Text(properties[i].city),
                onTap: () {
                  // Navigate to a detail page if needed
                },
              ),
            ),
    );
  }
}
