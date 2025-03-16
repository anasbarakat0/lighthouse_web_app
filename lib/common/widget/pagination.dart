import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const PaginationWidget({super.key, 
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return FittedBox(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: navy,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.arrow_back,color:currentPage > 1 ? orange : darkNavy,),
              onPressed:
                  currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
            ),
            ...List.generate(
              totalPages,
              (index) => index + 1,
            )
                .where((page) =>
                    page == 1 ||
                    page == totalPages ||
                    (page >= currentPage - 1 && page <= currentPage + 1))
                .map<Widget>((page) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: page == currentPage
                              ? orange
                              : darkNavy,
                        ),
                        child: Text(
                          '$page',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            
                            color:Colors.white,
                          ),
                        ),
                        onPressed: () => onPageChanged(page),
                      ),
                    ))
                .toList()
                .followedBy([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 35,
                  width: 100,
                  child: TextField(
                    controller: controller,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      label:  Align(
                        alignment: Alignment.center, // Center-align the label
                        child: Text("Page No.".tr(),style: Theme.of(context).textTheme.bodySmall?.copyWith(color: grey),),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.only(bottom: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: navy),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: navy),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: orange),
                      ),
                      filled: true,
                      fillColor: darkNavy,
                    ),
                    onSubmitted: (value) {
                      int page = int.tryParse(value) ?? 1;
                      if (page > 0 && page <= totalPages) {
                        onPageChanged(page);
                      }
                      controller.clear();
                    },
                  ),
                ),
              ),
            ]),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: currentPage < totalPages ? orange : darkNavy,
              ),
              onPressed: currentPage < totalPages
                  ? () => onPageChanged(currentPage + 1)
                  : null,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
