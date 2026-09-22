/// Skraca tekst dłuższy niż [maxChars] i dopisuje wielokropek.
String truncateWithEllipsis(String text, int maxChars) =>
    text.length > maxChars ? '${text.substring(0, maxChars)}…' : text;
