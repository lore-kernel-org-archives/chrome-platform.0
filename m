Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A217C
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 05:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768DAC3411B;
	Wed, 15 Jun 2022 05:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655269997;
	bh=+DHhSqosE4XJOM/fy6PqZfeINZkN9gw6GDOPcgfkxIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmmvWJt7/KEN9iqPCpXt88y5IrUee/OKe2tBCoTg3FcnO70ioMynPNBJO6Q7JAlY8
	 YKeUotl/SH/UKARFt0EP54uKJEhE/KEmj9mH8G+AxuSuGBbIMF+DcDvmQ6huckjAaK
	 EcLPp+QKdf3XlliPYuFHTueqtTL3stU0/p766OIpNj3iLVYcRzWLpBBlXXbim3LqDb
	 rQi6VQDdXb2YrsbBZpUYiIgyHotRwxq72P+tBApldM/76xjyZ7CvRhKr2Zw+B/w/FU
	 mXYZSzpvVk6heS50n2wfGMtO0TOpxAO1sdjF9nPAPHS30Y8t4La3N3PqH79KvD1HGe
	 dZJhPMHGnVVAQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] platform/chrome: cros_ec_proto: return -EPROTO if empty payload
Date: Wed, 15 Jun 2022 05:12:48 +0000
Message-Id: <20220615051248.1628156-12-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615051248.1628156-1-tzungbi@kernel.org>
References: <20220615051248.1628156-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_wait_until_complete() sends EC_CMD_GET_COMMS_STATUS which expects
to receive sizeof(struct ec_response_get_comms_status) from
cros_ec_xfer_command().

Return -EPROTO if cros_ec_xfer_command() returns 0.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 5323edddb540..0c7042aa2640 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -166,6 +166,11 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			break;
 		}
 
+		if (ret == 0) {
+			ret = -EPROTO;
+			break;
+		}
+
 		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
 			break;
 	}
-- 
2.36.1.476.g0c4daa206d-goog

