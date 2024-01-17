import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enum/move_operation_type.dart';
import '../enum/puyo_shape_type.dart';
import '../enum/puyo_type.dart';
import '../enum/rotation_operation_type.dart';
import '../enum/rotation_state_type.dart';
import '../game_settings.dart';
import '../model/drop_set.dart';
import '../model/field_coordinate.dart';
import '../model/piece_operation.dart';
import 'drop_set_state.dart';
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

  /// 横移動処理フラグ
  bool horizontalMoveProcessFlag = false;

  /// 回転処理フラグ
  bool rotationProcessFlag = false;

  /// リセット
  void reset() {
    state = const PieceOperation();
    currentHandPosition = 0;

    notifyListeners();
  }

  /// 手数位置移動 : 次
  void moveToNextHandPosition() {
    state = const PieceOperation();
    currentHandPosition++;
    notifyListeners();
  }

  /// 手数位置移動 : 前
  void backToPrevHandPosition() {
    state = const PieceOperation();
    currentHandPosition = max(currentHandPosition--, 0);
    notifyListeners();
  }

  /// ピース(ツモ)落下
  void pieceFall() {
    // プロバイダー
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
    // メインフィールド
    final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);

    // 現在手のドロップセットの取得
    final DropSet? dropSet = dropSetState.getDropSet(currentHandPosition);
    if (dropSet == null) return;

    // 移動 : 落下数
    double numOfFallSteps =  (GameSettings.numOfMoveSteps / 2);

    // // 移動後 : 軸位置 : X
    // double afterMoveAxisPositionX = 0.0;
    // 移動後 : 軸位置 : Y
    double afterMoveAxisPositionY = state.axisPositionY + numOfFallSteps;
    // 移動後 : 接地待機時間
    double afterMoveGroundingTime = state.groundingTime + numOfFallSteps;
    // 移動処理が正常終了した場合の状態リストを設定
    List<PieceOperation> resultStateList = [];

    // 落下
    resultStateList.add(state.copyWith(
      axisPositionY: afterMoveAxisPositionY,
      // quickTurnFlag: false,
    ));

    // 接地待機時間カウント
    resultStateList.add(state.copyWith(
      groundingTime: afterMoveGroundingTime,
      // quickTurnFlag: false,
    ));

    // 状態リストの精査
    for (PieceOperation resultState in resultStateList) {
      // メインフィールドとの衝突チェック
      if (!mainFieldState.collisionCheck(resultState.getPositionToFieldCoordinate())) {
        state = resultState;
        notifyListeners();
        break;
      }
    }

    // 接地待機時間 : 判定
    if (state.groundingTime >= GameSettings.groundStandbyTime) {
      assert(state.getAxisPositionToFieldCoordinate().length == 1);
      assert(state.getChildPositionToFieldCoordinate().length == 1);

      // ぷよ種類リスト
      List<PuyoType> puyoTypeList = [];
      // フィールド座標リスト
      List<FieldCoordinate> fieldCoordinateList = [];

      // 形状別リスト設定
      if (dropSet.puyoShapeType == PuyoShapeType.I) {
        // 軸ぷよ設定
        puyoTypeList.add(dropSet.puyoTypeAxis);
        fieldCoordinateList.add(state.getAxisPositionToFieldCoordinate()[0]);

        // 子ぷよ設定
        puyoTypeList.add(dropSet.puyoTypeChild);
        fieldCoordinateList.add(state.getChildPositionToFieldCoordinate()[0]);

        // 配置処理
        mainFieldState.placement(puyoTypeList, fieldCoordinateList, justDropped: true);

        // 接地 - ピース(ツモ)処理
        mainFieldState.groundingPiece();

        // 接地 - フィールド
        mainFieldState.groundingField();

        // 連鎖
        mainFieldState.chain();
      }

      // 手数位置移動 : 次
      moveToNextHandPosition();
    }
  }

  /// ピース(ツモ)横移動
  void pieceHorizontalMove(MoveOperationType moveOperationType) {
    assert([MoveOperationType.R, MoveOperationType.L].contains(moveOperationType));

    // ピース(ツモ)横移動 : アニメーション実行中の場合は処理できない
    if (horizontalMoveProcessFlag) return;

    // プロバイダー
    // 配ぷよ(ドロップセット)リスト
    final DropSetState dropSetState = ref.read(dropSetStateProvider.notifier);
    // メインフィールド
    final MainFieldState mainFieldState = ref.read(mainFieldStateProvider.notifier);

    // 現在手のドロップセットの取得
    final DropSet? dropSet = dropSetState.getDropSet(currentHandPosition);
    if (dropSet == null) return;

    // 移動前 : 軸位置 : X
    double beforeMoveAxisPositionX = state.axisPositionX;

    // 移動後 : 軸位置 : X
    double afterMoveAxisPositionX = 0.0;

    // 移動処理が正常終了した場合の状態リストを設定
    List<PieceOperation> afterStateList = [];

    // 形状別リスト設定
    if (dropSet.puyoShapeType == PuyoShapeType.I) {
      // 横移動
      switch (moveOperationType) {
        case MoveOperationType.R:
          afterMoveAxisPositionX = beforeMoveAxisPositionX + GameSettings.numOfMoveSteps;
        case MoveOperationType.L:
          afterMoveAxisPositionX = beforeMoveAxisPositionX - GameSettings.numOfMoveSteps;
        case MoveOperationType.U:
        case MoveOperationType.D:
          return;
      }
      afterStateList.add(state.copyWith(
        axisPositionX: afterMoveAxisPositionX,
        quickTurnFlag: false,
      ));
    }

    // 状態リストの精査
    for (PieceOperation afterState in afterStateList) {
      // メインフィールドとの衝突チェック
      if (!mainFieldState.collisionCheck(afterState.getPositionToFieldCoordinate())) {
        // ピース(ツモ)横移動の反映
        state = afterState;

        // ピース(ツモ)横移動 : アニメーション
        pieceHorizontalMoveAnimation(beforeMoveAxisPositionX, state.axisPositionX);
        // notifyListeners();
        break;
      }
    }
  }

  /// ピース(ツモ)横移動 : アニメーション
  Future<void> pieceHorizontalMoveAnimation(double beforeMoveAxisPositionX, double afterMoveAxisPositionX) async {
    // アニメーション : 開始
    horizontalMoveProcessFlag = true;

    // フレーム数
    int frames = GameSettings.pieceHorizontalMoveAnimationNumOfFrames;

    // 移動数
    double moves = (afterMoveAxisPositionX - beforeMoveAxisPositionX);

    // ステップ数
    double steps = moves / (frames + 1);

    // アニメーション : 処理
    for (int i = 1; i <= frames; i++) {
      state = state.copyWith(axisPositionMoveX: beforeMoveAxisPositionX + (steps * i));
      notifyListeners();

      // アニメーション : 周期時間
      await Future.delayed(const Duration(microseconds: GameSettings.pieceHorizontalMoveAnimationCycleTime));
    }
    state = state.copyWith(axisPositionMoveX: null);
    notifyListeners();

    // アニメーション : 終了
    horizontalMoveProcessFlag = false;
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
    if (dropSet == null) return;

    // 回転後 : 回転状態種類
    RotationStateType afterRotationStateType = state.rotationStateType.change(rotationOperationType);
    // 回転後 : 軸位置 : X
    double afterRotationAxisPositionX = 0.0;
    // 回転後 : 軸位置 : Y
    double afterRotationAxisPositionY = 0.0;
    // 回転処理が正常終了した場合の状態リストを設定
    List<PieceOperation> resultStateList = [];

    // 形状別リスト設定
    if (dropSet.puyoShapeType == PuyoShapeType.I) {
      // 通常
      resultStateList.add(state.copyWith(
        rotationStateType: afterRotationStateType,
        quickTurnFlag: false,
      ));
      // 押出
      switch (afterRotationStateType) {
        case RotationStateType.U:
          afterRotationAxisPositionX = state.axisPositionX;
          afterRotationAxisPositionY = state.axisPositionY + GameSettings.numOfMoveSteps;
          break;
        case RotationStateType.R:
          afterRotationAxisPositionX = state.axisPositionX - GameSettings.numOfMoveSteps;
          afterRotationAxisPositionY = state.axisPositionY;
          break;
        case RotationStateType.D:
          afterRotationAxisPositionX = state.axisPositionX;
          afterRotationAxisPositionY = state.axisPositionY - GameSettings.numOfMoveSteps;
          break;
        case RotationStateType.L:
          afterRotationAxisPositionX = state.axisPositionX + GameSettings.numOfMoveSteps;
          afterRotationAxisPositionY = state.axisPositionY;
          break;
      }
      resultStateList.add(state.copyWith(
        rotationStateType: afterRotationStateType,
        axisPositionX: afterRotationAxisPositionX,
        axisPositionY: afterRotationAxisPositionY,
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
            afterRotationAxisPositionX = state.axisPositionX;
            afterRotationAxisPositionY = state.axisPositionY + GameSettings.numOfMoveSteps;
            break;
          case RotationStateType.D:
            afterRotationAxisPositionX = state.axisPositionX;
            afterRotationAxisPositionY = state.axisPositionY - GameSettings.numOfMoveSteps;
            break;
          default:
            afterRotationAxisPositionX = state.axisPositionX;
            afterRotationAxisPositionY = state.axisPositionY;
            break;
        }
        resultStateList.add(state.copyWith(
          rotationStateType: afterRotationStateType,
          axisPositionX: afterRotationAxisPositionX,
          axisPositionY: afterRotationAxisPositionY,
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
        break;
      }
    }
  }
}
