Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E622F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71951C341C5;
	Wed,  8 Jun 2022 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686479;
	bh=rEQq7TqpSemfpsFB73dL2/FazuLAtoO+u/JSFRyGWQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2pFYi1I0TidC1idSxs+LZbBvJrrtpXFJ/trZa4tu426NKAEoltkmthTqa1bb7Zzc
	 1l8TUAbma7UYPqKrhymI3xAAKSqqAMerD/+kzV6afpjh5wiuePWCVPLadMWcJeLTMh
	 H5DhdnbDhqYgHbA8e0xMI/1k6GyJuKtufcX6opnHGUW73dayc/et94Gt5a0NDgzA0Z
	 V1MOwA9z3WcPhA1NxqytCHJD8qngzRDwutYuzNpwXSErZp6TR5wRWEYsFFl44BAwYN
	 kaWXr9K44jG+LVlA9aIsOZS+7Up41FeYVSQtHSmUNQHJXieluxxi0qW6M6LP7ULwJw
	 nq/JNNj5KV/ZQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/23] platform/chrome: cros_ec_proto: handle empty payload in getting proto info
Date: Wed,  8 Jun 2022 11:07:20 +0000
Message-Id: <20220608110734.2928245-10-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608110734.2928245-1-tzungbi@kernel.org>
References: <20220608110734.2928245-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_get_proto_info() expects to receive
sizeof(struct ec_response_get_protocol_info) from send_command().  The
payload is valid only if the return value is positive.

Return -EPROTO if send_command() returns 0 in cros_ec_get_proto_info().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v2:
- Separate Kunit test to another patch.

 drivers/platform/chrome/cros_ec_proto.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 893b76703da6..6f5be9e5ede4 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -314,6 +314,11 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 		goto exit;
 	}
 
+	if (ret == 0) {
+		ret = -EPROTO;
+		goto exit;
+	}
+
 	info = (struct ec_response_get_protocol_info *)msg->data;
 
 	switch (devidx) {
-- 
2.36.1.255.ge46751e96f-goog

