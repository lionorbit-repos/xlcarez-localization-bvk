import 'dart:ui';
import 'dart:math' as math;
import 'package:XLcarez/env/appexports.dart';
class BottomSheetSettings {
  const BottomSheetSettings({
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    this.inputDecoration = const InputDecoration(
      hintText: 'Search',
      contentPadding: EdgeInsets.all(10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    ),
    this.padding = const EdgeInsets.all(8.0),
    this.searchTextStyle,
    this.shape = const RoundedRectangleBorder(),
    this.showFlag = true,
    this.textStyle,
  });

  /// Decoration inside bottom sheet.
  final BoxDecoration decoration;

  /// Decoration of the search input field.
  final InputDecoration inputDecoration;

  /// Padding to apply in bottom sheet children.
  final EdgeInsetsGeometry padding;

  /// Style to apply search text field.
  final TextStyle? searchTextStyle;

  /// Shape border of the bottom sheet.
  final ShapeBorder shape;

  /// Flag image should be displayed.
  final bool showFlag;

  /// Style to apply for all countries list.
  final TextStyle? textStyle;
}


/// [CountryDialCode] class.
class CountryDialCode {
  /// Define a [CountryDialCode] class.
  const CountryDialCode({
    required this.code,
    required this.dialCode,
    required this.flagURI,
    required this.name,
  });

  /// Country ISO 3166-1 Alpha-2 code.
  final String code;

  /// Country dial code.
  final String dialCode;

  /// Country flag URI.
  final String flagURI;

  /// Country name.
  final String name;

  /// Returns a [CountryDialCode] class by ISO 3166 Alpha-2 [countryCode].
  ///
  /// Throw a [CountryNotFoundException] if the country does not exist.
  factory CountryDialCode.fromCountryCode(String countryCode) {
    final Map<String, String> country = dialCodes.firstWhere(
      (code) => code['code'] == countryCode.toUpperCase(),
      orElse: () => {},
    );
    if (country.isEmpty) throw const CountryNotFoundException();
    return CountryDialCode.fromJson(country);
  }

  /// Returns a [CountryDialCode] class by [dialCode].
  ///
  /// Throw a [CountryNotFoundException] if the country does not exist.
  factory CountryDialCode.fromDialCode(String dialCode) {
    final Map<String, String> country = dialCodes.firstWhere(
      (code) => code['dialCode'] == dialCode.toUpperCase(),
      orElse: () => {},
    );
    if (country.isEmpty) throw const CountryNotFoundException();
    return CountryDialCode.fromJson(country);
  }

  /// Returns a [CountryDialCode] from [json] Map.
  factory CountryDialCode.fromJson(Map<String, dynamic> json) {
    return CountryDialCode(
      code: json['code'] as String,
      dialCode: json['dialCode'] as String,
      flagURI: 'assets/flags/${json['code'].toString().toLowerCase()}.png',
      name: json['name'] as String,
    );
  }
}

class FlagImageSettings {
  const FlagImageSettings({
    this.borderRadius = BorderRadius.zero,
    this.circle = false,
    this.circleRadius = 16.0,
    this.height,
    this.width = 32.0,
  });

  /// Radius to apply to the all flag
  ///
  /// Only apply if [circle] is false.
  final BorderRadius borderRadius;

  /// Circle flag, replace rectangle flag by circle flag.
  final bool circle;

  /// Only apply if the [circle] is true.
  final double circleRadius;

  /// Height of the flag.
  final double? height;

  /// Width of the flag.
  final double width;
}


/// Country not found exception if country doesn't exist.
class CountryNotFoundException implements Exception {
  /// Define a [CountryNotFoundException] class.
  const CountryNotFoundException([this.message = 'The country was not found']);

  /// A message describing the error.
  final String message;
}


class CountryDialCodeBottomSheet extends StatefulWidget {
  const CountryDialCodeBottomSheet({
    super.key,
    required this.settings,
  });

  final BottomSheetSettings settings;

  @override
  State<CountryDialCodeBottomSheet> createState() =>
      _CountryDialCodeBottomSheetState();
}

class _CountryDialCodeBottomSheetState
    extends State<CountryDialCodeBottomSheet> {
  final List<CountryDialCode> countries = dialCodes
      .map(
        (json) => CountryDialCode.fromJson(json),
      )
      .toList();
  List<CountryDialCode> filteredCountries = [];

  @override
  void initState() {
    filteredCountries = countries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: widget.settings.decoration,
      child: Padding(
        padding: widget.settings.padding,
        child: Column(
          children: [
            TextField(
              onChanged: _search,
              style: widget.settings.searchTextStyle,
              decoration: widget.settings.inputDecoration,
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredCountries.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: widget.settings.showFlag
                        ? Image.asset(
                            filteredCountries[index].flagURI,
                            //package: 'country_dial_code',
                          )
                        : null,
                    title: Text(
                      filteredCountries[index].dialCode,
                      style: widget.settings.textStyle,
                    ),
                    onTap: () => Navigator.of(context).pop(
                      filteredCountries[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _search(String value) {
    setState(() {
      filteredCountries = countries.where(
        (element) {
          return element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.dialCode.contains(value.toLowerCase());
        },
      ).toList();
    });
  }
}

class CountryDialCodePicker extends StatefulWidget {
  const CountryDialCodePicker({
    super.key,
    this.arrowDropDownColor,
    this.borderRadius = 0.0,
    this.bottomSheetSettings = const BottomSheetSettings(),
    this.flagImageSettings = const FlagImageSettings(),
    this.initialSelection,
    this.onChanged,
    this.padding = const EdgeInsets.all(8.0),
    this.showArrowDropDown = true,
    this.showCountryDialCode = true,
    this.showFlag = true,
    this.textStyle,
  });

  /// Arrow drop down icon color.
  final Color? arrowDropDownColor;

  /// Radius of the button for splash.
  final double borderRadius;

  /// Settings of the button sheet with all countries.
  final BottomSheetSettings bottomSheetSettings;

  /// Flag image settings.
  final FlagImageSettings flagImageSettings;

  /// The country ISO 3166-1 Alpha-2 code for initial selection.
  final String? initialSelection;

  /// Event when user change country code.
  final ValueChanged<CountryDialCode>? onChanged;

  /// Padding to apply around to the button picker.
  final EdgeInsets padding;

  /// Show arrow drop down icon.
  final bool showArrowDropDown;

  /// Show country dial code selected.
  final bool showCountryDialCode;

  /// Show flag inside button picker.
  final bool showFlag;

  /// Style to apply of the country dial codes.
  final TextStyle? textStyle;

  @override
  State<CountryDialCodePicker> createState() {
    return _CountryDialCodePickerState();
  }
}

class _CountryDialCodePickerState extends State<CountryDialCodePicker> {
  CountryDialCode? _countryDialCode;

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_countryDialCode == null) {
      return const Text('');
    }
   final double scale = MediaQuery.maybeOf(context)?.textScaler.scale(1.0) ?? 1.0;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Padding(
      padding: widget.padding,
      child: InkWell(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        onTap: () {
          showModalBottomSheet<CountryDialCode?>(
            context: context,
            shape: widget.bottomSheetSettings.shape,
            builder: (_) {
              return CountryDialCodeBottomSheet(
                settings: widget.bottomSheetSettings,
              );
            },
          ).then((value) {
            if (value != null) {
              widget.onChanged?.call(value);
              setState(() => _countryDialCode = value);
            }
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showFlag && !widget.flagImageSettings.circle)
              ClipRRect(
                borderRadius: widget.flagImageSettings.borderRadius,
                child: Image.asset(
                  _countryDialCode!.flagURI,
                 // package: 'country_dial_code',
                  width: widget.flagImageSettings.width,
                  height: widget.flagImageSettings.height,
                ),
              ),
            if (widget.showFlag && widget.flagImageSettings.circle)
              CircleAvatar(
                backgroundImage: AssetImage(
                  _countryDialCode!.flagURI,
                  package: 'country_dial_code',
                ),
                radius: widget.flagImageSettings.circleRadius,
              ),
            if (widget.showFlag && widget.showCountryDialCode)
              SizedBox(width: gap),
            if (widget.showCountryDialCode)
              Text(
                _countryDialCode!.dialCode,
                style: widget.textStyle,
              ),
            if (widget.showArrowDropDown)
              Icon(Icons.arrow_drop_down, color: widget.arrowDropDownColor),
          ],
        ),
      ),
    );
  }

  void _load() {
    final List<CountryDialCode> countries = dialCodes
        .map(
          (json) => CountryDialCode.fromJson(json),
        )
        .toList();
    if (widget.initialSelection != null) {
      _countryDialCode = countries.firstWhere(
        (element) => element.code == widget.initialSelection,
        orElse: () => countries.first,
      );
    } else {
      _countryDialCode = countries.first;
    }
  }
}