part of '../../../application/bloc/status/status_bloc.dart';

@immutable
sealed class StatusEvent {}

final class StatusRefreshPressed extends StatusEvent {}
