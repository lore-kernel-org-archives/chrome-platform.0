Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B803123A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F4DC4339B;
	Mon, 13 Mar 2023 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700683;
	bh=lsj9O+XAxKbTWvzEW4OmUuQ0/1vEqxmXyH6TvL73pdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJJbpmcIYOLSgYtpt/E0Z3LeWmum1Be+49o5imE8Mbmz6ZEi+M387kgWgbuADKYw4
	 30F1fLCz2Xq4W0SzuQdLl8qGH71Ip+QwgOfrteuydLH/C5Or0gCh4BNubsY5oDTKYR
	 DyiWTmuGX2FX+jzwDrBzQLmhOaWQPT1/uvuKO6x+eD/XdAeSbRDXKQytnpdiL3R4om
	 fmysPHDKEor4IaixndYJwmkEpMEvgcMmaY9NiOwwgyd3zN1hHXTTiVi/E6AeDivxhf
	 6Bm0qwqWmJ8P+BY/7BhAu5GgNcMsCmlg1kdCIJIJcRpqL8mXIjKM6GkC7QCIj6bCxC
	 vV1HCLQpxHcig==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 03/14] lava_runner: use TextTestResult
Date: Mon, 13 Mar 2023 17:44:20 +0800
Message-Id: <20230313094431.507952-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230313094431.507952-1-tzungbi@kernel.org>
References: <20230313094431.507952-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To simplify, make LavaTestResult is-a TextTestResult.

As a side-effect result, it prints errors and fails by the end of test
running.  See [1].

[1]: https://github.com/python/cpython/blob/main/Lib/unittest/runner.py#L139

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/runners/lava_runner.py | 44 +++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/cros/runners/lava_runner.py b/cros/runners/lava_runner.py
index 7524f65dcd39..70f8aa61132e 100755
--- a/cros/runners/lava_runner.py
+++ b/cros/runners/lava_runner.py
@@ -13,38 +13,34 @@ from cros.tests.cros_ec_power import *
 from cros.tests.cros_ec_extcon import *
 
 
-class LavaTestResult(unittest.TestResult):
-    def __init__(self, stream, descriptions, verbosity):
-        unittest.TestResult.__init__(self)
-        self.stream = stream
+class LavaTestResult(unittest.TextTestResult):
+    def writeLavaSignal(self, test, result):
+        test_case_id = test.id().rsplit(".")[-1]
 
-    def addSuccess(self, test):
-        unittest.TestResult.addSuccess(self, test)
-        self.stream.write(
-            "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=pass>\n"
-            % test.id().rsplit(".")[-1]
+        # LAVA signal must be start-of-line.  Print a newline if verbosity >= 1.
+        if self.showAll or self.dots:
+            self.stream.writeln()
+
+        self.stream.writeln(
+            f"<LAVA_SIGNAL_TESTCASE TEST_CASE_ID={test_case_id} RESULT={result}>"
         )
+        self.stream.flush()
+
+    def addSuccess(self, test):
+        super().addSuccess(test)
+        self.writeLavaSignal(test, "pass")
 
     def addError(self, test, err):
-        unittest.TestResult.addError(self, test, err)
-        self.stream.write(
-            "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=unknown>\n"
-            % test.id().rsplit(".")[-1]
-        )
+        super().addError(test, err)
+        self.writeLavaSignal(test, "unknown")
 
     def addFailure(self, test, err):
-        unittest.TestResult.addFailure(self, test, err)
-        self.stream.write(
-            "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=fail>\n"
-            % test.id().rsplit(".")[-1]
-        )
+        super().addFailure(test, err)
+        self.writeLavaSignal(test, "fail")
 
     def addSkip(self, test, reason):
-        unittest.TestResult.addSkip(self, test, reason)
-        self.stream.write(
-            "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=skip>\n"
-            % test.id().rsplit(".")[-1]
-        )
+        super().addSkip(test, reason)
+        self.writeLavaSignal(test, "skip")
 
 
 if __name__ == "__main__":
-- 
2.40.0.rc1.284.g88254d51c5-goog

