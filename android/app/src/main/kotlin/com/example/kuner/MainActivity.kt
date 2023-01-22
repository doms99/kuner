package com.example.kuner

import android.content.Context
import android.os.Bundle
import android.os.Vibrator
import android.view.InputDevice
import android.view.MotionEvent
import androidx.core.view.MotionEventCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "main-channel"
  private val vibrator get() = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
  private val rootView get() = window.decorView.rootView

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    val root = rootView
    print(root)

    super.configureFlutterEngine(flutterEngine)
    EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
      .setStreamHandler(RotaryStreamHandler(this))
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(createFlutterView())

    configureStatusBarForFullscreenFlutterExperience()
  }



  private class RotaryStreamHandler(private val mainActivity: MainActivity): EventChannel.StreamHandler {
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
      mainActivity.rootView.setOnGenericMotionListener { _, event ->
        if(event.isFromSource(InputDevice.SOURCE_ROTARY_ENCODER) && event.action == MotionEvent.ACTION_SCROLL) {
          val delta = -event.getAxisValue(MotionEventCompat.AXIS_SCROLL)
          events?.success(delta)
        }
        if(arguments is Map<*, *> && arguments["vibrate"] == true) {
          mainActivity.vibrator.vibrate(10)
        }

        true
      }
    }

    override fun onCancel(arguments: Any?) {
      mainActivity.rootView.setOnGenericMotionListener(null)
    }
  }
}
