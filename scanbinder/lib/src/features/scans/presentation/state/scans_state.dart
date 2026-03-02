import 'package:equatable/equatable.dart';
import 'package:scanbinder/src/features/scans/domain/entities/scan_item.dart';

abstract class ScansState extends Equatable {
  const ScansState();
  @override
  List<Object?> get props => [];
}

class ScansInitial extends ScansState {
  const ScansInitial();
}

class ScansLoading extends ScansState {
  const ScansLoading();
}

class ScansLoaded extends ScansState {
  final List<ScanItem> scans;
  final String query;
  const ScansLoaded({required this.scans, this.query = ''});

  @override
  List<Object?> get props => [scans, query];
}

class ScansError extends ScansState {
  final String message;
  const ScansError(this.message);

  @override
  List<Object?> get props => [message];
}