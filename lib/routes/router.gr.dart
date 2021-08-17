// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/jellyfin/item.dart' as _i13;
import '../screens/auth/authParent.dart' as _i4;
import '../screens/collection/collectionMain.dart' as _i9;
import '../screens/details/details.dart' as _i6;
import '../screens/epub/epubReader.dart' as _i12;
import '../screens/home/home.dart' as _i5;
import '../screens/musicPlayer/musicPlayer.dart' as _i8;
import '../screens/musicPlayer/routes/playlist.dart' as _i10;
import '../screens/settings/settings.dart' as _i7;
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
    AuthParentRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AuthParentRouteArgs>(
              orElse: () => const AuthParentRouteArgs());
          return _i4.AuthParent(
              key: args.key, onAuthenticated: args.onAuthenticated);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    HomeRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.Home();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    DetailsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DetailsRouteArgs>();
          return _i6.Details(item: args.item, heroTag: args.heroTag);
        },
        opaque: true,
        barrierDismissible: false),
    SettingsRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.Settings();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    MusicPlayerRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MusicPlayerRouteArgs>(
              orElse: () => const MusicPlayerRouteArgs());
          return _i8.MusicPlayer(key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    CollectionMainRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CollectionMainRouteArgs>();
          return _i9.CollectionMain(item: args.item);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    PlaylistRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PlaylistRouteArgs>();
          return _i10.Playlist(
              key: args.key,
              body: args.body,
              playlistTheme: args.playlistTheme);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    StreamRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<StreamRouteArgs>();
          return _i11.Stream(player: args.player, item: args.item);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    EpubReaderPageRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EpubReaderPageRouteArgs>();
          return _i12.EpubReaderPage(key: args.key, item: args.item);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AuthParentRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        _i1.RouteConfig(DetailsRoute.name,
            path: '/Details', guards: [authGuard]),
        _i1.RouteConfig(SettingsRoute.name,
            path: '/Settings', guards: [authGuard]),
        _i1.RouteConfig(MusicPlayerRoute.name,
            path: '/music-player', guards: [authGuard]),
        _i1.RouteConfig(CollectionMainRoute.name,
            path: '/collection-main', guards: [authGuard]),
        _i1.RouteConfig(PlaylistRoute.name,
            path: '/Playlist', guards: [authGuard]),
        _i1.RouteConfig(StreamRoute.name, path: '/Stream', guards: [authGuard]),
        _i1.RouteConfig(EpubReaderPageRoute.name,
            path: '/epub-reader-page', guards: [authGuard])
      ];
}

class AuthParentRoute extends _i1.PageRouteInfo<AuthParentRouteArgs> {
  AuthParentRoute({_i2.Key? key, void Function()? onAuthenticated})
      : super(name,
            path: '/',
            args: AuthParentRouteArgs(
                key: key, onAuthenticated: onAuthenticated));

  static const String name = 'AuthParentRoute';
}

class AuthParentRouteArgs {
  const AuthParentRouteArgs({this.key, this.onAuthenticated});

  final _i2.Key? key;

  final void Function()? onAuthenticated;
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class DetailsRoute extends _i1.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({required _i13.Item item, required String heroTag})
      : super(name,
            path: '/Details',
            args: DetailsRouteArgs(item: item, heroTag: heroTag));

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({required this.item, required this.heroTag});

  final _i13.Item item;

  final String heroTag;
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: '/Settings');

  static const String name = 'SettingsRoute';
}

class MusicPlayerRoute extends _i1.PageRouteInfo<MusicPlayerRouteArgs> {
  MusicPlayerRoute({_i2.Key? key})
      : super(name,
            path: '/music-player', args: MusicPlayerRouteArgs(key: key));

  static const String name = 'MusicPlayerRoute';
}

class MusicPlayerRouteArgs {
  const MusicPlayerRouteArgs({this.key});

  final _i2.Key? key;
}

class CollectionMainRoute extends _i1.PageRouteInfo<CollectionMainRouteArgs> {
  CollectionMainRoute({required _i13.Item item})
      : super(name,
            path: '/collection-main',
            args: CollectionMainRouteArgs(item: item));

  static const String name = 'CollectionMainRoute';
}

class CollectionMainRouteArgs {
  const CollectionMainRouteArgs({required this.item});

  final _i13.Item item;
}

class PlaylistRoute extends _i1.PageRouteInfo<PlaylistRouteArgs> {
  PlaylistRoute(
      {_i2.Key? key,
      required _i2.Widget body,
      required _i2.ThemeData playlistTheme})
      : super(name,
            path: '/Playlist',
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
  StreamRoute({required _i2.Widget player, required _i13.Item item})
      : super(name,
            path: '/Stream', args: StreamRouteArgs(player: player, item: item));

  static const String name = 'StreamRoute';
}

class StreamRouteArgs {
  const StreamRouteArgs({required this.player, required this.item});

  final _i2.Widget player;

  final _i13.Item item;
}

class EpubReaderPageRoute extends _i1.PageRouteInfo<EpubReaderPageRouteArgs> {
  EpubReaderPageRoute({_i2.Key? key, required _i13.Item item})
      : super(name,
            path: '/epub-reader-page',
            args: EpubReaderPageRouteArgs(key: key, item: item));

  static const String name = 'EpubReaderPageRoute';
}

class EpubReaderPageRouteArgs {
  const EpubReaderPageRouteArgs({this.key, required this.item});

  final _i2.Key? key;

  final _i13.Item item;
}