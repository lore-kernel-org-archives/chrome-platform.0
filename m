Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBE023A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65184C4339E;
	Mon, 13 Mar 2023 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700680;
	bh=1YJ/aFxJnduaOgWIQBgiyP8hO979tvs7YeoZ9myLRVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V7rd3eBv5MzWBZmgiYoTHumjmxnUfEla2f/RSujWTpOZWsEjfXsB9qxLqUOuoXVUz
	 wNZr38OUa0LuY30rXt1WFV27/T6sR8n5efW8nriJa7bv2Rnl5lWZSJuB4sTjHpS91q
	 vLPhPBv+RDioWqnUpejx0kBZdgbGpzBIHxG/zwwhnZduwIXYWMA6rmi5L1Mvs4cieQ
	 lHVXZyPRx0oEagWBXnWSXb3SKXMVA37D1FdFcYUswyMKl8R3J/A44p3gZHWaLE4ns6
	 W2m49X2rHrwM1HJuHlDyforeblceiiQCPhsVm+I+4GmwhzObkppdABAG2IorFf7jug
	 2C5DG4aaAZ7TA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 01/14] lava_runner: rename to LavaTestResult
Date: Mon, 13 Mar 2023 17:44:18 +0800
Message-Id: <20230313094431.507952-2-tzungbi@kernel.org>
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

To simplify, rename from LavaTextTestResult to LavaTestResult.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 cros/runners/lava_runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cros/runners/lava_runner.py b/cros/runners/lava_runner.py
index 8a570dda064f..2e8b1c42bdeb 100755
--- a/cros/runners/lava_runner.py
+++ b/cros/runners/lava_runner.py
@@ -13,7 +13,7 @@ from cros.tests.cros_ec_power import *
 from cros.tests.cros_ec_extcon import *
 
 
-class LavaTextTestResult(unittest.TestResult):
+class LavaTestResult(unittest.TestResult):
     def __init__(self, runner):
         unittest.TestResult.__init__(self)
         self.runner = runner
@@ -56,7 +56,7 @@ class LavaTestRunner:
         self.stream.write(message)
 
     def run(self, test):
-        result = LavaTextTestResult(self)
+        result = LavaTestResult(self)
         test(result)
         result.testsRun
         return result
-- 
2.40.0.rc1.284.g88254d51c5-goog

