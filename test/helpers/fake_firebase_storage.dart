import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mockito/mockito.dart';

class FakeReference extends Fake implements Reference {
  @override
  Future<String> getDownloadURL() {
    return Future.value('url');
  }

  @override
  UploadTask putData(Uint8List data, [SettableMetadata? metadata]) {
    return FakeUploadTask();
  }
}

class FakeUploadTask extends Fake implements UploadTask {
  @override
  Future<S> then<S>(FutureOr<S> Function(TaskSnapshot p1) onValue,
      {Function? onError}) {
    return Future.value(onValue(FakeTaskSnapshot()));
  }
}

class FakeTaskSnapshot extends Fake implements TaskSnapshot {}

class FakeFirebaseStorage extends Fake implements FirebaseStorage {
  @override
  Reference ref([String? path]) {
    return FakeReference();
  }
}
