Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7947C
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 05:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4A4C34115;
	Wed, 15 Jun 2022 05:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655269992;
	bh=1Ziar4/L2yYTjXxZ9eePmtAtdMdL2lsbb8Bw9TmQToM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CdnTk7gYSmjQxxysxldnd/wF83UM/qfSHCYgSTCoCc5JzgqyXiXzYbsW7vi8uvyX0
	 WeFNf/DdKmngt3KkjrPHI1BSAnrJD1Lw/Ry7E7Yo9pkmcne2ImOZsXttF7ANG/rONq
	 nRl00diCDDt3sM2yGN6jVDlcWGq5pPuseprUYDVDSkNBmUVOfhHHEoGtf22/pEfu81
	 XOIzg8Jgwdr+KlaTFUd+FbUgcgwCQ5KQFAdEAeCMSocNJz+yfa+xhPTYJcBFx4kuFB
	 JDj3hX0I6+sKR1sQ0Cc7I4vtm7BEYDobjSatrfYtUNcmdyAf6J2jxEqdCS7kewdQls
	 pjq+IO3NY0nJw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] platform/chrome: cros_ec_proto: return -EAGAIN when retries timed out
Date: Wed, 15 Jun 2022 05:12:44 +0000
Message-Id: <20220615051248.1628156-8-tzungbi@kernel.org>
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

While EC_COMMS_STATUS_PROCESSING flag is still on after it tries
EC_COMMAND_RETRIES times for sending EC_CMD_GET_COMMS_STATUS,
cros_ec_wait_until_complete() doesn't return an error code.

Return -EAGAIN in the case instead.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 466ecb063bd6..49772a4c5353 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -167,6 +167,9 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			break;
 	}
 
+	if (i >= EC_COMMAND_RETRIES)
+		ret = -EAGAIN;
+
 	kfree(msg);
 	return ret;
 }
-- 
2.36.1.476.g0c4daa206d-goog

