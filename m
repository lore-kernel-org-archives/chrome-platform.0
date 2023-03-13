Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24F23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BF2C433A0;
	Mon, 13 Mar 2023 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700682;
	bh=7Ud0iz+jD0RCvRNaZ5p6F4jFZT8VE/n4iw3+XZ+5Lek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d/zHS+/W7LLr67m5Jt8wKUXuVjY+jO2fEu40Xz7tOzWzmE4MwlHLtIlezYDUegOww
	 RZo1BOpNQD3UnSDgbu9Mqw2lIs9mHXrqSh/fs+cq+GQGO4Qt8zDw8MKsy6/f8nyhW3
	 UmHfY+6ffSxGiBVxxlbwXZMpMmuvBrFFTyHB7LGe9K7KasNSlW9OzR55fRcwDauWLE
	 DmzpLVgY7G8id1Soixkq8sozzRHiXzhhyA1HxXtdniA9+fO1WY+TgZusdI5c34V2St
	 cr/0DJPITmaVt/cK4NPifAVihLtXjexvRuqoMiFuzFhqpePsZauiGLoo8wOMKA0jSo
	 2+DJQjwqo7UXw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 02/14] lava_runner: use TextTestRunner
Date: Mon, 13 Mar 2023 17:44:19 +0800
Message-Id: <20230313094431.507952-3-tzungbi@kernel.org>
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

To simplify, eliminate LavaTestRunner but use TextTestRunner directly.
Also change the constructor of LavaTestResult per [1].

As a side-effect result, it starts to show the following summary:

> Ran 18 tests in 0.010s
>
> FAILED (failures=1, errors=3, skipped=10)

[1]: https://docs.python.org/3/library/unittest.html#unittest.TextTestRunner._makeResult

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/runners/lava_runner.py | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/cros/runners/lava_runner.py b/cros/runners/lava_runner.py
index 2e8b1c42bdeb..7524f65dcd39 100755
--- a/cros/runners/lava_runner.py
+++ b/cros/runners/lava_runner.py
@@ -14,57 +14,42 @@ from cros.tests.cros_ec_extcon import *
 
 
 class LavaTestResult(unittest.TestResult):
-    def __init__(self, runner):
+    def __init__(self, stream, descriptions, verbosity):
         unittest.TestResult.__init__(self)
-        self.runner = runner
+        self.stream = stream
 
     def addSuccess(self, test):
         unittest.TestResult.addSuccess(self, test)
-        self.runner.writeUpdate(
+        self.stream.write(
             "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=pass>\n"
             % test.id().rsplit(".")[-1]
         )
 
     def addError(self, test, err):
         unittest.TestResult.addError(self, test, err)
-        self.runner.writeUpdate(
+        self.stream.write(
             "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=unknown>\n"
             % test.id().rsplit(".")[-1]
         )
 
     def addFailure(self, test, err):
         unittest.TestResult.addFailure(self, test, err)
-        self.runner.writeUpdate(
+        self.stream.write(
             "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=fail>\n"
             % test.id().rsplit(".")[-1]
         )
 
     def addSkip(self, test, reason):
         unittest.TestResult.addSkip(self, test, reason)
-        self.runner.writeUpdate(
+        self.stream.write(
             "<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=%s RESULT=skip>\n"
             % test.id().rsplit(".")[-1]
         )
 
 
-class LavaTestRunner:
-    def __init__(self, stream=sys.stderr, verbosity=0):
-        self.stream = stream
-        self.verbosity = verbosity
-
-    def writeUpdate(self, message):
-        self.stream.write(message)
-
-    def run(self, test):
-        result = LavaTestResult(self)
-        test(result)
-        result.testsRun
-        return result
-
-
 if __name__ == "__main__":
     unittest.main(
-        testRunner=LavaTestRunner(),
+        testRunner=unittest.TextTestRunner(resultclass=LavaTestResult),
         # these make sure that some options that are not applicable
         # remain hidden from the help menu.
         failfast=False,
-- 
2.40.0.rc1.284.g88254d51c5-goog

