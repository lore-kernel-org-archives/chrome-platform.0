Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A110F1
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jun 2022 04:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94925C341C8;
	Wed, 22 Jun 2022 04:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655871076;
	bh=rOj26wAad85ZogHcb4dWpOQYm5ee8n0PjrbKNVo0Lxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DboAEBrrFw+A4v6qrzFlsbk9QDn6tGYCuEzOj6yFdwXNHIc/k+JtTKwQyivw9CXR7
	 koNyoKa2AtVjmkcasKXHc1nAbPv0ZAkxpeI5oU2Ug5BjlBfExvwKe4vxcC2zWw2MNo
	 PLa827HVQbjPDkIdB0GOfMqBEfaPJ3TceR1QPvqArZVrvdoHBiNwFVv12QQJoPsW11
	 GUVjaS7qVISdkHxS7ee3SM7Xexg6MvjyQFJN3TWKYq4BIgIEgJvnLS9/gTiddkTWlW
	 DEN/3vCCItOGFVpyuy7gRzjI3Dyog50tnd1nfNwXFI/qXQPVoQqYAZjUf4nCmlqOxO
	 lgOCBkhuikfaA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] platform/chrome: cros_ec_proto: add Kunit test for cros_ec_cmd()
Date: Wed, 22 Jun 2022 04:10:40 +0000
Message-Id: <20220622041040.202737-8-tzungbi@kernel.org>
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

cros_ec_cmd() is a wrapper of cros_ec_cmd_xfer_status().

Add Kunit test for cros_ec_cmd().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 6b26ce3104f4..2ff2783fedfb 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2592,6 +2592,53 @@ static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
 	}
 }
 
+static void cros_ec_proto_test_ec_cmd(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	int ret;
+	u8 out[3], in[2];
+
+	ec_dev->max_request = 0xff;
+	ec_dev->max_response = 0xee;
+
+	out[0] = 0xdd;
+	out[1] = 0xcc;
+	out[2] = 0xbb;
+
+	{
+		u8 *data;
+
+		mock = cros_kunit_ec_xfer_mock_add(test, 2);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+
+		data = (u8 *)mock->o_data;
+		data[0] = 0xaa;
+		data[1] = 0x99;
+	}
+
+	ret = cros_ec_cmd(ec_dev, 0x88, 0x77, out, ARRAY_SIZE(out), in, ARRAY_SIZE(in));
+	KUNIT_EXPECT_EQ(test, ret, 2);
+
+	{
+		u8 *data;
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0x88);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, 0x77);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, ARRAY_SIZE(in));
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, ARRAY_SIZE(out));
+
+		data = (u8 *)mock->i_data;
+		KUNIT_EXPECT_EQ(test, data[0], 0xdd);
+		KUNIT_EXPECT_EQ(test, data[1], 0xcc);
+		KUNIT_EXPECT_EQ(test, data[2], 0xbb);
+	}
+}
+
 static void cros_ec_proto_test_release(struct device *dev)
 {
 }
@@ -2690,6 +2737,7 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_get_sensor_count_normal),
 	KUNIT_CASE(cros_ec_proto_test_get_sensor_count_xfer_error),
 	KUNIT_CASE(cros_ec_proto_test_get_sensor_count_legacy),
+	KUNIT_CASE(cros_ec_proto_test_ec_cmd),
 	{}
 };
 
-- 
2.37.0.rc0.104.g0611611a94-goog

