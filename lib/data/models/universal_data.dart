class UniversalData {
  UniversalData({
    this.error = "",
    this.data,
  });

  dynamic data;
  String error;
}

class UniversalDataForDaly {
  UniversalDataForDaly({
    this.error = "",
    this.data,
    this.statusCode = 0,
  });

  dynamic data;
  String error;
  int statusCode;
}
