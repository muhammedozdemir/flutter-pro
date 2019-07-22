import 'package:flutter/material.dart';
import 'package:flutteruberfood/src/blocs/restaurantes_bloc.dart';
import 'package:flutteruberfood/src/models/restaurante.dart';
import 'package:flutteruberfood/src/resources/bloc_provider.dart';

class RestaurantsPage extends StatelessWidget {
  RestaurantesBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<RestaurantesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
      ),
      body: Center(
        child: StreamBuilder<List<Restaurante>>(
          stream: bloc.outRestaurantes,
          builder: (BuildContext ctx, AsyncSnapshot<List<Restaurante>> snapshot){
            if(snapshot.hasData) {
              return Container(
                  child:Text('Tenemos elementos en la lista')
              );
            }

            return Container(
                child: Text('Cargando...')
            );
          },
        )
      )
    );

  }
}
