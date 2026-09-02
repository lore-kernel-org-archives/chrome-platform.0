Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7237756F
	for <chrome-platform@lists.linux.dev>; Wed,  2 Sep 2026 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343628; cv=none; b=H0ZXZAzeXKmJp+HFgJ83Ce5gSbdoVvPDBk+9pYvpLi4m1mKsuj3nN/M2tq+XdauAv5/gpMUG/PwroNc3FuD+zVfgvjB5rT8vp2zd1iw7ysIiAWIx1nSP/ehTls2OY8M0JthEjOYBUBW/3x+9HQRcTK/9RF1ddpd6j3AI3GZORUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343628; c=relaxed/simple;
	bh=T8fhF3ZQlXI3ZB9+p98Y0ZeyaQQ7PvUvvLA0Dw90Eys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMiIH6ooJJTdTovfvwVeFa0QA7f9Rns8kH01disryPAx++oc0eTc+VuvtPNwScqU1ZNPA+XycFP9e+pc8YWSr3HMtqjovWTXp43KUga/7vDfL0HZogC04rcbyjXsI/o/byO7wJl/edRcoUk/APqBGfkDmeByHvWFB5Mwdd6ZPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRSEu4Nd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRSEu4Nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED8E1F00AC4;
	Wed,  2 Sep 2026 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788343626;
	bh=Zu4iYye+qU/Y5/UkdkI23P0G0CSALh02SSL6hGKkYI0=;
	h=From:To:Cc:Subject:Date;
	b=eRSEu4Nd4SlQnta2ZxBHFluwBLoy8M19qqH9J2gjOVtDvlTPomQwIq3hN4TB2gfok
	 9COq12udMqq8orbX3cS/eYAeARMRuDxPLj7lcA9FQAqTOY2CP1DisOtzw2x7w9wWGB
	 Ll7RipPQS4lLGNcd6BrmYgq8u+38L5yRSpBI444xEUxBx48xKUOvaNalmtdO6xt7Dn
	 6r2v22lL/jr/6R0G+2ZRyEV0HnMO+VFolW9JuPV8nmKDvY4s9QxS3mEA4p5Nk1F+te
	 /zmmVaoH9ZW3lh29NrAMdRyILZx6ClC124+TLHcRRel7iMMim6rRFazJgc1c/ZMhL0
	 ppUBIC+/Px1uw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: cros_ec_proto: Simplify cros_ec_wait_until_complete()
Date: Wed,  2 Sep 2026 10:06:51 +0000
Message-ID: <20260902100651.274749-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to defer the return out of the loop.  Replace the
`break` with an immediate `return -EPROTO`.

With the `break` removed, execution only reaches the end of the function
if it exhausts all EC_COMMAND_RETRIES.  The post-loop check is therefore
redundant and replaced with an unconditional `return -EAGAIN`.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 724d1313f6b2..2046ac29a473 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -165,19 +165,14 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 		if (msg->result != EC_RES_SUCCESS)
 			return ret;
 
-		if (ret == 0) {
-			ret = -EPROTO;
-			break;
-		}
+		if (ret == 0)
+			return -EPROTO;
 
 		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
 			return ret;
 	}
 
-	if (i >= EC_COMMAND_RETRIES)
-		ret = -EAGAIN;
-
-	return ret;
+	return -EAGAIN;
 }
 
 static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
-- 
2.55.0.970.g62bdec98f9-goog

