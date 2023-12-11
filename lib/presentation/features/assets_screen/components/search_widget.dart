import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_colors.dart';
import 'package:fabric_assets_tree_structure/presentation/design_system/theme/tract_typography.dart';
import 'package:fabric_assets_tree_structure/presentation/features/unit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController editingController;
  final double height;

  const SearchWidget(this.editingController, this.height, {super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchWidgetState();
  }
}

class SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: widget.height,
            child: TextField(
              controller: widget.editingController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Pesquisar",
                  labelStyle:
                      TypoSemiBold.body_4.copyWith(color: TractColors.g500),
                  suffixIcon:
                      const Icon(Icons.search, color: TractColors.primary),
                  contentPadding: const EdgeInsets.only(left: 20, right: 16),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(width: 1.25, color: TractColors.g500),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(width: 1.25, color: TractColors.primary),
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
              onPressed: () {
                if (widget.editingController.text != '') {
                  Provider.of<UnitViewModel>(context, listen: false)
                      .addSearch(widget.editingController.text);
                }
              },
              icon: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: TractColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: TractColors.white,
                    size: 28,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
