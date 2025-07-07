const ddMMyyyyDot = 'dd.MM.yyyy';
const ddMMyyyySlash = 'dd/MM/yyyy';
const ddMMyyyyHHmmSlash = 'dd/MM/yyyy HH:mm';
const ddMMyyyyDash = 'dd-MM-yyyy';
const hhmm = 'hh:mm';
const hhmma = 'hh:mm a';

const Map<String, String> dateFormatToMask = {
  ddMMyyyyDot: '##.##.####',
  ddMMyyyySlash: '##/##/####',
  ddMMyyyyHHmmSlash: '##/##/#### ##:##',
  ddMMyyyyDash: '##-##-####',
  hhmm: '##:##',
};
