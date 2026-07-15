Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0149236215B
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 02:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083518; cv=none; b=mj/FCj0JQvWZK6uKPl6HBkIPBcILy7IfxSoDjBm2H7S0yIIf44+w4mbk7b89WlEi99R0RYLSY1SVd3wdj1onU8fvLjGzBydPuZhKAc1H+zWvwIdFec34BbxRcN/pHJH7DRnQBW1I2qN/g9SmZGbLweLRfh1yotq1XmiEDmS0A5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083518; c=relaxed/simple;
	bh=vm/dRMtD2zQF5+ahkzjnYgdaOBZWFm25rdqTSrGbc+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbB+0nI6ZTxPBFw8uY0Hr/s5JsfUIGIBuydm/Ad6K34VM0ibHxSQzHpHTG8cDRHZFdkpJ3JSDun0oqqho3Mufb2sQKlYaf4j0GU23b8mxnqddsgL+DeUCFneWWN5a3f3auTDGRKMABvOcqvRxcGYXLfduJMqgw9M5DiN4aVljjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMXdjein; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMXdjein"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAA91F000E9;
	Wed, 15 Jul 2026 02:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784083516;
	bh=uES+ZoxXqsdpA/6EU75CWy1pJCZwYP+zVCJJIqPRsq4=;
	h=From:To:Cc:Subject:Date;
	b=EMXdjeinnNDI11GZLe5Apxj2wedfogH04U65Du36hDeiarCO2if0Nao3ip7TyNysv
	 WDWnF6ceiZypeePT08p1sZ1wEklzAH/j6dbcN2uLWoJN9R7v6oqA29iBYNWBl/lyD9
	 WA028gGzFHIxPxJ2PtD3OqqLxEuO53lbxP01wvLL7sNHevXOst1O0xgOcUbH5V1gUQ
	 xrXIP8Zd1vYDYzz3TVbxaCdgm7L/wc64RUNOI3Pt+ZzYDTsf9u94Vmn4p5IQAwTsHm
	 wZ96teGUe1aR4qVKzb7reJN/S+7gEBoFMK44KpEaTU79VRwb/zWpDlNsFgVucX8s70
	 7DE7NtIwcFrLg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	Bryam Vargas <hexlabsecurity@proton.me>,
	chrome-platform@lists.linux.dev,
	tfiga@chromium.org,
	suleiman@chromium.org
Subject: [PATCH v2] platform/chrome: sensorhub: Fix dropped timestamp events and log spam
Date: Wed, 15 Jul 2026 02:44:53 +0000
Message-ID: <20260715024454.4127571-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported
sensor number") evaluated the `sensor_num` against the bounds limit even
for timestamp events.  A timestamp event typically has a `sensor_num` of
0xff [1], causing the driver to flag it as invalid and skip to the next
event.

As a result, we'd see a flooding of "Invalid sensor number 255 from EC"
warning logs and these timestamp events were being dropped.

Move the bounds-check into cros_ec_sensor_ring_process_event() and
evaluate it only after standalone timestamp events have already been
processed and returned early.

[1] https://crrev.com/219ca6ef82ba266da788b673ee4ad50bd3ea1285/common/motion_sense_fifo.c#427

Fixes: 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported sensor number")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Bryam: sorry for reverting the decision (moving back the check to
cros_ec_sensor_ring_process_event()).  I realized we need to prevent
dropping timestamp events and flooding the logs.
---
v2:
- Move the check to cros_ec_sensor_ring_process_event().
- Return earlier for standalone timestamp events.

v1: https://lore.kernel.org/all/20260714065202.3248017-1-tzungbi@kernel.org
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 92941924c347..d92b60213720 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -475,6 +475,21 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 						  fifo_timestamp,
 						  *current_timestamp,
 						  now);
+
+		/*
+		 * A standalone timestamp event typically has a sensor_num of
+		 * 0xff.  Return early here to prevent it from hitting the
+		 * bounds check below and spamming the logs.
+		 */
+		return false;
+	}
+
+	/* Skip event if sensor_num from EC is out of bounds. */
+	if (in->sensor_num >= sensorhub->sensor_num) {
+		dev_warn_ratelimited(sensorhub->dev,
+				     "Invalid sensor number %u from EC\n",
+				     in->sensor_num);
+		return false;
 	}
 
 	if (in->flags & MOTIONSENSE_SENSOR_FLAG_ODR) {
@@ -502,10 +517,6 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 		return true;
 	}
 
-	if (in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP)
-		/* If we just have a timestamp, skip this entry. */
-		return false;
-
 	/* Regular sample */
 	out->sensor_id = in->sensor_num;
 	trace_cros_ec_sensorhub_data(in->sensor_num,
@@ -897,14 +908,6 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 
 		for (in = sensorhub->resp->fifo_read.data, j = 0;
 		     j < number_data; j++, in++) {
-			/* Skip event if sensor_num from EC is out of bounds. */
-			if (in->sensor_num >= sensorhub->sensor_num) {
-				dev_warn_ratelimited(sensorhub->dev,
-						     "Invalid sensor number %u from EC\n",
-						     in->sensor_num);
-				continue;
-			}
-
 			if (cros_ec_sensor_ring_process_event(
 						sensorhub, fifo_info,
 						fifo_timestamp,
-- 
2.55.0.229.g6434b31f56-goog

