import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_puyopuyo/enum/puyo_shape_type.dart';
import 'package:flutter_puyopuyo/enum/rotation_state_type.dart';
import 'package:flutter_puyopuyo/game_settings.dart';
import 'package:flutter_puyopuyo/state/drop_set_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/move_operation_type.dart';
import '../enum/rotation_operation_type.dart';
import '../model/drop_set.dart';
import '../model/piece_operation.dart';
import 'main_field_state.dart';

/// ピース(ツモ)操作状態プロバイダ
final pieceOperationStateProvider = ChangeNotifierProvider((ref) => PieceOperationState(ref));

/// ピース(ツモ)操作状態
class PieceOperationState extends ChangeNotifier {
  PieceOperationState(this.ref);

  final Ref ref;

  /// ピース(ツモ)操作
  PieceOperation state = const PieceOperation();

  /// 現在の手数位置
  int currentHandPosition = 0;

  /// リセット
  void reset() {
    state = const PieceOperation();
    currentHandPosition = 0;

    notifyListeners();
  }

  /// 手数位置移動 : 次
  void moveToNextHandPosition() {
    currentHandPosition++;
    notifyListeners();
  }

  /// 手数位置移動 : 前
  void backToPrevHandPosition() {
    currentHandPosition = max(currentHandPosition--, 0);
    notifyListeners();
  }

  /// ピース(ツモ)落下
  void pieceFall() {
    state = state.copyWith(axisPositionY: state.axisPositionY + 1);
    notifyListeners();
  }

  /// ピース(ツモ)移動
  void pieceMove(MoveOperationType moveOperationType) {
    // プロバイダー
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);

    // 現在手のドロップセットの取得
    final DropSet? dropSet = dropSetState.getDropSet(currentHandPosition);

    // 移動後 : 軸位置 : X
    double afterMoveAxisPositionX = 0.0;
    // 移動後 : 軸位置 : Y
    double afterMoveAxisPositionY = 0.0;
    // 移動処理が正常終了した場合の状態リストを設定
    List<PieceOperation> resultStateList = [];

    // 形状別リスト設定
    if (dropSet?.puyoShapeType == PuyoShapeType.I) {
      
    }
  }

  /// ピース(ツモ)回転
  void pieceRotation(RotationOperationType rotationOperationType) {
    // プロバイダー
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
    // メインフィールド
    final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);

    // 現在手のドロップセットの取得
    final DropSet? dropSet = dropSetState.getDropSet(currentHandPosition);

    // 回転後 : 回転状態種類
    RotationStateType afterRotationStateType = state.rotationStateType.change(rotationOperationType);
    // 回転後 : 軸位置 : X
    double afterRotationAxisPositionX = 0.0;
    // 回転後 : 軸位置 : Y
    double afterRotationAxisPositionY = 0.0;
    // 回転処理が正常終了した場合の状態リストを設定
    List<PieceOperation> resultStateList = [];

    // 形状別リスト設定
    if (dropSet?.puyoShapeType == PuyoShapeType.I) {
      // 通常
      resultStateList.add(state.copyWith(
        rotationStateType: afterRotationStateType,
        quickTurnFlag: false,
      ));
      // 押出
      switch (afterRotationStateType) {
        case RotationStateType.U:
          afterRotationAxisPositionY = afterRotationAxisPositionY + GameSettings.numOfMoveSteps;
          break;
        case RotationStateType.R:
          afterRotationAxisPositionX = afterRotationAxisPositionX - GameSettings.numOfMoveSteps;
          break;
        case RotationStateType.D:
          afterRotationAxisPositionY = afterRotationAxisPositionY - GameSettings.numOfMoveSteps;
          break;
        case RotationStateType.L:
          afterRotationAxisPositionX = afterRotationAxisPositionX + GameSettings.numOfMoveSteps;
          break;
      }
      resultStateList.add(state.copyWith(
        rotationStateType: afterRotationStateType,
        axisPositionX: state.axisPositionX + afterRotationAxisPositionX,
        axisPositionY: state.axisPositionY + afterRotationAxisPositionY,
        quickTurnFlag: false,
      ));
      // クイックターン
      if (state.quickTurnFlag) {
        // クイックターン後 : 回転状態種類
        afterRotationStateType = afterRotationStateType.change(rotationOperationType);
        // クイックターン : 通常
        resultStateList.add(state.copyWith(
          rotationStateType: afterRotationStateType,
          quickTurnFlag: false,
        ));
        // クイックターン : 押出
        switch (afterRotationStateType) {
          case RotationStateType.U:
            afterRotationAxisPositionY += GameSettings.numOfMoveSteps;
            break;
          case RotationStateType.D:
            afterRotationAxisPositionY -= GameSettings.numOfMoveSteps;
            break;
          default:
            break;
        }
        resultStateList.add(state.copyWith(
          rotationStateType: afterRotationStateType,
          axisPositionX: state.axisPositionX + afterRotationAxisPositionX,
          axisPositionY: state.axisPositionY + afterRotationAxisPositionY,
          quickTurnFlag: false,
        ));
      } else {
        // クイックターン : フラグが立つ
        resultStateList.add(state.copyWith(
          quickTurnFlag: true,
        ));
      }
    }

    // 状態リストの精査
    for (PieceOperation resultState in resultStateList) {
      // メインフィールドとの衝突チェック
      if (!mainFieldState.collisionCheck(resultState.getPositionToFieldCoordinate())) {
        state = resultState;
        notifyListeners();
        return;
      }
    }
  }
}
