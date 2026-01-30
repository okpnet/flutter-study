import 'dart:io';

final class HttpServerCallbackEvent {
  String? writeHtmlSource;
  ContentType contentType = ContentType.html;
  HttpServerCallbackEvent({required this.contentType, this.writeHtmlSource});
}
