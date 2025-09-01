import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sora/infrastructure/core/drift_download_info.dart';

part 'drift_injectable_module.g.dart';

@DriftDatabase(tables: [DriftDownloadInfo])
class DriftSoraDatabase extends _$DriftSoraDatabase {
  DriftSoraDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'soradb',
      native: const DriftNativeOptions(databaseDirectory: getDatabasePath),
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Empty - no actual schema changes needed
      // This handles the "accidental" bump from 1 to 2
    },
  );

  static Future<String> getDatabasePath() async {
    final directory = await getApplicationSupportDirectory();
    return path.join(directory.path, 'sora');
  }
}

@module
abstract class IDriftInjectableModule {
  @preResolve
  @lazySingleton
  Future<DriftSoraDatabase> get drift async {
    final database = DriftSoraDatabase();

    return database;
  }
}
