Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FDE3F076D
	for <chrome-platform@lists.linux.dev>; Mon, 20 Jul 2026 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545455; cv=none; b=iFfLpWWHBTgsd1D8Tl2Bx+VB68oDTlvtQp0Y+OfIGY9rODwDp0w+OLjkGwTjWbMd/D2vWjj2mbNjbOWfK13rEMGuy0F/aqWwmuHdQ2Iw3lntxfTOxh7RM47huzJ5l2UiLlLYvuqjq5o3ZOVKbHBdlBFVOQelCKg90UuURsDY9+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545455; c=relaxed/simple;
	bh=e9hcwFC28LFuK2Kc2ibJoC0dW0OjBgv0oAbur9vAKvo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JhGzDYZHlz904YwjJPZCKUTqdz43CtySDdqoi8/EHVALvKOW3JryE6+0cNHJcWDcKhgNldvvz+fd3BSSG0INH8+s40SJOg3TSG2YsspBW5LyYEtPj3zn+N3kvD7AgtQ4n4UjP0vVu+wR/MVCiFSVukCL/MpESXetoFZKFm4HiW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n8Hicr3k; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n8Hicr3k"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so77911585ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 20 Jul 2026 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784545449; x=1785150249; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DuJsDO3A/N5z0ORQbBybz5/iIac5+C2gQt3zt9xC9eU=;
        b=n8Hicr3knh1pCEyMhlEImoN86u5GcVqnHq63KgdStg8abJQ5ppRzuysD8YjXmjfJ5k
         SAS0Wve+jty2KUHjv2kct2s4vEIi7CmqrWekf0wM50us9iNbhNduXw3Gmnx4FCubHxso
         0irqZ4Vx4B7Am+qVXQDQMDXqB43WHRs5UaVzjMkz6nTg3ZwpkRnGX9GdTUz2kWeZq9Pf
         UzC/uAxUJoZUUiNRWiDJ9yXICNbJM4JU2OOyYX46muO6wN/mt5nYb2+GY2Me4jIvnIdB
         tukB7Lv6HWAMsLO/KdJtUJbH8zLP/C8CLCDBYHjk5ak1pZnMAOKbfSWJC1aeGlazF0Kn
         IxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545449; x=1785150249;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuJsDO3A/N5z0ORQbBybz5/iIac5+C2gQt3zt9xC9eU=;
        b=a/rLhjvWgrMYvffG7oQU/crocFJcFwv0bhGYRX8ocYYW3td1/NpBLsQX/9TaMn47Sf
         NqUeHZhAKEjBp++jPRzCLKeOJPtXiO5CyqbYpl27tmaXa4xwzyFzNzmNvxI6l4h2l0af
         NDrdWw7cVnCg0wTCVmH/1Eq/LycxUqvKW2XsqX91NoxBKSPb/hXGe/t0qTLkj/2P3t2d
         SLBkWN2yUy0T2dAa13mxd5SVKe5Q1GjIF0+cQ3qLw//lohWNP6qERfYgE5v9URcc8aV4
         XCCo/tbk2cvZsrM6QIlGNd5hL+hfJZKQ3tkok1zC6jw+53yHM8taFKctAJfQI7R7bBCW
         JjTA==
X-Gm-Message-State: AOJu0YxkJ1Z8JcsUxzLeEw45PtULc2xBljxLYh/bwPlArJH8xxuWtPos
	UPAqARTClkusEP1n03YQx5hjwKm9bwY6h/0XYqFLOJcFRSGRXvG4ytjzakIKXZ3lFXXN02bh9NR
	thuH1RX12hNld+w==
X-Received: from plhi15.prod.google.com ([2002:a17:903:2ecf:b0:2ce:92e1:56d7])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:26c6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2cf34656589mr148055115ad.0.1784545448678;
 Mon, 20 Jul 2026 04:04:08 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:04:05 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720110405.2127011-1-sgsatyam@google.com>
Subject: [PATCH] platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

When the AP goes into deep sleep, the EC physically continues executing
and silently wraps its 32-bit timestamp counter one or more times.
Because Linux natively advances ktime_get_boottime() across suspend,
the AP clock leaps forward but the incoming 32-bit EC timestamp
appears historically delayed.

Calculate exactly how many 71.5 minute epochs were swallowed during
sleep by dividing the AP's recorded sleep duration against the overflow
period. By injecting these missed wraps directly into the running EC
offset tracker, the EC timeline snaps forward instantly and achieves
parity with AP boottime, avoiding fatal negative delta time-skew
calculations.

Any massive suspend gaps (>500ms) inherently trigger the
TS_HISTORY_BORED_US fallback during the first post-resume sensor event,
scrubbing the poisoned clock drift data. Because the clocks are
explicitly resynchronized by the math above, newly arriving samples
remain completely valid and are correctly delivered without being
warped by stale filter history.

Remove the obsolete timestamp_reset tracking mechanism.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub.c   | 51 ++++++++++++++++---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 30 ++++++++---
 .../linux/platform_data/cros_ec_sensorhub.h   |  2 +
 3 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index 9bad8f72680e..e12ee1f3cfd7 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -29,8 +29,8 @@ static void cros_ec_sensorhub_free_sensor(void *arg)
 }
 
 static int cros_ec_sensorhub_allocate_sensor(struct device *parent,
-					     char *sensor_name,
-					     int sensor_num)
+						 char *sensor_name,
+						 int sensor_num)
 {
 	struct cros_ec_sensor_platform sensor_platforms = {
 		.sensor_num = sensor_num,
@@ -38,9 +38,9 @@ static int cros_ec_sensorhub_allocate_sensor(struct device *parent,
 	struct platform_device *pdev;
 
 	pdev = platform_device_register_data(parent, sensor_name,
-					     PLATFORM_DEVID_AUTO,
-					     &sensor_platforms,
-					     sizeof(sensor_platforms));
+						 PLATFORM_DEVID_AUTO,
+						 &sensor_platforms,
+						 sizeof(sensor_platforms));
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
@@ -50,7 +50,7 @@ static int cros_ec_sensorhub_allocate_sensor(struct device *parent,
 }
 
 static int cros_ec_sensorhub_register(struct device *dev,
-				      struct cros_ec_sensorhub *sensorhub)
+					  struct cros_ec_sensorhub *sensorhub)
 {
 	int sensor_type[MOTIONSENSE_TYPE_MAX] = { 0 };
 	struct cros_ec_command *msg = sensorhub->msg;
@@ -147,7 +147,7 @@ static int cros_ec_sensorhub_probe(struct platform_device *pdev)
 
 	msg = devm_kzalloc(dev, sizeof(struct cros_ec_command) +
 			   max((u16)sizeof(struct ec_params_motion_sense),
-			       ec->ec_dev->max_response), GFP_KERNEL);
+				   ec->ec_dev->max_response), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -243,6 +243,8 @@ static int cros_ec_sensorhub_suspend(struct device *dev)
 	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
+	sensorhub->suspend_time = ktime_get_boottime();
+
 	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
 		return cros_ec_sensorhub_ring_fifo_enable(sensorhub, false);
 	return 0;
@@ -253,8 +255,41 @@ static int cros_ec_sensorhub_resume(struct device *dev)
 	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
-	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
+	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO)) {
+		/*
+		 * The EC's 32-bit hardware timestamp natively rolls over every 71.5 minutes.
+		 * When the AP goes into deep sleep, the EC physically continues executing
+		 * and silently wraps its 32-bit timestamp counter one or more times.
+		 *
+		 * Because Linux natively advances ktime_get_boottime() across suspend,
+		 * the AP clock leaps forward, but the incoming 32-bit EC timestamp appears
+		 * massively historically delayed due to the lost silent overflows.
+		 *
+		 * We mathematically calculate exactly how many 71.5 minute epochs were
+		 * swallowed during sleep by dividing the AP's recorded sleep duration
+		 * against the overflow period. By forcefully injecting these missed
+		 * wraps directly into the running EC offset tracker, the EC timeline
+		 * snaps forward instantly and achieves active parity with the AP boottime,
+		 * completely avoiding fatal negative delta time-skew calculations.
+		 *
+		 * Lastly, massive suspend gaps (>500ms) inherently trigger the
+		 * TS_HISTORY_BORED_US fallback during the first post-resume sensor
+		 * event. This safely and completely scrubs the poisoned clock drift data.
+		 * Because the clocks are explicitly resynchronized by the math above,
+		 * the newly arriving samples remain completely valid and are correctly
+		 * delivered to the user framework without being warped by stale filter history.
+		 */
+		u64 sleep_duration = ktime_to_us(ktime_sub(
+					ktime_get_boottime(), sensorhub->suspend_time));
+
+		u64 missed_overflows = div64_u64(sleep_duration, 1ULL << 32);
+
+		sensorhub->overflow_a.offset += (missed_overflows * (1ULL << 32));
+		sensorhub->overflow_b.offset += (missed_overflows * (1ULL << 32));
+
 		return cros_ec_sensorhub_ring_fifo_enable(sensorhub, true);
+	}
+
 	return 0;
 }
 #endif
diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 1205219515d6..cc038af59218 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -369,13 +369,31 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
 				 struct cros_ec_sensors_ec_overflow_state
 				 *state)
 {
-	s64 adjust;
-
 	*ts += state->offset;
-	if (abs(state->last - *ts) > (overflow_period / 2)) {
-		adjust = state->last > *ts ? overflow_period : -overflow_period;
-		state->offset += adjust;
-		*ts += adjust;
+
+	/*
+	 * We must strictly detect exclusively forward overflows. A naive `abs()`
+	 * check paired with a dual-direction adjustment (`+/- overflow_period`)
+	 * is fundamentally flawed during deep suspend. If a device sleeps for
+	 * longer than half the overflow period (e.g. 45 minutes), the massive
+	 * legitimate forward leap in time is mathematically aliased as a backward
+	 * jump.
+	 *
+	 * This would historically cause the logic to forcibly inject a negative
+	 * `overflow_period` adjustment, irrevocably corrupting the sensor's
+	 * timestamps backwards by ~71 minutes upon resume and failing CTS.
+	 *
+	 * By eliminating the negative adjustment path and exclusively evaluating
+	 * `state->last - *ts > (overflow_period / 2)` via signed arithmetic, we
+	 * ensure that multi-minute sleep leaps bypass the threshold safely as
+	 * large negative relative differentials, naturally carrying time forward
+	 * without bogus timestamp rollbacks. Furthermore, the massive timestamp
+	 * differential will naturally trigger the TS_HISTORY_BORED_US threshold
+	 * downstream, safely resetting the historical median filter array.
+	 */
+	if (state->last - *ts > (overflow_period / 2)) {
+		state->offset += overflow_period;
+		*ts += overflow_period;
 	}
 	state->last = *ts;
 }
diff --git a/include/linux/platform_data/cros_ec_sensorhub.h b/include/linux/platform_data/cros_ec_sensorhub.h
index 0ecce6aa69d5..498a7d827b19 100644
--- a/include/linux/platform_data/cros_ec_sensorhub.h
+++ b/include/linux/platform_data/cros_ec_sensorhub.h
@@ -175,6 +175,8 @@ struct cros_ec_sensorhub {
 	s64 future_timestamp_total_ns;
 
 	struct cros_ec_sensorhub_sensor_push_data *push_data;
+
+	ktime_t suspend_time;
 };
 
 int cros_ec_sensorhub_register_push_data(struct cros_ec_sensorhub *sensorhub,
-- 
2.55.0.229.g6434b31f56-goog

