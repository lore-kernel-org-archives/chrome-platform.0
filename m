Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45D10F1
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jun 2022 04:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7DDC3411B;
	Wed, 22 Jun 2022 04:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655871072;
	bh=jgvHyxo+huezbjxnLeeKMTrFXDzr8Qu8JPnogSqmjzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKV3rMKoi42+GbTD56ECKpsafDN6PUtobxCnqxiHImP7EEAT7FtI0X/e+L9hEB1Q6
	 zV2PL9/WKqkku2+QBoO/8zfw52kT6UewLBSGir8xD8A432yvHsBKsaJBwFjzih6HYR
	 Kk34s1Cdj0kli+w9owZ+Fl+yApLBkveGXIr2uoI/xhEQQk5RcFUUiwuU3hrKJMOdDD
	 beLEDFvq3peXB3HD3uGka3kPLjA5laQCYvq5noqPHZni1MpqDvblz2+oLPiNt50SQD
	 BpZSoQokX9BxtFXmehy3CRsAlK4O3LljAxEgFcvrlstLsVYQig8Ak9d1ppwn/gS2vt
	 uGjk07ZcRtvtw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] platform/chrome: cros_ec_proto: add Kunit tests for get_host_event
Date: Wed, 22 Jun 2022 04:10:37 +0000
Message-Id: <20220622041040.202737-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220622041040.202737-1-tzungbi@kernel.org>
References: <20220622041040.202737-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_get_host_event() performs some sanity checks, parses
`ec_dev->event_data.data.host_event`, and returns bitmap of
EC_HOST_EVENT_*.

Add Kunit tests for cros_ec_get_host_event().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 59 ++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 64c4b79f7a0c..dce9fa3b9c8d 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2312,6 +2312,61 @@ static void cros_ec_proto_test_get_next_event_mkbp_event_host_event_masked(struc
 	}
 }
 
+static void cros_ec_proto_test_get_host_event_no_mkbp_event(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	int ret;
+
+	ec_dev->mkbp_event_supported = 0;
+
+	ret = cros_ec_get_host_event(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void cros_ec_proto_test_get_host_event_not_host_event(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	int ret;
+
+	ec_dev->mkbp_event_supported = 1;
+	ec_dev->event_data.event_type = EC_MKBP_EVENT_FINGERPRINT;
+
+	ret = cros_ec_get_host_event(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void cros_ec_proto_test_get_host_event_wrong_event_size(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	int ret;
+
+	ec_dev->mkbp_event_supported = 1;
+	ec_dev->event_data.event_type = EC_MKBP_EVENT_HOST_EVENT;
+	ec_dev->event_size = 0xff;
+
+	ret = cros_ec_get_host_event(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void cros_ec_proto_test_get_host_event_normal(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	int ret;
+
+	ec_dev->mkbp_event_supported = 1;
+	ec_dev->event_data.event_type = EC_MKBP_EVENT_HOST_EVENT;
+	ec_dev->event_size = sizeof(ec_dev->event_data.data.host_event);
+	put_unaligned_le32(EC_HOST_EVENT_MASK(EC_HOST_EVENT_RTC),
+			   &ec_dev->event_data.data.host_event);
+
+	ret = cros_ec_get_host_event(ec_dev);
+	KUNIT_EXPECT_EQ(test, ret, EC_HOST_EVENT_MASK(EC_HOST_EVENT_RTC));
+}
+
 static void cros_ec_proto_test_release(struct device *dev)
 {
 }
@@ -2401,6 +2456,10 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_get_next_event_mkbp_event_version2),
 	KUNIT_CASE(cros_ec_proto_test_get_next_event_mkbp_event_host_event_rtc),
 	KUNIT_CASE(cros_ec_proto_test_get_next_event_mkbp_event_host_event_masked),
+	KUNIT_CASE(cros_ec_proto_test_get_host_event_no_mkbp_event),
+	KUNIT_CASE(cros_ec_proto_test_get_host_event_not_host_event),
+	KUNIT_CASE(cros_ec_proto_test_get_host_event_wrong_event_size),
+	KUNIT_CASE(cros_ec_proto_test_get_host_event_normal),
 	{}
 };
 
-- 
2.37.0.rc0.104.g0611611a94-goog

