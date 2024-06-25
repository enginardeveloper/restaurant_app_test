import 'package:logger/logger.dart';
import 'dart:developer' as developer;
import '../log_service.dart';

class DebugLogServiceImpl extends LogService {

  late final Logger _logger;

  DebugLogServiceImpl({Logger? logger}) {
    _logger = logger ??
    Logger(
      printer: PrefixPrinter(
        PrettyPrinter(
          /// Controls the method count in stack traces when no LogEvent.error was provided.
          methodCount: 0,
          /// Controls the method count in stack traces when LogEvent.error was provided.
          errorMethodCount: 500,
          /// Controls the length of the divider lines.
          lineLength: 100,
        ),
      ),
      output: _MyConsoleOutput(),
    );
  }

  @override
  void e(String message, e, StackTrace? stack) {
    _logger.e(message, e, stack);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }

  @override
  void w(String message, [e, StackTrace? stack]) {
    _logger.w(message, e, stack);
  }

}

class _MyConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    /// Emit a log event.
    // This function was designed to map closely to the logging information collected by package:logging.
    event.lines.forEach(developer.log);
  }

}