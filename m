Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C929B36B912
	for <chrome-platform@lists.linux.dev>; Thu, 23 Jul 2026 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824592; cv=none; b=h4jsLZfcGmzu5bwKet/vT02tZlQLR5CuNRZ7Fe8c1Goj/uaLxuxhtZgS2JYEHV7ub0lQDYGJalfZoxwNiHzcJR3uSJyyVOdRyqhq+iDslqK71W2drdmF8+9rhzpWbphkBtcN99qloiFNc5dOJMN3ThfcCYP40nNqTEqe5ILwO0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824592; c=relaxed/simple;
	bh=69ucCLD6XVGFTpO+yIeag7uhGDoIcyMY0JMqrJIXWa0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hw6G+grXCrf3K7tCUM+7pIPQyQwSeUQiB/c1ulL/juJj4Gqw2CwDlizLMJCvLm8s9g8P3PqzCFAYF3gj1FJD3qcPCUddBlUbv34UGhZHBEumVAuNAkHEG8qOoX+rx2lPIkHomQNygEEZstkgH/utq07HTf+2AlAPG2WQiuIt3fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SGAFJU7s; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SGAFJU7s"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380b630c505so1222488a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jul 2026 09:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784824590; x=1785429390; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkb7ASztyLUBgOy6aITp26iyrYap6j/8emIp6NYaz98=;
        b=SGAFJU7sfs6SBuVktUD/5D+mKFa2bbtUxc3z8O5xeKKTjIcF9WoBjklNpinip6sF7o
         3bb6J2V7yBmJxGC+gATyp4bZ1f5VfD9CBlCT7hhjtqO36F+6gaYeGMnQC10sCMtJ0sf/
         K0mWyz0IBX8G0wzZvNCJSocNrjsAY4878bnjoBUWhAB8ahHJ+EzYV3ORixyxzCO7HxXn
         AYCnJhwpUpetApa/J+5uibJ2y5BaLFWUT98lhB6oHq23HfFYq5hy+pPN8vCHL8sy3dgJ
         hbvZ0m1aMtzdgBDVl7EAX4Ed6hW+f65cRkHDfl2dG4bCgrrUz0l4+7v2VbSrf0MqTDDV
         6EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824590; x=1785429390;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkb7ASztyLUBgOy6aITp26iyrYap6j/8emIp6NYaz98=;
        b=hrnGm5KSPrJm7bPpREUioDK7jrlTZuWfq/BXcsx9VXyJefjCSNaKTJ0xl4MqNJ/RKY
         TMMjWWV5o4smU/L55iM4n9phiMZchCIVkmzXiaSh43PCug1bq7zulN9ZmTyxaWGok+1q
         NtKZshU43QbmVtMe9UyhytbMIgpUQvi++y8VZV3Owb5KcRwPjuryyedRNHdAiRX7JMfb
         sVWLxKbkspH/nl2Wc2T5r2gyZQTh4WVMqyPfUGupUxUdCkAme66Hxu4SdfVIayRJO55D
         78XuI52QX7+fwNOh0Bhe5Q8ihSQJhjiCbNw9+84hh9VsGtfwfIzPMoCrcoly3LoJOS0K
         DtKg==
X-Gm-Message-State: AOJu0YxZoGcuvmbJajg5vcw/x2VgsGXdfP+2wlDs9n/+0CGVGdJyg3mR
	5azLJ9zPar92DmWvWgm3sGnFLVbGMiCIXlBAuEKW5AcUQEn5tKLp6CmclOYg8Kk5qY8pQRBwCY/
	RBEJvvseB/DvzyQ==
X-Received: from pjbpi17.prod.google.com ([2002:a17:90b:1e51:b0:38e:b9dd:4f3f])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d01:b0:38e:c0f5:7c4 with SMTP id 98e67ed59e1d1-38ec6a79e31mr3768567a91.30.1784824589900;
 Thu, 23 Jul 2026 09:36:29 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:36:28 +0000
In-Reply-To: <20260723124824.1416675-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260723124824.1416675-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260723163628.1695182-1-sgsatyam@google.com>
Subject: [PATCH v2] framework/chrome: cros_ec_sensorhub: Modify clock drift estimation
From: Satyam Gupta <sgsatyam@google.com>
To: bleung@chromium.org, tzungbi@kernel.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	scollyer@google.com, sgsatyam@google.com
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

This CL makes 5 specific changes to the clock drift estimation algorithm
and timestamp filtering to resolve monotonic backward skews and OOO errors
during batching:

1. Clamp the calculated drift slope (m) to a realistic maximum bound
   (+/- 200 PPM). Huge jitter spikes previously produced astronomical
   slopes that corrupted the median filter history.
2. Detect ODR (Output Data Rate) or Mode changes (where dx changes
   by more than 10x) and actively reset the history. This prevents
   mixing noisy active streaming samples with larger batched samples.
3. Increase the TS_HISTORY_BORED_US gap threshold from 0.5s to 2.0s
   to accommodate normal batching flush intervals (which can be 1-2
   seconds long) without constantly tearing down the filter.
4. Correctly bound the array index logic during history propagation
   so we cleanly drop the oldest elements without array overrun.
5. Fully drop out-of-order samples to guarantee monotonicity instead of
   clamping them to the last timestamp. Clamped samples previously caused
   stale artifacts downstream during identical timestamp spreading.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: SATYAM GUPTA <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 71 +++++++++++++++----
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 1205219515d6..3f57513b4d5f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -22,15 +22,21 @@
 
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
+#define MAX_DRIFT_PPM 200LL
+#define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
 
 /* Only activate the filter once we have at least this many elements. */
 #define TS_HISTORY_THRESHOLD 8
 
 /*
  * If we don't have any history entries for this long, empty the filter to
- * make sure there are no big discontinuities.
+ * make sure there are no big discontinuities (e.g. after suspend or long idle).
+ *
+ * This is set to 2 seconds to accommodate normal batching flush intervals
+ * (which can be up to 1-2 seconds) without constantly resetting the filter,
+ * while still ensuring a reset occurs during actual long gaps or suspend.
  */
-#define TS_HISTORY_BORED_US 500000
+#define TS_HISTORY_BORED_US 2000000 // 2 seconds
 
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
@@ -259,7 +265,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	s64 m; /* stored as *M_PRECISION */
 	s64 *m_history_copy = state->temp_buf;
 	s64 *error = state->temp_buf;
-	int i;
+	int i, start;
 
 	/* we trust b the most, that'll be our independent variable */
 	x = b;
@@ -271,13 +277,36 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		return; /* we already have this irq in the history */
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
+	/*
+	 * Clamp the calculated slope to a realistic range (+/- 200 ppm).
+	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
+	 * that would otherwise corrupt the median filter history.
+	 */
+	m = clamp(m, -MAX_M, MAX_M);
+
+	/*
+	 * Detect ODR (Output Data Rate) or Mode changes (e.g., transition from
+	 * active streaming to low-frequency batching). If the time delta (dx)
+	 * changes by more than 10x in either direction, reset the filter history
+	 * to prevent mixing noisy active samples with batching samples.
+	 */
+	if (state->history_len > 1) {
+		s64 prev_dx = -state->x_history[1];
+
+		if (prev_dx > 0 && (abs(dx) > 10 * prev_dx || prev_dx > 10 * abs(dx))) {
+			state->history_len = 0;
+			m = 0;
+		}
+	}
 
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
 
 	/* Move everything over, also update offset to all absolute coords .*/
-	for (i = state->history_len - 1; i >= 1; i--) {
+	start = (state->history_len == CROS_EC_SENSORHUB_TS_HISTORY_SIZE) ?
+		state->history_len - 1 : state->history_len;
+	for (i = start; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
 		state->y_history[i] = state->y_history[i - 1] + dy;
 
@@ -380,7 +409,7 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
 	state->last = *ts;
 }
 
-static void
+static bool
 cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
 					     *sensorhub,
 					     struct cros_ec_sensors_ring_sample
@@ -388,17 +417,27 @@ cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
 {
 	const u8 sensor_id = sample->sensor_id;
 
-	/* If this event is earlier than one we saw before... */
+	/*
+	 * If this event is strictly earlier than one we saw before, it is truly
+	 * out-of-order and must be dropped to preserve monotonicity.
+	 *
+	 * We intentionally allow duplicate timestamps (==) to pass through here
+	 * because the EC/ISH may report a batch of samples with the same raw
+	 * timestamp. These duplicates are required by the downstream spreading
+	 * logic (cros_ec_sensor_ring_spread_add) to interpolate unique,
+	 * monotonic timestamps for each sample in the batch.
+	 */
 	if (sensorhub->batch_state[sensor_id].newest_sensor_event >
-	    sample->timestamp)
-		/* mark it for spreading. */
-		sample->timestamp =
-			sensorhub->batch_state[sensor_id].last_ts;
-	else
-		sensorhub->batch_state[sensor_id].newest_sensor_event =
-			sample->timestamp;
+	    sample->timestamp) {
+		return false;
+	}
+
+	sensorhub->batch_state[sensor_id].newest_sensor_event =
+		sample->timestamp;
+	return true;
 }
 
+
 /**
  * cros_ec_sensor_ring_process_event() - Process one EC FIFO event
  *
@@ -529,8 +568,10 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	for (axis = 0; axis < 3; axis++)
 		out->vector[axis] = in->data[axis];
 
-	if (sensorhub->tight_timestamps)
-		cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out);
+	if (sensorhub->tight_timestamps) {
+		if (!cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out))
+			return false;
+	}
 	return true;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

