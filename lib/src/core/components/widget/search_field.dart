import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:havenfinder/src/core/theme/constants.dart';

class SearchField extends ConsumerWidget {
  const SearchField({Key? key, this.search, this.focusNode}) : super(key: key);
  final void Function(String, WidgetRef, BuildContext)? search;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      // focusNode: focusNode,
      cursorColor: Theme.of(context).primaryColor,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        // hintStyle: Theme.of(context)
        //     .inputDecorationTheme
        //     .hintStyle!
        //     .copyWith(color: Constant.greyColor, height: 1.5),
        hintText: 'Search for a property...',
        filled: true,
        fillColor: Colors.transparent,
        prefixIcon: const Padding(
          padding: EdgeInsetsDirectional.only(
            start: 20,
            end: 10,
          ),
          child: ImageIcon(
            AssetImage('assets/icons/search_icon.png'),
            color: Constant.greyColor,
            size: 25,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Constant.brandColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Constant.superLightGreyColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      // onSubmitted: (text) => search!(text, ref, context),
      // onChanged: (text) => search!(text, ref, context),
    );
  }
}
