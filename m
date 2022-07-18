Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97837A47
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 05:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6133CC341CA;
	Mon, 18 Jul 2022 05:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658121008;
	bh=pVG8rW+S0oNjgp6FHgiutzZNiAPcjJzWkFPlQQkw1WQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDQ8O8553aGFHHHoPoseAb6SH31h8CPVPrz+K61bBSYWrAAejRB/0bQ0+q2CMlQi+
	 LWS59Bm315fRZcZP6u1Th1xEcAoNT+Ur9y7Nm7t+t1IevDGVT3FoqdJ/LVBNTI2lVK
	 wbDbUxnAtDUOYcdenlR1lCiEkl6YN7JLgk3s/TOB/Nz7DMNnksom61tfPwol9ylICu
	 OqPMnfvZDD96k8tHj/bx1rNWs04rHrrULBu3BC/YrHJW7E9i0N0yOef24pSEgIa07t
	 04BElEBkPHdlV336XXNtCqNrWfpd1cY2tMtr7JBCe96fOdnp60Z3WyD9d/OUlJoSVy
	 5SD0FE4nvlNQQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] platform/chrome: cros_kunit_util: add default value for `msg->result`
Date: Mon, 18 Jul 2022 05:09:05 +0000
Message-Id: <20220718050914.2267370-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220718050914.2267370-1-tzungbi@kernel.org>
References: <20220718050914.2267370-1-tzungbi@kernel.org>
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
No v1.  New in the series.

 drivers/platform/chrome/cros_kunit_util.c | 7 ++++++-
 drivers/platform/chrome/cros_kunit_util.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_kunit_util.c b/drivers/platform/chrome/cros_kunit_util.c
index e031777dea87..6810d558d462 100644
--- a/drivers/platform/chrome/cros_kunit_util.c
+++ b/drivers/platform/chrome/cros_kunit_util.c
@@ -13,6 +13,8 @@
 #include "cros_ec.h"
 #include "cros_kunit_util.h"
 
+int cros_kunit_ec_xfer_mock_default_result;
+EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_result);
 int cros_kunit_ec_xfer_mock_default_ret;
 EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_default_ret);
 
@@ -24,8 +26,10 @@ int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_comman
 	struct ec_xfer_mock *mock;
 
 	mock = list_first_entry_or_null(&cros_kunit_ec_xfer_mock_in, struct ec_xfer_mock, list);
-	if (!mock)
+	if (!mock) {
+		msg->result = cros_kunit_ec_xfer_mock_default_result;
 		return cros_kunit_ec_xfer_mock_default_ret;
+	}
 
 	list_del(&mock->list);
 
@@ -89,6 +93,7 @@ EXPORT_SYMBOL_GPL(cros_kunit_ec_xfer_mock_next);
 
 void cros_kunit_mock_reset(void)
 {
+	cros_kunit_ec_xfer_mock_default_result = 0;
 	cros_kunit_ec_xfer_mock_default_ret = 0;
 	INIT_LIST_HEAD(&cros_kunit_ec_xfer_mock_in);
 	INIT_LIST_HEAD(&cros_kunit_ec_xfer_mock_out);
diff --git a/drivers/platform/chrome/cros_kunit_util.h b/drivers/platform/chrome/cros_kunit_util.h
index 79c4525f873c..79c4f259f2bb 100644
--- a/drivers/platform/chrome/cros_kunit_util.h
+++ b/drivers/platform/chrome/cros_kunit_util.h
@@ -23,6 +23,7 @@ struct ec_xfer_mock {
 	u32 o_data_len;
 };
 
+extern int cros_kunit_ec_xfer_mock_default_result;
 extern int cros_kunit_ec_xfer_mock_default_ret;
 
 int cros_kunit_ec_xfer_mock(struct cros_ec_device *ec_dev, struct cros_ec_command *msg);
-- 
2.37.0.170.g444d1eabd0-goog

