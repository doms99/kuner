package com.example.kuner

import android.os.Bundle
import androidx.wear.ambient.AmbientModeSupport
import com.google.android.wearable.compat.WearableActivityController
import io.flutter.plugin.common.EventChannel

class AmbientCallback : WearableActivityController.AmbientCallback(), EventChannel.StreamHandler {
  private var events: EventChannel.EventSink? = null
  private var isInitialAmbient: Boolean? = null

  override fun onEnterAmbient(ambientDetails: Bundle?) {
    events?.success(true)
  }

  override fun onExitAmbient() {
    events?.success(false)
  }

  override fun onUpdateAmbient() {
    // Update the content
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    this.events = events
    if(isInitialAmbient != null) {
      events?.success(isInitialAmbient)
      isInitialAmbient = null
    }
  }

  override fun onCancel(arguments: Any?) {
    events = null
  }

  fun onCreate(isAmbient: Boolean) {
    isInitialAmbient = isAmbient
  }
}
