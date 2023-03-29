String formatToRupiah(num amount) {
  String rupiah = 'Rp ';
  String amountStr = amount.toString();
  int length = amountStr.length;

  for (int i = 0; i < length; i++) {
    if ((length - i) % 3 == 0 && i != 0) {
      rupiah += '.';
    }
    rupiah += amountStr[i];
  }

  return rupiah += ',-';
}
