// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sora/application/archives/archives_bloc.dart' as _i357;
import 'package:sora/application/dashboard/dashboard_cubit.dart' as _i792;
import 'package:sora/application/downloads/downloads_bloc.dart' as _i614;
import 'package:sora/application/duplicates/duplicates_bloc.dart' as _i642;
import 'package:sora/domain/duplicates/i_duplicates_repository.dart' as _i487;
import 'package:sora/domain/gallery_dl/i_gallery_dl_repository.dart' as _i1058;
import 'package:sora/infrastructure/core/drift_injectable_module.dart' as _i759;
import 'package:sora/infrastructure/duplicates/duplicates_repository.dart'
    as _i385;
import 'package:sora/infrastructure/gallery_dl/gallery_dl_repository.dart'
    as _i136;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final iDriftInjectableModule = _$IDriftInjectableModule();
    gh.factory<_i792.DashboardCubit>(() => _i792.DashboardCubit());
    await gh.lazySingletonAsync<_i759.DriftSoraDatabase>(
      () => iDriftInjectableModule.drift,
      preResolve: true,
    );
    gh.lazySingleton<_i487.IDuplicatesRepository>(
      () => _i385.DuplicatesRepository(),
    );
    gh.lazySingleton<_i1058.IGalleryDLRepository>(
      () => _i136.GalleryDLRepository(gh<_i759.DriftSoraDatabase>()),
    );
    gh.factory<_i642.DuplicatesBloc>(
      () => _i642.DuplicatesBloc(gh<_i487.IDuplicatesRepository>()),
    );
    gh.factory<_i357.ArchivesBloc>(
      () => _i357.ArchivesBloc(gh<_i1058.IGalleryDLRepository>()),
    );
    gh.factory<_i614.DownloadsBloc>(
      () => _i614.DownloadsBloc(gh<_i1058.IGalleryDLRepository>()),
    );
    return this;
  }
}

class _$IDriftInjectableModule extends _i759.IDriftInjectableModule {}
