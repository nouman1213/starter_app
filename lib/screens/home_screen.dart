import 'package:flutter/material.dart';
import 'package:starter_app/app_provider/home_provider.dart';
import 'package:starter_app/app_provider/user_privider.dart';
import 'package:starter_app/utils/routes/routes_name.dart';
import 'package:starter_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../app_repository/auth_repository/home_repo.dart';
import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider homoPro = HomeProvider();

  @override
  void initState() {
    // TODO: implement initState
    homoPro.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPrefernece.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeProvider>(
        create: (BuildContext context) => homoPro,
        child: Consumer<HomeProvider>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.moviesList.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stack) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.moviesList.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value
                            .moviesList.data!.movies![index].year
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Utils.averageRating(value
                                    .moviesList.data!.movies![index].ratings!)
                                .toStringAsFixed(1)),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
