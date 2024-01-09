part of '../../../modules.dart';

/// วิดเจ็ตสาเร็จรูปสำหรับแสดงรายการรับส่ง PO
class PobItem<P extends PoBoardItemData> extends StatefulWidget {
  final P item;
  final Color? backgroundColor;
  final Color? progressBarColor;
  final ShapeBorder? shape;
  final ImageProvider Function(P item)? imageProviderBuilder;
  final ImageProvider Function(P item)? recipientImageProviderBuilder;
  final Widget Function(BuildContext context, Widget child) builder;
  final Widget Function(BuildContext context, Widget child, ImageChunkEvent? loadingProgess)? imageBuilder;
  final Widget Function(BuildContext context, Widget child, ImageChunkEvent? loadingProgess)? recipientImageBuilder;
  final Widget Function(BuildContext context, Duration remainingTime, DateTime expiringDateTime)? countdownTimerBuilder;
  final Widget Function(BuildContext context, bool enabled)? actionBuilder;
  final Widget Function(BuildContext context, String title)? titleBuilder;
  final Widget Function(
    BuildContext context,
    double progressValue,
    double currentRecievingAmount,
    double maximumRecievingAmount,
  )? progressBarBuilder;
  final Widget Function(
    BuildContext context,
    double progressValue,
    double currentRecievingAmount,
    double maximumRecievingAmount,
  )? progressBarTextBuilder;
  final Widget Function(
    BuildContext context,
    double currentRecievingAmount,
    double maximumRecievingAmount,
    String unit,
  )? amountCounterBuilder;
  final Widget Function(
    BuildContext context,
    double pricePerUnit,
    double includedTaxPricePerUnit,
  )? priceTagBuilder;
  final Widget Function(BuildContext context, String unit)? unitAndCurrencyBuilder;
  final Widget Function(BuildContext context, String recipient)? recipientTextBuilder;
  final double? rowSpacing;
  final double? columnSpacing;
  final BorderRadius? imageBorderRadius;
  final TextStyle? titleTextStyle;
  final TextStyle? priceTextStyle;
  final TextStyle? taxPriceTextStyle;
  final TextStyle? progressBarTextStyle;
  final TextStyle? amountCounterTextStyle;
  final TextStyle? recipientTextStyle;
  final String? unitAsText;
  final String? currencyAsText;
  final String? sendToAsText;
  final String? includingVatAsText;

  const PobItem({
    super.key,
    required this.item,
    this.backgroundColor,
    this.progressBarColor,
    this.shape,
    required this.builder,
    this.imageBuilder,
    this.imageBorderRadius,
    this.recipientImageBuilder,
    this.titleBuilder,
    this.imageProviderBuilder,
    this.recipientImageProviderBuilder,
    this.progressBarBuilder,
    this.amountCounterBuilder,
    this.rowSpacing,
    this.columnSpacing,
    this.titleTextStyle,
    this.priceTextStyle,
    this.taxPriceTextStyle,
    this.progressBarTextStyle,
    this.amountCounterTextStyle,
    this.recipientTextStyle,
    this.unitAsText,
    this.currencyAsText,
    this.sendToAsText,
    this.includingVatAsText,
    this.countdownTimerBuilder,
    this.actionBuilder,
    this.priceTagBuilder,
    this.unitAndCurrencyBuilder,
    this.progressBarTextBuilder,
    this.recipientTextBuilder,
  });

  @override
  State<StatefulWidget> createState() => _PoItemState<P>();
}

class _PoItemState<P extends PoBoardItemData> extends State<PobItem<P>> {
  @override
  Widget build(BuildContext context) {
    final progressBarBuilder = widget.progressBarBuilder;

    final child = LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                fit: BoxFit.cover,
                image: widget.imageProviderBuilder?.call(widget.item) ?? NetworkImage(widget.item.image),
                loadingBuilder: (context, child, loadingProgress) =>
                    widget.imageBuilder?.call(context, child, loadingProgress) ??
                    Container(
                      constraints: BoxConstraints.tight(Size.square(constraints.maxWidth * .15)),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: child,
                    ),
              ),
              SizedBox(width: widget.rowSpacing ?? 10),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: widget.titleBuilder?.call(context, widget.item.title) ??
                          Text(
                            widget.item.title,
                            style: widget.titleTextStyle ?? Theme.of(context).textTheme.titleLarge,
                          ),
                    ),
                    const SizedBox(height: 5),
                    if (progressBarBuilder != null)
                      PobAmountCounterListener(
                        widget.item,
                        (context, value) => progressBarBuilder(
                          context,
                          value / widget.item.maximumTotalReceivingAmount,
                          value,
                          widget.item.maximumTotalReceivingAmount,
                        ),
                      )
                    else
                      LayoutBuilder(
                        builder: (context, progressBarConstraints) => ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: progressBarConstraints.maxWidth),
                          child: Material(
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAlias,
                            shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade400)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                    left: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: PobAmountCounterListener(
                                        widget.item,
                                        (context, value) => Container(
                                              decoration: BoxDecoration(color: widget.progressBarColor ?? Colors.green),
                                              width: progressBarConstraints.maxWidth * value / widget.item.maximumTotalReceivingAmount,
                                            ))),
                                PobAmountCounterListener(
                                  widget.item,
                                  (context, value) =>
                                      widget.progressBarTextBuilder?.call(
                                        context,
                                        value / widget.item.maximumTotalReceivingAmount,
                                        value,
                                        widget.item.maximumTotalReceivingAmount,
                                      ) ??
                                      Text(
                                        '$value',
                                        style: widget.progressBarTextStyle ?? Theme.of(context).textTheme.labelLarge,
                                        textAlign: TextAlign.center,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: PobCountdownTimerListener(
                            widget.item,
                            (context, remainingDuration) =>
                                widget.countdownTimerBuilder?.call(context, remainingDuration, widget.item.expiringDateTime) ??
                                Text(
                                  '$remainingDuration',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                          ),
                        ),
                        SizedBox(width: widget.rowSpacing ?? 5),
                        Flexible(
                          child: PobAmountCounterListener(
                              widget.item,
                              (context, value) =>
                                  widget.amountCounterBuilder?.call(
                                    context,
                                    value,
                                    widget.item.maximumTotalReceivingAmount,
                                    widget.item.unit,
                                  ) ??
                                  Text(
                                    '$value/${widget.item.maximumTotalReceivingAmount} ${widget.unitAsText ?? widget.item.unit}',
                                    style: widget.amountCounterTextStyle ?? Theme.of(context).textTheme.labelSmall,
                                  )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: widget.rowSpacing ?? 10),
              Column(
                children: [
                  Row(
                    children: [
                      widget.priceTagBuilder?.call(
                            context,
                            widget.item.pricePerUnit,
                            widget.item.includedTaxPricePerUnit,
                          ) ??
                          Column(
                            children: [
                              Text(
                                '${widget.item.pricePerUnit.toStringAsFixed(2)}${widget.item.includedTaxPricePerUnit > 0 ? '*' : ''}',
                                style: (widget.priceTextStyle ?? Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green))
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              if (widget.item.includedTaxPricePerUnit > 0)
                                Text(
                                  '(${widget.includingVatAsText ?? 'Vat:'} ${widget.item.includedTaxPricePerUnit.toStringAsFixed(2)})',
                                  style: (widget.taxPriceTextStyle ?? Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green)),
                                ),
                            ],
                          ),
                      SizedBox(width: widget.rowSpacing ?? 10),
                      widget.unitAndCurrencyBuilder?.call(context, widget.item.unit) ??
                          Column(
                            children: [
                              Text(
                                widget.currencyAsText ?? '\$',
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ),
                              if (widget.item.includedTaxPricePerUnit > 0)
                                Text(
                                  widget.unitAsText ?? widget.item.unit,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: widget.recipientTextBuilder?.call(context, widget.item.recipient) ??
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: ' ${widget.sendToAsText ?? 'To'}',
                                style: (widget.recipientTextStyle ?? Theme.of(context).textTheme.labelSmall)?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' ${widget.item.recipient}',
                                style: widget.recipientTextStyle ?? Theme.of(context).textTheme.labelSmall,
                              ),
                            ]),
                          ),
                    ),
                    SizedBox(width: widget.rowSpacing ?? 5),
                    Image(
                      fit: BoxFit.cover,
                      image: widget.recipientImageProviderBuilder?.call(widget.item) ?? NetworkImage(widget.item.recipientImage),
                      loadingBuilder: (context, child, loadingProgress) =>
                          widget.recipientImageBuilder?.call(context, child, loadingProgress) ??
                          Container(
                            constraints: BoxConstraints.tight(Size.square(constraints.maxWidth * .025)),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: child,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: widget.rowSpacing ?? 5),
              PobItemAttachedButtonListener(widget.item, (context, enabled) => widget.actionBuilder?.call(context, enabled) ?? const SizedBox()),
            ],
          ),
        ],
      ),
    );
    return Material(
      type: MaterialType.card,
      shape: widget.shape,
      color: widget.backgroundColor,
      child: widget.builder(context, child),
    );
  }
}
