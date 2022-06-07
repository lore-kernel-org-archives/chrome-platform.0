Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD2928FE
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 14:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F41C385A5;
	Tue,  7 Jun 2022 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654613816;
	bh=sHzvGlVy0kLF8VbeUYrSjjQM5WU1NKoCg9+52u9vPq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nmgv2y98abPxiTcoaT7QHAfS6kT1GimV8V9fSky2ZT2BBF7b+qSAsgq06SIPjGOhH
	 ZistjUzn/sGzPGHwTdGEnch6SBf9dQWoSiBwirnuH4nAQIAQMZd0OyJz1z9rrMzX9j
	 JYzJJQQpVe6fSj9TBwGKsXBQIlmPpahxbQXwMNHpIdavpB1qhIjQuphjdeHr0jYPtN
	 P8i4+m8UxT1t6dsOMia0ORBCFG6qlll7P4OW1mpg4SlZiF1JbRV+oy7NeXJQabmSJf
	 nFU+yrlGK2UT1xlMyNj5TXMwfPCqr3bmEshpwr5Ya4ECz9GCs3KWs423qgPliRpPtP
	 V9ofZgei1Yi0w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2 04/15] platform/chrome: cros_ec_proto: assign buffer size from protocol info
Date: Tue,  7 Jun 2022 14:56:28 +0000
Message-Id: <20220607145639.2362750-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607145639.2362750-1-tzungbi@kernel.org>
References: <20220607145639.2362750-1-tzungbi@kernel.org>
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

