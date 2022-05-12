Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC317FC
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F596C34116;
	Thu, 12 May 2022 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652344615;
	bh=OBTk7pSzwT3q1Pjbx4gx78ocFGEWz64SRojg3O72N04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=soAtGOcaDTxz3BIdRqZ5zQT+JGeaEUthLS2WROgcdroaDdwRKgX0h3Arr0JStfCLZ
	 iiT8fca/3Xlskd2SCG3j1W6Vf4f3fNicTNP/J6+YJWf9E9ijrYNzX4fpnhezebQjUt
	 Jq+BjwJh6nGzJrfObnfoGn7JPkD3LwtLMcgPiDkHPUgJh9AR7SZp9+4vcPns2WQyEN
	 piWSC1U4MICQ5BApzlibGYa5gvzUdzUBHJw4XZpYqziLzTnVb5PbpYPUL2i5/+PosE
	 80cmp4OU+FMObHbqwpmMakbqbXKszCoe8lAzSzQC6BBt7B4OT3MdQDPa7bbL8VG9M4
	 SfqaTpAXI5BgQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_get_host_event()
Date: Thu, 12 May 2022 16:36:25 +0800
Message-Id: <20220512083627.885338-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220512083627.885338-1-tzungbi@kernel.org>
References: <20220512083627.885338-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is overkill to crash the kernel if the `ec_dev` doesn't support MKBP
event but gets called into cros_ec_get_host_event().

Drop the BUG_ON() and return error (0 in the case) instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 9ce3374846ff..ff767dccdf0f 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -817,7 +817,8 @@ u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev)
 {
 	u32 host_event;
 
-	BUG_ON(!ec_dev->mkbp_event_supported);
+	if (!ec_dev->mkbp_event_supported)
+		return 0;
 
 	if (ec_dev->event_data.event_type != EC_MKBP_EVENT_HOST_EVENT)
 		return 0;
-- 
2.36.0.512.ge40c2bad7a-goog

