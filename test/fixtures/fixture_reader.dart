import 'package:universal_io/io.dart';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
