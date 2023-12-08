class FilePathParser {
  ///Returns the filename without extension from a path
  static String getFilenameWithoutExtension(String path) {
    return path.split('.').first;
  }

  ///Returns the filename with extension from a path
  static String getFilename(String path) {
    return path.split('/').last;
  }

  ///Returns the path without filename from a path
  ///Example: lib/src/utils/filename_parser.dart -> lib/src/utils
  static String getPathWithoutFilename(String path) {
    if (path.contains('.')) {
      return path.split('/').sublist(0, path.split('/').length - 1).join('/');
    }
    return path;
  }
}
