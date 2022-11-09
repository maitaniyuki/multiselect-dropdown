library multiselect_dropdown;

import 'package:flutter/material.dart';

import 'models/chip_config.dart';
import 'models/value_item.dart';
import 'enum/app_enums.dart';

export 'enum/app_enums.dart';
export 'models/chip_config.dart';
export 'models/value_item.dart';

class MultiSelectDropDown extends StatefulWidget {
  // selection type of the dropdown
  final SelectionType selectionType;

  // Hint
  final String hint;
  final Color? hintColor;
  final double? hintFontSize;
  final TextStyle? hintStyle;

  // Options
  final List<ValueItem> options;
  final List<ValueItem> selectedOptions;
  final List<ValueItem> disabledOptions;

  final Function(List<ValueItem>)? onOptionSelected;

  // selected option
  final Icon? selectedOptionIcon;
  final Color? selectedOptionTextColor;
  final Color? selectedOptionBackgroundColor;
  final Widget Function(BuildContext, ValueItem)? selectedItemBuilder;

  // chip configuration
  final bool showChipInSingleSelectMode;
  final ChipConfig chipConfig;

  // options configuration
  final Color? optionsBackgroundColor;
  final TextStyle? optionTextStyle;
  final Widget? optionSeperator;
  final double dropdownHeight;
  final Widget? optionSeparator;
  final bool alwaysShowOptionIcon;

  // dropdownfield configuration
  final Color? backgroundColor;
  final IconData? suffixIcon;
  final Decoration? inputDecoration;

  // search configuration
  final bool showSearchBox;
  final bool showClearIcon;

  /// MultiSelectDropDown is a widget that allows the user to select multiple options from a list of options. It is a dropdown that allows the user to select multiple options.
  ///
  ///  **Selection Type**
  ///
  ///   [selectionType] is the type of selection that the user can make. The default is [SelectionType.single].
  /// * [SelectionType.single] - allows the user to select only one option.
  /// * [SelectionType.multi] - allows the user to select multiple options.
  ///
  ///  **Options**
  ///
  /// [options] is the list of options that the user can select from. The options need to be of type [ValueItem].
  ///
  /// [selectedOptions] is the list of options that are pre-selected when the widget is first displayed. The options need to be of type [ValueItem].
  ///
  /// [disabledOptions] is the list of options that the user cannot select. The options need to be of type [ValueItem]. If the items in this list are not available in options, will be ignored.
  ///
  /// [onOptionSelected] is the callback that is called when an option is selected or unselected. The callback takes one argument of type `List<ValueItem>`.
  ///
  /// **Selected Option**
  ///
  /// [selectedOptionIcon] is the icon that is used to indicate the selected option.
  ///
  /// [selectedOptionTextColor] is the color of the selected option.
  ///
  /// [selectedOptionBackgroundColor] is the background color of the selected option.
  ///
  /// [selectedItemBuilder] is the builder that is used to build the selected option. If this is not provided, the default builder is used.
  ///
  /// **Chip Configuration**
  ///
  /// [showChipInSingleSelectMode] is used to show the chip in single select mode. The default is false.
  ///
  /// [chipConfig] is the configuration for the chip.
  ///
  /// **Options Configuration**
  ///
  /// [optionsBackgroundColor] is the background color of the options. The default is [Colors.white].
  ///
  /// [optionTextStyle] is the text style of the options.
  ///
  /// [optionSeperator] is the seperator between the options.
  ///
  /// [dropdownHeight] is the height of the dropdown options. The default is 200.
  ///
  ///  **Dropdown Configuration**
  ///
  /// [backgroundColor] is the background color of the dropdown. The default is [Colors.white].
  ///
  /// [suffixIcon] is the icon that is used to indicate the dropdown. The default is [Icons.arrow_drop_down].
  ///
  /// [inputDecoration] is the decoration of the dropdown.
  ///
  /// [dropdownHeight] is the height of the dropdown. The default is 200.
  ///
  ///  **Hint**
  ///
  /// [hint] is the hint text to be displayed when no option is selected.
  ///
  /// [hintColor] is the color of the hint text. The default is [Colors.grey.shade300].
  ///
  /// [hintFontSize] is the font size of the hint text. The default is 14.0.
  ///
  /// [hintStyle] is the style of the hint text.
  ///
  ///  **Example**
  ///
  /// ```dart
  ///  final List<ValueItem> options = [
  ///     ValueItem(label: 'Option 1', value: '1'),
  ///     ValueItem(label: 'Option 2', value: '2'),
  ///     ValueItem(label: 'Option 3', value: '3'),
  ///   ];
  ///
  ///   final List<ValueItem> selectedOptions = [
  ///     ValueItem(label: 'Option 1', value: '1'),
  ///   ];
  ///
  ///   final List<ValueItem> disabledOptions = [
  ///     ValueItem(label: 'Option 2', value: '2'),
  ///   ];
  ///
  ///  MultiSelectDropDown(
  ///    onOptionSelected: (option) {},
  ///    options: const <ValueItem>[
  ///       ValueItem(label: 'Option 1', value: '1'),
  ///       ValueItem(label: 'Option 2', value: '2'),
  ///       ValueItem(label: 'Option 3', value: '3'),
  ///       ValueItem(label: 'Option 4', value: '4'),
  ///       ValueItem(label: 'Option 5', value: '5'),
  ///       ValueItem(label: 'Option 6', value: '6'),
  ///    ],
  ///    selectionType: SelectionType.multi,
  ///    selectedOptions: selectedOptions,
  ///    disabledOptions: disabledOptions,
  ///    onOptionSelected: (List<ValueItem> selectedOptions) {
  ///      debugPrint('onOptionSelected: $option');
  ///    },
  ///    chipConfig: const ChipConfig(wrapType: WrapType.scroll),
  ///    );
  /// ```

  const MultiSelectDropDown({
    Key? key,
    required this.onOptionSelected,
    required this.options,
    this.selectedOptionTextColor,
    this.optionSeperator,
    this.chipConfig = const ChipConfig(),
    this.selectionType = SelectionType.multi,
    this.hint = 'Select',
    this.hintColor = Colors.grey,
    this.hintFontSize = 14.0,
    this.selectedOptions = const [],
    this.disabledOptions = const [],
    this.alwaysShowOptionIcon = false,
    this.optionTextStyle,
    this.selectedOptionIcon = const Icon(Icons.check),
    this.selectedOptionBackgroundColor,
    this.optionsBackgroundColor,
    this.backgroundColor = Colors.white,
    this.dropdownHeight = 200,
    this.showChipInSingleSelectMode = false,
    this.suffixIcon = Icons.arrow_drop_down,
    this.selectedItemBuilder,
    this.optionSeparator,
    this.inputDecoration,
    this.hintStyle,
  })  : showSearchBox = false,
        showClearIcon = false,
        super(key: key);

  const MultiSelectDropDown.search(
      {Key? key,
      required this.onOptionSelected,
      required this.options,
      this.selectedOptionTextColor,
      this.optionSeperator,
      this.chipConfig = const ChipConfig(),
      this.selectionType = SelectionType.multi,
      this.hint = 'Select',
      this.hintColor = Colors.grey,
      this.hintFontSize = 14.0,
      this.selectedOptions = const [],
      this.disabledOptions = const [],
      this.alwaysShowOptionIcon = false,
      this.optionTextStyle,
      this.selectedOptionIcon = const Icon(Icons.check),
      this.selectedOptionBackgroundColor,
      this.optionsBackgroundColor,
      this.backgroundColor = Colors.white,
      this.dropdownHeight = 200,
      this.showChipInSingleSelectMode = false,
      this.suffixIcon = Icons.arrow_drop_down,
      this.selectedItemBuilder,
      this.optionSeparator,
      this.inputDecoration,
      this.hintStyle})
      : showSearchBox = true,
        showClearIcon = true,
        super(key: key);

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  final List<ValueItem> _options = [];
  final List<ValueItem> _selectedOptions = [];
  final List<ValueItem> _disabledOptions = [];

  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  StateSetter? _dropdownStateSetter;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  bool _selectionMode = false;
  final FocusNode _focusNode = FocusNode();

  /// The [_layerlink] is used to link the dropdown to the dropdown field.
  final LayerLink _layerLink = LayerLink();

  final _noResultItem =
      const ValueItem(label: 'No results found', value: 'No results found');

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    _options.addAll(widget.options);
    _selectedOptions.addAll(widget.selectedOptions);
    _disabledOptions.addAll(widget.disabledOptions);

    _overlayState ??= Overlay.of(context);
    _focusNode.addListener(_handleFocusChange);
  }

  _handleFocusChange() {
    if (_focusNode.hasFocus) {
      _overlayEntry = _buildOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
      setState(() {
        _selectionMode = true;
      });
    } else {
      _overlayEntry?.remove();
      setState(() {
        _selectionMode = false;
        _dropdownStateSetter = null;
        if (widget.showSearchBox) {
          _searchController.clear();
        }
        _searchText = '';
      });
    }
  }

  @override
  void didUpdateWidget(covariant MultiSelectDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.options != oldWidget.options) {
      _options.clear();
      _options.addAll(widget.options);
    }

    if (widget.selectedOptions != oldWidget.selectedOptions) {
      _selectedOptions.clear();
      _selectedOptions.addAll(widget.selectedOptions);
    }

    if (widget.disabledOptions != oldWidget.disabledOptions) {
      _disabledOptions.clear();
      _disabledOptions.addAll(widget.disabledOptions);
    }
  }

  /// Calculate the size of the dropdownfield and the height of the dropdown options.
  List _calculateOffsetSize() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    var size = renderBox?.size ?? Size.zero;
    var offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

    final availableHeight = MediaQuery.of(context).size.height - offset.dy;

    if (availableHeight < widget.dropdownHeight) {
      offset = Offset(offset.dx,
          offset.dy - (widget.dropdownHeight - availableHeight + 40));
    }
    return [size, offset];
  }

  /// build the overlay entry for the dropdown.
  OverlayEntry _buildOverlayEntry() {
    final values = _calculateOffsetSize();
    final size = values[0] as Size;
    final offset = values[1] as Offset;

    return OverlayEntry(builder: (context) {
      List<ValueItem> options = _options;
      List<ValueItem> selectedOptions = [..._selectedOptions];
      String searchText = _searchText;
      if (searchText.isNotEmpty) {
        options = options
            .where((option) =>
                option.label.toLowerCase().contains(searchText.toLowerCase()))
            .toList();

        if (options.isEmpty) {
          options.add(_noResultItem);
        }
      }

      return StatefulBuilder(
        builder: ((context, dropdownState) {
          _dropdownStateSetter = dropdownState;
          return Stack(
            children: [
              Positioned.fill(
                  child: GestureDetector(
                onTap: _onOutSideTap,
                child: Container(
                  color: Colors.transparent,
                ),
              )),
              Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 5.0,
                width: size.width,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0.0, size.height + 5.0),
                  child: Material(
                    elevation: 4,
                    child: Container(
                      constraints: BoxConstraints.loose(
                          Size(size.width, widget.dropdownHeight)),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return widget.optionSeparator ??
                              const SizedBox(height: 0);
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final option = options[index];
                          final isSelected = selectedOptions.contains(option);
                          final primaryColor = Theme.of(context).primaryColor;
                          final enabled = !_disabledOptions.contains(option) &&
                              option != _noResultItem;

                          return ListTile(
                              title: Text(
                                option.label,
                                style: widget.optionTextStyle ??
                                    TextStyle(
                                      color: isSelected
                                          ? widget.selectedOptionTextColor ??
                                              primaryColor
                                          : Colors.black,
                                      fontSize: widget.hintFontSize,
                                    ),
                              ),
                              selected: isSelected,
                              tileColor:
                                  widget.optionsBackgroundColor ?? Colors.white,
                              selectedTileColor:
                                  widget.selectedOptionBackgroundColor ??
                                      Colors.grey.shade200,
                              enabled: enabled,
                              onTap: () {
                                if (widget.selectionType ==
                                    SelectionType.multi) {
                                  if (isSelected) {
                                    dropdownState(() {
                                      selectedOptions.remove(option);
                                    });
                                  } else {
                                    dropdownState(() {
                                      selectedOptions.add(option);
                                    });
                                  }

                                  if (isSelected) {
                                    setState(() {
                                      _selectedOptions.remove(option);
                                    });
                                  } else {
                                    setState(() {
                                      _selectedOptions.add(option);
                                    });
                                  }
                                } else {
                                  dropdownState(() {
                                    selectedOptions.clear();
                                    selectedOptions.add(option);
                                  });
                                  setState(() {
                                    _selectedOptions.clear();
                                    _selectedOptions.add(option);
                                  });
                                  _focusNode.unfocus();
                                }
                              },
                              trailing:
                                  _getSelectedIcon(isSelected, primaryColor));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Focus(
        canRequestFocus: true,
        skipTraversal: true,
        focusNode: _focusNode,
        child: GestureDetector(
          onTap: () {
            _toggleFocus();
          },
          child: Container(
            height: widget.chipConfig.wrapType == WrapType.wrap ? null : 52,
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 52,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            decoration: _getContainerDecoration(),
            child: Row(
              children: [
                Expanded(
                  child: _getContainerContent(),
                ),
                AnimatedRotation(
                    turns: _selectionMode ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      widget.suffixIcon,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Get the Content for the dropdown field container.
  Widget _getContainerContent() {
    if (widget.showSearchBox) {
      return SizedBox(
        height: 48,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!_selectionMode)
              _buildSelectedItems(
                forceScroll: true,
              ),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: _selectedOptions.isNotEmpty ? '' : widget.hint,
                isDense: true,
                hintStyle: widget.hintStyle,
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: widget.selectedOptionTextColor ?? Colors.black,
                fontSize: widget.hintFontSize,
              ),
              onChanged: (value) {
                _searchOptions(value);
              },
            ),
          ],
        ),
      );
    }

    if (_selectedOptions.isEmpty) {
      return HintText(
        hintText: widget.hint,
        hintColor: widget.hintColor,
        hintStyle: widget.hintStyle,
      );
    }

    if (widget.selectionType == SelectionType.single &&
        !widget.showChipInSingleSelectMode) {
      return SingleSelectedItem(label: _selectedOptions.first.label);
    }

    return _buildSelectedItems();
  }

  /// Get the decoration for the dropdown field container.
  Decoration _getContainerDecoration() {
    return widget.inputDecoration ??
        BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
            width: 0.4,
          ),
        );
  }

  /// dispose the focus node and overlay entry.
  @override
  void dispose() {
    if (_overlayState != null && _overlayEntry != null) {
      _overlayEntry?.remove();
    }
    _focusNode.dispose();
    super.dispose();
  }

  /// build the selected items according to the wrap type.
  Widget _buildSelectedItems({bool forceScroll = false}) {
    if (forceScroll || widget.chipConfig.wrapType == WrapType.scroll) {
      return ListView.separated(
        separatorBuilder: (context, index) =>
            _getChipSeparator(widget.chipConfig),
        scrollDirection: Axis.horizontal,
        itemCount: _selectedOptions.length,
        itemBuilder: (context, index) {
          final option = _selectedOptions[index];
          if (widget.selectedItemBuilder != null) {
            return widget.selectedItemBuilder!(context, option);
          }
          return _buildChip(option, widget.chipConfig);
        },
      );
    }
    return Wrap(
        spacing: widget.chipConfig.spacing,
        runSpacing: widget.chipConfig.runSpacing,
        children: mapIndexed(_selectedOptions, (index, item) {
          if (widget.selectedItemBuilder != null) {
            return widget.selectedItemBuilder!(
                context, _selectedOptions[index]);
          }
          return _buildChip(_selectedOptions[index], widget.chipConfig);
        }).toList());
  }

  /// util method to for mapping and indexing the selected options.
  Iterable<E> mapIndexed<E, T>(
      Iterable<T> items, E Function(int index, T item) f) sync* {
    var index = 0;

    for (final item in items) {
      yield f(index, item);
      index = index + 1;
    }
  }

  /// build the chip separator according to the config.
  Widget _getChipSeparator(ChipConfig chipConfig) {
    if (chipConfig.separator != null) {
      return chipConfig.separator!;
    }

    return SizedBox(
      width: chipConfig.spacing,
    );
  }

  /// method to remove dropdown overlay on tap outside.
  void _onOutSideTap() {
    _focusNode.unfocus();
  }

  /// build the chip according to the config.
  Widget _buildChip(ValueItem item, ChipConfig chipConfig) {
    return SelectionChip(
      item: item,
      chipConfig: chipConfig,
      onItemDelete: (removedItem) {
        setState(() {
          _selectedOptions.remove(removedItem);
        });
        _focusNode.unfocus();
      },
    );
  }

  /// toggle the focus on the field.
  void _toggleFocus() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    } else {
      _focusNode.requestFocus();
    }
  }

  /// get the selected icon for the chip.
  Widget? _getSelectedIcon(bool isSelected, Color primaryColor) {
    if (isSelected) {
      return widget.selectedOptionIcon ??
          Icon(
            Icons.check,
            color: primaryColor,
          );
    }
    if (!widget.alwaysShowOptionIcon) {
      return null;
    }

    final Icon icon = widget.selectedOptionIcon ??
        Icon(
          Icons.check,
          color: widget.optionTextStyle?.color ?? Colors.grey,
        );

    return icon;
  }

  /// search the options for the search text.
  /// if the search text is empty then show all the options.
  void _searchOptions(String searchText) {
    if (_dropdownStateSetter != null) {
      _dropdownStateSetter!(() {
        _searchText = searchText;
      });
    }
  }
}

/// A chip widget for the selected item.
/// It can be configured with the chipConfig.
class SelectionChip extends StatelessWidget {
  final ChipConfig chipConfig;
  final Function(ValueItem) onItemDelete;
  final ValueItem item;

  const SelectionChip({
    Key? key,
    required this.chipConfig,
    required this.item,
    required this.onItemDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: chipConfig.padding,
      label: Text(item.label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(chipConfig.radius),
      ),
      deleteIcon: chipConfig.deleteIcon,
      deleteIconColor: chipConfig.deleteIconColor,
      labelPadding: chipConfig.labelPadding,
      backgroundColor:
          chipConfig.backgroundColor ?? Theme.of(context).primaryColor,
      labelStyle: chipConfig.labelStyle ??
          TextStyle(color: chipConfig.labelColor, fontSize: 14),
      onDeleted: () => onItemDelete(item),
    );
  }
}

/// Hint text widget for the dropdown field.
class HintText extends StatelessWidget {
  final TextStyle? hintStyle;
  final String hintText;
  final Color? hintColor;

  const HintText({
    Key? key,
    this.hintStyle,
    required this.hintText,
    this.hintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        hintText,
        style: hintStyle ??
            TextStyle(
              fontSize: 13,
              color: hintColor ?? Colors.grey.shade300,
            ),
      ),
    );
  }
}

/// Single selected item widget for the dropdown field.
class SingleSelectedItem extends StatelessWidget {
  final String label;
  const SingleSelectedItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
