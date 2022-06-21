class Transaksi {
  int? id;
  String? invoiceNumber;
  int? accountId;
  int? businesId;
  String? transationDate;
  String? description;
  int? amountDebit;
  int? amountCredit;

  Transaksi(
      {this.id,
      this.invoiceNumber,
      this.accountId,
      this.businesId,
      this.transationDate,
      this.amountCredit,
      this.amountDebit,
      this.description});

  Transaksi.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        invoiceNumber =
            json.containsKey("invoice_number") ? json["invoice_number"] : null,
        accountId = json.containsKey("account_id") ? json["account_id"] : null,
        businesId =
            json.containsKey("business_id") ? json["business_id"] : null,
        transationDate = json.containsKey("transaction_date")
            ? json["transaction_date"]
            : null,
        description =
            json.containsKey("description") ? json["description"] : null,
        amountDebit =
            json.containsKey("amount_debit") ? json["amount_debit"] : null,
        amountCredit =
            json.containsKey("amount_credit") ? json["amount_credit"] : null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_number": invoiceNumber,
        "account_id": accountId,
        "business_id": businesId,
        "transaction_date": transationDate,
        "description": description,
        "amount_debit": amountDebit,
        "amount_credit": amountCredit
      };
}
