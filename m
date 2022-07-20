Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF71FBE
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 04:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD874C341D1;
	Wed, 20 Jul 2022 04:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658292501;
	bh=MQmWDTYK713udR85SfxG0qf+q0PEz6wjgJkPztpfJms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKj3ajWncKPkBVXf+fv0MjqWFeg5uD0cyccDsjnsJR2HDbcFj4hiFB1d+a8VPETzF
	 s5VPboJrQu+Q1a3zgFAN+eTLwRUVizfwo8XQxRAphB1jzZ/EoUIDxLu0d8J5ZhFWdI
	 cv3NOCB6wUi8TzbAkEeS2mqRdxfGR4wLHbIrOfzRJa9pH+PcVpKCuWGs4nJNB1rzaw
	 nFusVI10hlcNCp3BU7ffwOUPk0oyfnhSVhN5UIcIZftU591ujB/60lFnWB/IfR9lOu
	 nmC5H8FcUiXHwrqqx6EMydTh51FMnUEIxiBUBNMIXYaT/2rhKV9hR9bHBPsKH/w6HC
	 wgii2WvLFOj2g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH 2/2] platform/chrome: cros_kunit_util: add default value for `msg->result`
Date: Wed, 20 Jul 2022 04:47:54 +0000
Message-Id: <20220720044754.4026295-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220720044754.4026295-1-tzungbi@kernel.org>
References: <20220720044754.4026295-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add default value for `msg->result` so that it won't be garbage bytes
when the mock list is empty.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_kunit_util.c | 6 +++++-
 drivers/platform/chrome/cros_kunit_util.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform/chrome/cros_kunit_util.c
index 090927d43035..f0fda96b11bd 100644
--- a/drivers/platform/chrome/cros_kunit_util.c
+++ b/drivers/platform/chrome/cros_kunit_util.c
@@ -13,6 +13,7 @@
 #include "cros_ec.h"
 #include "cros_kunit_util.h"
 
+int cros_kunit_ec_xfer_mock_default_result;
 int cros_kunit_ec_xfer_mock_default_ret;
 int cros_kunit_ec_cmd_xfer_mock_called;
 int cros_kunit_ec_pkt_xfer_mock_called;
@@ -25,8 +26,10 @@ int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_comman
 	struct ec_xfer_mock *mock;
 
 	mock = list_first_entry_or_null(&cros_kunit_ec_xfer_mock_in, struct ec_xfer_mock, list);
-	if (!mock)
+	if (!mock) {
+		msg->result = cros_kunit_ec_xfer_mock_default_result;
 		return cros_kunit_ec_xfer_mock_default_ret;
+	}
 
 	list_del(&mock->list);
 
@@ -112,6 +115,7 @@ int cros_kunit_readmem_mock(struct cros_ec_device *ec_dev, unsigned int offset,
 
 void cros_kunit_mock_reset(void)
 {
+	cros_kunit_ec_xfer_mock_default_result = 0;
 	cros_kunit_ec_xfer_mock_default_ret = 0;
 	cros_kunit_ec_cmd_xfer_mock_called = 0;
 	cros_kunit_ec_pkt_xfer_mock_called = 0;
diff --git a/drivers/platform/chrome/cros_kunit_util.h b/drivers/platform/chrome/cros_kunit_util.h
index 88134c9f1acf..414002271c9c 100644
--- a/drivers/platform/chrome/cros_kunit_util.h
+++ b/drivers/platform/chrome/cros_kunit_util.h
@@ -23,6 +23,7 @@ struct ec_xfer_mock {
 	u32 o_data_len;
 };
 
+extern int cros_kunit_ec_xfer_mock_default_result;
 extern int cros_kunit_ec_xfer_mock_default_ret;
 extern int cros_kunit_ec_cmd_xfer_mock_called;
 extern int cros_kunit_ec_pkt_xfer_mock_called;
-- 
2.37.0.170.g444d1eabd0-goog

