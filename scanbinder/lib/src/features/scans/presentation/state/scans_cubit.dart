import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanbinder/src/features/scans/domain/entities/scan_item.dart';
import 'package:scanbinder/src/features/scans/domain/repos/scan_repository.dart';
import 'scans_state.dart';

class ScansCubit extends Cubit<ScansState> {
  final ScanRepository repo;
  ScansCubit(this.repo) : super(const ScansInitial());

  Future<void> load() async {
    emit(const ScansLoading());
    try {
      final items = await repo.getAll();
      emit(ScansLoaded(scans: items));
    } catch (e) {
      emit(ScansError(e.toString()));
    }
  }

  Future<void> add(ScanItem item) async {
    try {
      await repo.add(item);
      final items = await repo.getAll();
      emit(ScansLoaded(scans: items));
    } catch (e) {
      emit(ScansError(e.toString()));
    }
  }

  Future<void> delete(String id) async {
    try {
      await repo.delete(id);
      final items = await repo.getAll();
      emit(ScansLoaded(scans: items));
    } catch (e) {
      emit(ScansError(e.toString()));
    }
  }

  Future<void> search(String q) async {
    try {
      final items = await repo.search(q);
      emit(ScansLoaded(scans: items, query: q));
    } catch (e) {
      emit(ScansError(e.toString()));
    }
  }
}