import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahindra_bricks/Constant/Sizes.dart';

class SaveCancelButtons extends StatelessWidget {
  final String saveText;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;

  SaveCancelButtons({
    super.key,
    required this.saveText,
    this.onCancel,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    Color brown = Color(0xFF8B2E1D);
    Color red = Color(0xFFD95353);

    return Row(
      children: [

        Expanded(
          child: SizedBox(
            height: Sizes.screenWidth * 0.12,
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFFB3261E),
                side: BorderSide(color: red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close, size: 19),
                  SizedBox(width: 8),
                  Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: Sizes.screenWidth * 0.12,
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: brown,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save, size: 20),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      saveText,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
