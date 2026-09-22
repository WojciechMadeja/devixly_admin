import 'dart:math' as math;

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

export 'package:data_table_2/data_table_2.dart' show DataColumn2;

/// Tabela panelu — odpowiednik `FlutterFlowDataTable`: granatowy nagłówek,
/// wiersze na przemian białe i szare, białe linie między wierszami,
/// zaokrąglone rogi i opcjonalna paginacja.
class AppDataTable<T> extends StatefulWidget {
  const AppDataTable({
    super.key,
    required this.rows,
    required this.columns,
    required this.rowBuilder,
    required this.height,
    this.paginated = false,
    this.columnSpacing = 20,
  });

  final List<T> rows;
  final List<DataColumn> columns;

  /// Buduje komórki wiersza (bez kolorowania — o to dba tabela).
  final List<Widget> Function(T row, int index) rowBuilder;
  final double height;
  final bool paginated;
  final double columnSpacing;

  static const _headingHeight = 56.0;
  static const _rowHeight = 48.0;
  static const _horizontalMargin = 48.0;

  /// Styl nagłówka kolumny.
  static final headerStyle = AppTextStyles.bodySemiBold.copyWith(
    color: AppColors.secondaryBackground,
  );

  @override
  State<AppDataTable<T>> createState() => _AppDataTableState<T>();
}

class _AppDataTableState<T> extends State<AppDataTable<T>> {
  late final _source = _AppDataTableSource<T>(widget.rows, _buildRow);

  @override
  void initState() {
    super.initState();
    dataTableShowLogs = false;
  }

  @override
  void didUpdateWidget(covariant AppDataTable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _source.update(widget.rows);
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  DataRow _buildRow(T row, int index) => DataRow(
        color: WidgetStatePropertyAll(
          index.isEven
              ? AppColors.secondaryBackground
              : AppColors.primaryBackground,
        ),
        cells: [
          for (final cell in widget.rowBuilder(row, index)) DataCell(cell),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final fixedColumnsWidth = widget.columns
        .whereType<DataColumn2>()
        .where((column) => column.fixedWidth != null)
        .fold(AppDataTable._horizontalMargin + 1,
            (sum, c) => sum + c.fixedWidth!);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: widget.height,
        child: PaginatedDataTable2(
          source: _source,
          // Z paginacją: 5 wierszy na stronę (10 dla dłuższych list) — jak
          // w wersji FlutterFlow. Bez paginacji: wszystkie wiersze naraz.
          rowsPerPage: widget.paginated
              ? (widget.rows.length > 5 ? 10 : 5)
              : math.max(widget.rows.length, 1),
          availableRowsPerPage: const [5, 10, 25, 50, 100],
          onRowsPerPageChanged: widget.paginated ? (_) {} : null,
          columns: widget.columns,
          columnSpacing: widget.columnSpacing,
          hidePaginator: !widget.paginated,
          wrapInCard: false,
          renderEmptyRowsInTheEnd: false,
          border: const TableBorder(
            horizontalInside: BorderSide(color: AppColors.secondaryBackground),
          ),
          dividerThickness: 0,
          headingRowColor: const WidgetStatePropertyAll(AppColors.primary),
          headingRowHeight: AppDataTable._headingHeight,
          dataRowHeight: AppDataTable._rowHeight,
          minWidth: fixedColumnsWidth,
        ),
      ),
    );
  }
}

class _AppDataTableSource<T> extends DataTableSource {
  _AppDataTableSource(this._rows, this._buildRow);

  List<T> _rows;
  final DataRow Function(T row, int index) _buildRow;

  void update(List<T> rows) {
    _rows = rows;
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final row = _rows.elementAtOrNull(index);
    return row == null ? null : _buildRow(row, index);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _rows.length;

  @override
  int get selectedRowCount => 0;
}
