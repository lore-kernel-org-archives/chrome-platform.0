Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85F76AC0
	for <chrome-platform@lists.linux.dev>; Tue,  3 Oct 2023 08:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47619C433C8;
	Tue,  3 Oct 2023 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696320298;
	bh=WDAY3SiNIjP7S/QBDFZHxolwBYfBLTlBTAnghRllNbc=;
	h=From:To:Cc:Subject:Date:From;
	b=HaNTwN3JTFPsdsYcUU+tnUBiBnLeoiiHDqEYiBGMS/FDRQ0IfiGWlVlGgDMMGoGpa
	 yCMaoy8+dYGCL1nO+08dJdKJSDW3HttJ3MxEVXieEmiC7MbtSitaR6pnMt6ZhvK/8q
	 1KKg+1Ffj1mKcZxTViSNYxvnW4z314Ef1Fv9fcvlHbU195mFsHcX2GIuaghyceYYfc
	 jnpws67iwvKtD6Llizhk+NV6CVYkYrhpxXdzSwf+B+TNJrCu78iG5lm9cjLwpiiLXX
	 KpmFt7Af3Cwoekl61bCgf4f0kaUE3tninLk1DBfXCacdJ+7nXfnmGwHDUCykbCFI28
	 h7/yebiNXa/+Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: cros_ec: fix compilation warning
Date: Tue,  3 Oct 2023 08:04:53 +0000
Message-ID: <20231003080453.4011301-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When including cros_ec.h solely, the compiler emits the following
warning:
> 'struct cros_ec_device' declared inside parameter list
  will not be visible outside of this definition or declaration

Fix it by forward declaration.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec.h b/drivers/platform/chrome/cros_ec.h
index bbca0096868a..2b2574236030 100644
--- a/drivers/platform/chrome/cros_ec.h
+++ b/drivers/platform/chrome/cros_ec.h
@@ -10,6 +10,8 @@
 
 #include <linux/interrupt.h>
 
+struct cros_ec_device;
+
 int cros_ec_register(struct cros_ec_device *ec_dev);
 void cros_ec_unregister(struct cros_ec_device *ec_dev);
 
-- 
2.42.0.582.g8ccd20d70d-goog

