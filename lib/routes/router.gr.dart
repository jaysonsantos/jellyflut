// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/jellyfin/item.dart' as _i14;
import '../screens/auth/auth_parent.dart' as _i4;
import '../screens/book/book_reader.dart' as _i12;
import '../screens/collection/collection_parent.dart' as _i6;
import '../screens/details/details.dart' as _i7;
import '../screens/home/home.dart' as _i13;
import '../screens/home/home_parent.dart' as _i5;
import '../screens/musicPlayer/music_player.dart' as _i9;
import '../screens/musicPlayer/routes/playlist.dart' as _i10;
import '../screens/settings/settings.dart' as _i8;
import '../screens/stream/stream.dart' as _i11;
import 'router.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AuthParentRoute.name: (routeData) {
      final args = routeData.argsAs<AuthParentRouteArgs>(
          orElse: () => const AuthParentRouteArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.AuthParent(
              key: args.key, onAuthenticated: args.onAuthenticated),
          opaque: true,
          barrierDismissible: false);
    },
    HomeRouter.name: (routeData) {
      final args = routeData.argsAs<HomeRouterArgs>(
          orElse: () => const HomeRouterArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.HomeParent(key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    CollectionParentRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionParentRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.CollectionParent(item: args.item),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.Details(item: args.item, heroTag: args.heroTag),
          opaque: true,
          barrierDismissible: false);
    },
    SettingsRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.Settings(),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    MusicPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<MusicPlayerRouteArgs>(
          orElse: () => const MusicPlayerRouteArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.MusicPlayer(key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    PlaylistRoute.name: (routeData) {
      final args = routeData.argsAs<PlaylistRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.Playlist(
              key: args.key,
              body: args.body,
              playlistTheme: args.playlistTheme),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    StreamRoute.name: (routeData) {
      final args = routeData.argsAs<StreamRouteArgs>(
          orElse: () => const StreamRouteArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.Stream(item: args.item, url: args.url),
          transitionsBuilder: _i1.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    BookReaderPageRoute.name: (routeData) {
      final args = routeData.argsAs<BookReaderPageRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.BookReaderPage(key: args.key, item: args.item),
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i13.Home(),
          opaque: true,
          barrierDismissible: false);
    },
    CollectionRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.CollectionParent(item: args.item),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        _i1.RouteConfig(AuthParentRoute.name, path: 'authentication'),
        _i1.RouteConfig(HomeRouter.name, path: 'home', guards: [
          authGuard
        ], children: [
          _i1.RouteConfig(HomeRoute.name, path: ''),
          _i1.RouteConfig(CollectionRoute.name,
              path: 'collection-parent', guards: [authGuard]),
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i1.RouteConfig(CollectionParentRoute.name,
            path: '/collection-parent', guards: [authGuard]),
        _i1.RouteConfig(DetailsRoute.name, path: 'details'),
        _i1.RouteConfig(SettingsRoute.name,
            path: 'settings', guards: [authGuard]),
        _i1.RouteConfig(MusicPlayerRoute.name,
            path: 'music-player', guards: [authGuard]),
        _i1.RouteConfig(PlaylistRoute.name,
            path: 'playlist', guards: [authGuard]),
        _i1.RouteConfig(StreamRoute.name, path: 'stream', guards: [authGuard]),
        _i1.RouteConfig(BookReaderPageRoute.name,
            path: 'epub', guards: [authGuard])
      ];
}

class AuthParentRoute extends _i1.PageRouteInfo<AuthParentRouteArgs> {
  AuthParentRoute({_i2.Key? key, void Function()? onAuthenticated})
      : super(name,
            path: 'authentication',
            args: AuthParentRouteArgs(
                key: key, onAuthenticated: onAuthenticated));

  static const String name = 'AuthParentRoute';
}

class AuthParentRouteArgs {
  const AuthParentRouteArgs({this.key, this.onAuthenticated});

  final _i2.Key? key;

  final void Function()? onAuthenticated;
}

class HomeRouter extends _i1.PageRouteInfo<HomeRouterArgs> {
  HomeRouter({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: 'home',
            args: HomeRouterArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRouter';
}

class HomeRouterArgs {
  const HomeRouterArgs({this.key});

  final _i2.Key? key;
}

class CollectionParentRoute
    extends _i1.PageRouteInfo<CollectionParentRouteArgs> {
  CollectionParentRoute({required _i14.Item item})
      : super(name,
            path: '/collection-parent',
            args: CollectionParentRouteArgs(item: item));

  static const String name = 'CollectionParentRoute';
}

class CollectionParentRouteArgs {
  const CollectionParentRouteArgs({required this.item});

  final _i14.Item item;
}

class DetailsRoute extends _i1.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({required _i14.Item item, required String? heroTag})
      : super(name,
            path: 'details',
            args: DetailsRouteArgs(item: item, heroTag: heroTag));

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({required this.item, required this.heroTag});

  final _i14.Item item;

  final String? heroTag;
}

class SettingsRoute extends _i1.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: 'settings');

  static const String name = 'SettingsRoute';
}

class MusicPlayerRoute extends _i1.PageRouteInfo<MusicPlayerRouteArgs> {
  MusicPlayerRoute({_i2.Key? key})
      : super(name, path: 'music-player', args: MusicPlayerRouteArgs(key: key));

  static const String name = 'MusicPlayerRoute';
}

class MusicPlayerRouteArgs {
  const MusicPlayerRouteArgs({this.key});

  final _i2.Key? key;
}

class PlaylistRoute extends _i1.PageRouteInfo<PlaylistRouteArgs> {
  PlaylistRoute(
      {_i2.Key? key,
      required _i2.Widget body,
      required _i2.ThemeData playlistTheme})
      : super(name,
            path: 'playlist',
            args: PlaylistRouteArgs(
                key: key, body: body, playlistTheme: playlistTheme));

  static const String name = 'PlaylistRoute';
}

class PlaylistRouteArgs {
  const PlaylistRouteArgs(
      {this.key, required this.body, required this.playlistTheme});

  final _i2.Key? key;

  final _i2.Widget body;

  final _i2.ThemeData playlistTheme;
}

class StreamRoute extends _i1.PageRouteInfo<StreamRouteArgs> {
  StreamRoute({_i14.Item? item, String? url})
      : super(name,
            path: 'stream', args: StreamRouteArgs(item: item, url: url));

  static const String name = 'StreamRoute';
}

class StreamRouteArgs {
  const StreamRouteArgs({this.item, this.url});

  final _i14.Item? item;

  final String? url;
}

class BookReaderPageRoute extends _i1.PageRouteInfo<BookReaderPageRouteArgs> {
  BookReaderPageRoute({_i2.Key? key, required _i14.Item item})
      : super(name,
            path: 'epub', args: BookReaderPageRouteArgs(key: key, item: item));

  static const String name = 'BookReaderPageRoute';
}

class BookReaderPageRouteArgs {
  const BookReaderPageRouteArgs({this.key, required this.item});

  final _i2.Key? key;

  final _i14.Item item;
}

class HomeRoute extends _i1.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

class CollectionRoute extends _i1.PageRouteInfo<CollectionRouteArgs> {
  CollectionRoute({required _i14.Item item})
      : super(name,
            path: 'collection-parent', args: CollectionRouteArgs(item: item));

  static const String name = 'CollectionRoute';
}

class CollectionRouteArgs {
  const CollectionRouteArgs({required this.item});

  final _i14.Item item;
}
