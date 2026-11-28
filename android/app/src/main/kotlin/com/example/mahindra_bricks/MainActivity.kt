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
                        if (!file.exists()) {
                            result.error("FILE_NOT_FOUND", "PDF file does not exist", null)
                            return@setMethodCallHandler
                        }

                        val uri: Uri = FileProvider.getUriForFile(
                            this,
                            "${applicationContext.packageName}.fileprovider",
                            file
                        )

                        var formattedPhone = phone.replace(Regex("[^0-9]"), "")
                        if (formattedPhone.length == 10) {
                            formattedPhone = "91$formattedPhone"
                        }

                        val baseIntent = Intent(Intent.ACTION_SEND).apply {
                            type = "application/pdf"
                            putExtra(Intent.EXTRA_STREAM, uri)
                            putExtra("jid", "$formattedPhone@s.whatsapp.net")
                            if (!text.isNullOrEmpty()) {
                                putExtra(Intent.EXTRA_TEXT, text)
                            }
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        }

                        // 1. Try Standard WhatsApp directly
                        try {
                            applicationContext.grantUriPermission("com.whatsapp", uri, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            val waIntent = Intent(baseIntent).apply {
                                setPackage("com.whatsapp")
                            }
                            startActivity(waIntent)
                            result.success(true)
                            return@setMethodCallHandler
                        } catch (_: Exception) {
                            // Standard WhatsApp not installed or failed
                        }

                        // 2. Try WhatsApp Business directly
                        try {
                            applicationContext.grantUriPermission("com.whatsapp.w4b", uri, Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            val w4bIntent = Intent(baseIntent).apply {
                                setPackage("com.whatsapp.w4b")
                            }
                            startActivity(w4bIntent)
                            result.success(true)
                            return@setMethodCallHandler
                        } catch (_: Exception) {
                            // WhatsApp Business not installed or failed
                        }

                        // 3. Fallback: Chooser
                        try {
                            val chooser = Intent.createChooser(baseIntent, "Share Invoice PDF").apply {
                                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            }
                            startActivity(chooser)
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("SHARE_ERROR", e.localizedMessage, null)
                        }
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
