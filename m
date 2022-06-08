Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502292F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A6FC341C4;
	Wed,  8 Jun 2022 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686473;
	bh=Vm8ACATJZ6acaE6pLz9MlnyBRs5ebaZBFB8JYs5NExw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FIK+sPmJzGxvPjHiYqMAC++PEYBYnMVnOBFwlcqmZpr/w4h7TRTJ+iWxwTP/3Bp9l
	 jClEKluJQjuRWHK5E9fKL40EQy6z+18IV7M4EdQwmpwYfbi6+TNRRQZRPRODzRGw08
	 9lFnB/rtn3uJHA3VaFU6hPy/tBIeDq+uqg8mIlOpBHhTDHKzBCENRN+qXFAKLi8W/8
	 8nDVzDYQFFmdxT9vkO3szFlGPC2pf9/SU3g4yupT1vEeI9zw84V4551u4Z5wxo5K+0
	 juu8fQgNwO6oqTAgpYcbrxD1n+/jXFQ4cN1vb7hZ/FTi9KiU0yLFu9LEUkdTxDssJy
	 VuEv6pL/ItTlg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/23] platform/chrome: cros_ec_proto: assign buffer size from protocol info
Date: Wed,  8 Jun 2022 11:07:15 +0000
Message-Id: <20220608110734.2928245-5-tzungbi@kernel.org>
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

`din_size` is calculated from `ec_dev->max_response`.
`ec_dev->max_response` is further calculated from the protocol info.

To make it clear, assign `din_size` and `dout_size` from protocol info
directly.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No change from v2.

Changes from v1:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 65191af5139c..629dce3e6ab3 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -449,12 +449,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 			"using proto v%u\n",
 			ec_dev->proto_version);
 
-		ec_dev->din_size = ec_dev->max_response +
-			sizeof(struct ec_host_response) +
-			EC_MAX_RESPONSE_OVERHEAD;
-		ec_dev->dout_size = ec_dev->max_request +
-			sizeof(struct ec_host_request) +
-			EC_MAX_REQUEST_OVERHEAD;
+		ec_dev->din_size = proto_info->max_response_packet_size + EC_MAX_RESPONSE_OVERHEAD;
+		ec_dev->dout_size = proto_info->max_request_packet_size + EC_MAX_REQUEST_OVERHEAD;
 
 		/*
 		 * Check for PD
-- 
2.36.1.255.ge46751e96f-goog

