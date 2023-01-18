import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts/core/network/network_info.dart';
import 'package:posts/features/posts/data/datasources/local_data_source.dart';
import 'package:posts/features/posts/data/datasources/remorte_data_source.dart';
import 'package:posts/features/posts/data/repositories/post_repository_impl.dart';
import 'package:posts/features/posts/domain/repositories/posts_repository.dart';
import 'package:posts/features/posts/domain/usecases/add_post.dart';
import 'package:posts/features/posts/domain/usecases/delete_post.dart';
import 'package:posts/features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts/features/posts/domain/usecases/update_post.dart';
import 'package:posts/features/posts/presentation/blocs/add_del_upd_bloc/add_del_upd_bloc.dart';
import 'package:posts/features/posts/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//Blocs
  sl.registerFactory(() => PostsBloc(getAllPostsUseCase: sl()));
  sl.registerFactory(() => AddDelUpdBloc(
      addPostUseCase: sl(), updatePostUseCase: sl(), deletePostUseCase: sl()));

//UseCases
  sl.registerLazySingleton(() => GetAllPostsUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddPostUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(repository: sl()));

//Repository
  sl.registerLazySingleton<PostsRepository>(() => PostRepositoryImpl(
      networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

//Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

//Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetWorkInfoImpl(internetConnectionChecker: sl()));

//Externals
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
