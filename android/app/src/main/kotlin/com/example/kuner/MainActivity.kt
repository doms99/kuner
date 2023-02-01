package com.example.kuner

import android.content.Context
import android.os.Bundle
import android.os.Vibrator
import com.google.android.wearable.compat.WearableActivityController
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

enum class Shape {
  circle,
  rectangle
}

class MainActivity: FlutterActivity(), MethodChannel.MethodCallHandler {
  companion object {
    private val ROTARY_CHANNEL = "rotary-channel"
    private val AMBIENT_CHANNEL = "ambient-channel"
    private val METHOD_CHANNEL = "method-channel"
    private val CONTROLLER_TAG = "controller-tag"
  }
  private val vibrator get() = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
  private val rootView get() = window.decorView.rootView
  private val ambientCallback = AmbientCallback()
  private lateinit var ambientController: WearableActivityController

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    val root = rootView
    print(root)

    super.configureFlutterEngine(flutterEngine)
    EventChannel(flutterEngine.dartExecutor.binaryMessenger, ROTARY_CHANNEL)
      .setStreamHandler(RotaryStreamHandler(rootView, vibrator))
    EventChannel(flutterEngine.dartExecutor.binaryMessenger, AMBIENT_CHANNEL)
      .setStreamHandler(ambientCallback)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)
      .setMethodCallHandler(this)
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    ambientController = WearableActivityController(CONTROLLER_TAG, this, ambientCallback)
    ambientCallback.onCreate(ambientController.isAmbient)
    ambientController.setAmbientEnabled()
    ambientController.onCreate()
  }

  override fun onResume() {
    super.onResume()
    ambientController.onResume()
  }

  override fun onPause() {
    super.onPause()
    ambientController.onPause()
  }

  override fun onStop() {
    super.onStop()
    ambientController.onStop()
  }

  override fun onDestroy() {
    super.onDestroy()
    ambientController.onDestroy()
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when(call.method) {
      "getDeviceShape" -> result.success(getShape().toString())
    }
  }

  private fun getShape(): Shape {
    return if(activity.resources.configuration.isScreenRound) {
      Shape.circle
    } else {
      Shape.rectangle
    }
  }

}
