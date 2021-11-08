import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:omar_alshyokh_test/utils/locale/app_localization.dart';

class MyClassicFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      loadingText: AppLocalizations.of(context).translate('loadingText'),
      canLoadingText: AppLocalizations.of(context).translate('load_more'),
      failedText: AppLocalizations.of(context).translate('load_fail'),
      noDataText: AppLocalizations.of(context).translate('no_data'),
      idleText: AppLocalizations.of(context).translate('pull_up'),
    );
  }
}
