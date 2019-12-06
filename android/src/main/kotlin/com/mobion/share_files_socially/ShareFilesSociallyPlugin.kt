package com.mobion.share_files_socially

import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.io.File
import androidx.core.content.FileProvider

class ShareFilesSociallyPlugin(private val registrar: PluginRegistry.Registrar): MethodCallHandler {
  private val androidContext: Context = registrar.activity() ?: registrar.activeContext()
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "channel:com.mobion.share_files_socially.fileprovider/share")
      channel.setMethodCallHandler(ShareFilesSociallyPlugin(registrar))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }  else if (call.method == "shareFilesTest") {
      shareFiles(call.arguments as String)
    } else {
      result.notImplemented()
    }
  }

  private fun shareFiles(path:String) {
    val contentFile = File(androidContext.cacheDir,path)
    val contentUri = FileProvider.getUriForFile(androidContext,"com.mobion.share_files_socially.fileprovider",contentFile)

    val shareIntent = Intent()
    shareIntent.action = Intent.ACTION_SEND
    shareIntent.type="*/*"
    shareIntent.putExtra(Intent.EXTRA_STREAM, contentUri)
    androidContext.startActivity(Intent.createChooser(shareIntent,"Compartir usando"))
  }
}
