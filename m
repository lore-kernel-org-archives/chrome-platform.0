Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E681C01
	for <chrome-platform@lists.linux.dev>; Sun, 14 Aug 2022 15:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DC3C433C1;
	Sun, 14 Aug 2022 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660491172;
	bh=dS3oUX565XXqWz6LAky5wfcvCoNURNos/Hxa/WUf87o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DlvHjZhBe1FNFZ2SM0/KE2j2aMZWkorBcikl9NlrOoCpt/sQkey+zIEYyXdDM+TNF
	 f7on9u6ypgUQgxVq0XpQmPixpCZ1M0NMUvXU7jAOldr31PPQs7Pivrd5/MsQTwHUXk
	 WN8i0dmmHxOmECXHaZLEf02/dAuOkVqIqbWxWf47aBMSnS8/q9f89AXMQCH3fp2/6u
	 QhFW+Y1fZkwgHo3r/bTFp1T4YrrY8hhqVkgnVXUTTwKtN2a+IXKH+vjT7vPduCga8I
	 szm8tFEHvH9N5KSbRLaw89b0xpGuSASqvIFbIH8cpRU3cM4ew2ukPvfUJhGoTABSfP
	 WYAUxLbzvP64A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 03/46] platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
Date: Sun, 14 Aug 2022 11:32:04 -0400
Message-Id: <20220814153247.2378312-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153247.2378312-1-sashal@kernel.org>
References: <20220814153247.2378312-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Tzung-Bi Shih <tzungbi@kernel.org>

[ Upstream commit b36f0643ff14a2fb281b105418e4e73c9d7c11d0 ]

It wrongly showed the following message when it doesn't support MKBP:
"MKBP support version 4294967295".

Fix it.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Link: https://lore.kernel.org/r/20220609084957.3684698-14-tzungbi@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index ed2b4807328d..1575d603d3ff 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -507,13 +507,13 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 	ret = cros_ec_get_host_command_version_mask(ec_dev,
 						    EC_CMD_GET_NEXT_EVENT,
 						    &ver_mask);
-	if (ret < 0 || ver_mask == 0)
+	if (ret < 0 || ver_mask == 0) {
 		ec_dev->mkbp_event_supported = 0;
-	else
+	} else {
 		ec_dev->mkbp_event_supported = fls(ver_mask);
 
-	dev_dbg(ec_dev->dev, "MKBP support version %u\n",
-		ec_dev->mkbp_event_supported - 1);
+		dev_dbg(ec_dev->dev, "MKBP support version %u\n", ec_dev->mkbp_event_supported - 1);
+	}
 
 	/* Probe if host sleep v1 is supported for S0ix failure detection. */
 	ret = cros_ec_get_host_command_version_mask(ec_dev,
-- 
2.35.1

