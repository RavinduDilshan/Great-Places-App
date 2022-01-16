import 'package:flutter/material.dart';
import 'package:greatplaces/providers/great_places.dart';
import 'package:greatplaces/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context,listen: false).fetchAndSetPlaces(),
          builder:(ctx,snapshot) =>snapshot.connectionState==ConnectionState.waiting? Center(child: CircularProgressIndicator(),): Consumer<GreatPlaces>(
            child: Center(
              child: Text('Got No Places Yet,start adding some !'),
            ),
            builder: (context, greatplaces, ch) => greatplaces.items.length <= 0
                ? ch!
                : ListView.builder(
                    itemBuilder: (ctx, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(greatplaces.items[i].image),
                      ),
                      title: Text(greatplaces.items[i].title),
                      onTap: () {
                        //go to details page
                      },
                    ),
                    itemCount: greatplaces.items.length,
                  ),
          ),
        ));
  }
}
