Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266135;
	b=Py9NXCpGIGk+zSFdfDHq/D+hOZLdS+ENUFn5Hbvoe0YONdTFrvJzqWbs7yySzCwvvsJs
	 ULjX2FAsasEXE2kl+r5GERZ+4zjdir0HZzMo4JT4ITn3sy7SwIr1BOyvVugpEQ8OsOsTL
	 KB6cV/vMLRQ/b7/pB74aKZn1kWDolYhGWBYn267b3ysyu+Kuv+v3FjA2eIqk9jH7q4t16
	 0geRbo6mjGAL0xGmxR10xn/fgcaDn5eURsFV99QqGEmYjYk1VmUKYzOQ5z0sxWvMH8vuk
	 +S3HSwsJUFHlfhQ3wtV+avOhylrDao0eUDhaAhfC95LHYum1pCdlwcBFdcUoxueXyAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RnDihmKxpybwQ3lflW2lkaGbP/R8N59IQ6Lqmj7g01A=;
	b=BD5Ht94biz1wYzGXukGJbp2oIZakw5qtpM1yn/i/3rUuXe8pDuu30azpNngAdBlwuWUU
	 x8b65CPDResrRcRalBJo6RDzYWpL+uDqzXUR+7WAfJ1bpguSjZcyDaoMsmf/IAzdqGy4H
	 EpXqbBlcZ/CvpI6fMcarY3+mRajVIbXXLYL5pc6SokMXxghzVwVuJVJzmcvRy6z2coVVm
	 CsWk6TSmayAyMCIY8trdOFrht8ROD8sbguQRLGRJjV3+tEYGV95bC7lvQhYb4qsWtQuyH
	 /QwDwBD01y4Fkket6V0LJCAhX+Rib/K0oFKg4Iq4+CkitfiafsvOARm60r7svjaYVGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VqEN19kh;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CD606A325
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862CD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VqEN19kh
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so1577168b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266135; x=1793870935; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnDihmKxpybwQ3lflW2lkaGbP/R8N59IQ6Lqmj7g01A=;
        b=VqEN19khMt/mQBNbyOip1K+3bv99kViL4GFKlxmIzQnJI8PybAQPPj5cNp0U1c3E3B
         RIQ2PRKaWZze5TKGlX7sz0aU3zD2r5BHbd4CYCTccWFfZhxVZwhvVCdaG/ZWg3apj8DQ
         3OjV+ozs4iUfkp/bt/HgNIMsDTTtRi7ULe4nZszxpZm4/x5OOHJlxPvtfLQ4mViWJ1LL
         4/yUVfsP2y+FyhBSxjEN6fJMCeDN6tdcQyXfLBuLyo2Som9637y2da6q1ulc2m+ITJlK
         ZCBxqygmnfUhoBjBNbiZ44I6sd8znq+TKirT9lwdqGga+7LDL7WpBavsR9lPmzb3l0VM
         xaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266135; x=1793870935;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnDihmKxpybwQ3lflW2lkaGbP/R8N59IQ6Lqmj7g01A=;
        b=KWGk4sV57gHhjSheum2osquoDb/pMcDfHGjXh93oEFeP69trVhYzS43LF+D2NdD4gI
         XlMUq7YL3EkCgsayHVPgJ8seAko/y01K/DwP63oHu4tAUl6r9+UjhXHjFPAm52wPtDhp
         hk+yr1U2G1+kyP1ybK2mqWraEatgNf7sDRs69Cp53+mUUTQej5dPDNXJcP+Y0+wRBHhh
         9lhVHmP3SZ307ZIumDdiqdtgeB+dRo1VdjiJLHdAXkvigki9omPzHambhWYzmyQ7g2wk
         qhm6t3xLCeqQ4khxEL0lWBGc+lEHATbGjUAbfhO311iz5rZ44shilI/E3E10hFnsOuZX
         2wwg==
X-Forwarded-Encrypted: i=1; AKwUvBy1/sSgicHoIjUuxJKojvti8LVUo+E1yJsrC+HwzD7g/jqmGCGn5gNgo0iL1Mse1G5bqZGjerydIbTi3VjxCO4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJUZRW2lKcMmZqPwb0k4OjgwrA9xNeJflHXBtjb58o47pGluVfo
	uO47w+aKhSgE3yt2Rlc7AJgdCpRwMTOXvam16dYrXb5kcwO3xkDVrd+KhydP9eLUf1P6ZD5K3dQ
	KoKGGCNw+bEXcQA==
X-Received: from pfud20.prod.google.com ([2002:a05:6a00:10d4:b0:89f:92b2:3fc9])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1d99:b0:886:ead5:6d3b with SMTP id d2e1a72fcca58-8a6e81b6fe8mr3914906b3a.53.1793266134660;
 Thu, 29 Oct 2026 02:28:54 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:40 +0000
In-Reply-To: <20261029092846.1567475-1-sgsatyam@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261029092846.1567475-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029092846.1567475-2-sgsatyam@google.com>
Subject: [PATCH v6 1/7] platform/chrome: cros_ec_sensorhub: Unwrap sample TS
 relative to FIFO TS
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

The EC reports the sample timestamp (a) and the FIFO interrupt timestamp
(b) as 32-bit microsecond counters, which wrap every 71.6 minutes. They
are unwrapped by cros_ec_sensor_ring_fix_overflow() with separate states,
assuming that two consecutive values are less than half a period apart.

After a longer gap without events, for instance across suspend, that
assumption no longer holds, and as a and b are not taken at the same
time, one of them may be unwrapped to the next period while the other is
not. The AP timestamp of a sample is computed from b - a, so the sample
timestamps are then off by a whole period, about 71.6 minutes, until
another gap happens to realign them.

Derive a from the unwrapped b and the raw difference b - a instead, so
that a and b always fall in the same period. A sample can be taken long
before its FIFO interrupt, when it stays in the FIFO during a suspend,
but only slightly after it, when it reaches the FIFO before the FIFO is
read. So treat b - a as unsigned, offset by FIFO_TS_SLACK_US for the
latter case: a is then unwrapped correctly for samples up to almost a
whole period older than b.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 21 ++++++++++++++++---
 .../linux/platform_data/cros_ec_sensorhub.h   |  2 --
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index d92b602..7eb8841 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -35,6 +35,13 @@
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
 
+/*
+ * A sample can reach the FIFO after the FIFO interrupt and before the FIFO
+ * is read, so its timestamp (a) can be slightly later than the interrupt
+ * one (b). This is how much later it is allowed to be.
+ */
+#define FIFO_TS_SLACK_US (1 * USEC_PER_SEC)
+
 static inline int
 cros_sensorhub_send_sample(struct cros_ec_sensorhub *sensorhub,
 			   struct cros_ec_sensors_ring_sample *sample)
@@ -441,14 +448,22 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 		(MOTIONSENSE_SENSOR_FLAG_ODR | MOTIONSENSE_SENSOR_FLAG_FLUSH);
 
 	if (in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP && !async_flags) {
-		s64 a = in->timestamp;
 		s64 b = fifo_info->timestamp;
 		s64 c = fifo_timestamp;
+		s64 a;
 
-		cros_ec_sensor_ring_fix_overflow(&a, 1LL << 32,
-					  &sensorhub->overflow_a);
 		cros_ec_sensor_ring_fix_overflow(&b, 1LL << 32,
 					  &sensorhub->overflow_b);
+		/*
+		 * Derive a from b rather than unwrapping it on its own, so
+		 * that both always fall in the same overflow period. a is at
+		 * most FIFO_TS_SLACK_US later than b, but can be up to almost
+		 * a whole period earlier, when the sample stayed in the FIFO
+		 * while the FIFO interrupt was disabled, e.g. in suspend.
+		 */
+		a = b + FIFO_TS_SLACK_US -
+		    (u32)(fifo_info->timestamp + FIFO_TS_SLACK_US -
+			  in->timestamp);
 
 		if (sensorhub->tight_timestamps) {
 			cros_ec_sensor_ring_ts_filter_update(
diff --git a/include/linux/platform_data/cros_ec_sensorhub.h b/include/linux/platform_data/cros_ec_sensorhub.h
index 0ecce6a..96eaad2 100644
--- a/include/linux/platform_data/cros_ec_sensorhub.h
+++ b/include/linux/platform_data/cros_ec_sensorhub.h
@@ -127,7 +127,6 @@ struct cros_ec_sensors_ts_batch_state {
  * @fifo_info: Copy of FIFO information coming from the EC.
  * @fifo_size: Size of the ring.
  * @batch_state: Per sensor information of the last batches received.
- * @overflow_a: For handling timestamp overflow for a time (sensor events)
  * @overflow_b: For handling timestamp overflow for b time (ec interrupts)
  * @filter: Medium fileter structure.
  * @tight_timestamps: Set to truen when EC support tight timestamping:
@@ -164,7 +163,6 @@ struct cros_ec_sensorhub {
 
 	struct cros_ec_sensors_ts_batch_state *batch_state;
 
-	struct cros_ec_sensors_ec_overflow_state overflow_a;
 	struct cros_ec_sensors_ec_overflow_state overflow_b;
 
 	struct cros_ec_sensors_ts_filter_state filter;
-- 
2.56.0.307.g5fe7bd680c-goog

