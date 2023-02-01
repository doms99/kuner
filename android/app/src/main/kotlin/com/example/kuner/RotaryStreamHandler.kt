package com.example.kuner

import android.os.Vibrator
import android.view.InputDevice
import android.view.MotionEvent
import android.view.View
import androidx.core.view.MotionEventCompat
import io.flutter.plugin.common.EventChannel

class RotaryStreamHandler(private val view: View, private val vibrator: Vibrator): EventChannel.StreamHandler {
  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    view.setOnGenericMotionListener { _, event ->
      if(event.isFromSource(InputDevice.SOURCE_ROTARY_ENCODER) && event.action == MotionEvent.ACTION_SCROLL) {
        val delta = -event.getAxisValue(MotionEventCompat.AXIS_SCROLL)
        events?.success(delta)
      }
      if(arguments is Map<*, *> && arguments["vibrate"] == true) {
        vibrator.vibrate(10)
      }

      true
    }
  }

  override fun onCancel(arguments: Any?) {
    view.setOnGenericMotionListener(null)
  }
}
