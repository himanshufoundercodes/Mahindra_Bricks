package com.example.mahindra_bricks

import android.content.Intent
import android.net.Uri
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.mahindra_bricks/whatsapp"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "sharePdfToWhatsapp") {
                val filePath = call.argument<String>("filePath")
                val phone = call.argument<String>("phone")
                val text = call.argument<String>("text")

                if (filePath != null && phone != null) {
                    try {
                        val file = File(filePath)
                        val uri: Uri = FileProvider.getUriForFile(
                            this,
                            "${applicationContext.packageName}.fileprovider",
                            file
                        )

                        var formattedPhone = phone.replace(Regex("[^0-9]"), "")
                        if (formattedPhone.length == 10) {
                            formattedPhone = "91$formattedPhone"
                        }

                        val intent = Intent(Intent.ACTION_SEND).apply {
                            type = "application/pdf"
                            putExtra(Intent.EXTRA_STREAM, uri)
                            putExtra("jid", "$formattedPhone@s.whatsapp.net")
                            if (!text.isNullOrEmpty()) {
                                putExtra(Intent.EXTRA_TEXT, text)
                            }
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        }

                        // Try standard WhatsApp first
                        intent.setPackage("com.whatsapp")
                        if (intent.resolveActivity(packageManager) != null) {
                            startActivity(intent)
                            result.success(true)
                            return@setMethodCallHandler
                        }

                        // Try WhatsApp Business
                        intent.setPackage("com.whatsapp.w4b")
                        if (intent.resolveActivity(packageManager) != null) {
                            startActivity(intent)
                            result.success(true)
                            return@setMethodCallHandler
                        }

                        // Fallback: chooser
                        intent.setPackage(null)
                        startActivity(Intent.createChooser(intent, "Share Invoice PDF"))
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("SHARE_ERROR", e.localizedMessage, null)
                    }
                } else {
                    result.error("INVALID_ARGS", "File path or phone is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
