Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D34A0136
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963807; cv=none; b=UrvXGQnkxzH1B3cl/zXssje3BUt6r8I18rTGdGxdwvOwYH5OP97aYrTUwv9Mx4RcNzOUIKqJxCvW7PQrul8fxAjjTO5+uE12ewAAHMw+onQ4MF3YoqrrNMEJXhvV2SHJFoU+rmARIC7yzjf+bRF5wPGEVWZvOlyZ7iN+Pbk5pP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963807; c=relaxed/simple;
	bh=ZS71hUPkI/ZzO52MEAYoo6mpeL5VZT1U5WnEdVlvNqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FIAtdg+vkSpL/TY7xtCQ+GVWtnwYAmtf3PrcDj4kB2DaayX73QxdiAp7pCf3raV2JgUZPaSozegufiXmwHx0JA+YuR4UdCDYH1zXLyN+okmAkwDe5fdkyKvEuz20EmBDyUB0KZe8AU/1K+5AVeHmf+ttMfZMqjgxAFRaBHH77h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l19KX6UG; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l19KX6UG"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8886059d3faso6986816b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963795; x=1792568595; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAAJ9xwhtD02LHJkl/YA1PsBrgQEn+qnpmlU4tU13fU=;
        b=l19KX6UGcmb4UOdkTVY/y1EBxm90wmDUqcNv+KpCuelLMltsL3J1sXEG0sWAPOXJ8e
         85Er3/trAvdyJ9V7OwnThL53DhX0neotOOhczOfRqlrACiXRdPTuISkNsoaZzs9vJnvP
         qRkJacg5KXMY7HJiKKiZ9HJcy3j/e8AhHYWfFmVB+T5MKAaZIWy8UwIBFDIDdTo6c+Xy
         4NSF59tW5nQy1JZkT1V206WZZKAK66QRVV1LXU/dOeLc9ObcKPI8HIFOqhKUP2DC2XJG
         xpsdQf1Ru0hx2hfhyhPXDsnA9qPdKNfOg9QxT+5r3rE9ld3Djxqxe5YaHZeCYUHHVZ2C
         lFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963795; x=1792568595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAAJ9xwhtD02LHJkl/YA1PsBrgQEn+qnpmlU4tU13fU=;
        b=2qHGLxrIRyk0+Rn+W12NkBIHkMeefnifH9Yz4iFQEo4OKOfXWsT6jqcgN0iZg9vDul
         /3ZJKvjn6OohAURBNN5/yX/es1aPvAVrrAqscs0HzwL5R+nAfkPDCdju1N92w1GsIjNA
         1hjWGH9mH4ZhlLytLUVoSUJy6uyZpJA+k7zYZj4DN1HRuRhBE/S/L8hbNHQBCRJ4Kd+O
         JvRHGiXJkMszs6TKxDdgRGBcmGChIiBYN30INATG59aEegJFcfEWE0jBer9+FNg8H1nj
         nT/DSMoOM4mGXKomW3cJhy2yFQa/hwZvpOk9RhkHozX2PbRTUvPZ1A3o9tZyyTrlN4on
         80HQ==
X-Forwarded-Encrypted: i=1; AKwUvByLY0w1ob4tZEbPo0zsh2G6OaSlRwjdSBC5YHg+k0dJK+9nPcY6Qx8qyNHnrR8vT+lRKqWgWO+9W4Cb6uZncdQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYJu6bb8/Hflj5FTXMYK0FEOC6+/RHV2U6M0OtdO0zNX0Rz6L5L2
	KNmvZZQeDaPH6+52ZO2eyqZrZwNR6HIeBom0pukxvBe3HPObDXdrWdEAnTJNAorU4OFJ6wzjghD
	6Im2VDfrJSBlwIA==
X-Received: from pfbbj3.prod.google.com ([2002:a05:6a00:3183:b0:897:ada4:5702])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:893:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-89a19ae138fmr8309158b3a.38.1791963794722;
 Wed, 14 Oct 2026 00:43:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:01 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-2-sgsatyam@google.com>
Subject: [PATCH v5 1/6] platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

When the AP goes into deep sleep, the EC physically continues executing
and silently wraps its 32-bit timestamp counter one or more times.
Because Linux natively advances ktime_get_boottime() across suspend,
the AP clock leaps forward but the incoming 32-bit EC timestamp
appears historically delayed.

Calculate how many 71.5 minute epochs were swallowed during sleep by
dividing the AP's recorded sleep duration against the overflow period.
By injecting these missed wraps directly into the running EC offset
tracker, the EC timeline snaps forward instantly and achieves parity
with AP boottime, avoiding fatal negative delta time-skew calculations.

Any massive suspend gaps (>500ms) inherently trigger the
TS_HISTORY_BORED_US fallback during the first post-resume sensor event,
scrubbing the poisoned clock drift data. Because the clocks are
explicitly resynchronized by the math above, newly arriving samples
remain valid and are delivered without being warped by stale filter
history.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub.c   | 37 ++++++++++++++++++-
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 30 ++++++++++++---
 .../linux/platform_data/cros_ec_sensorhub.h   |  2 +
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index 31fb8bdaad5a..5644ff4f8a90 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -227,6 +227,8 @@ static int cros_ec_sensorhub_suspend(struct device *dev)
 	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
+	sensorhub->suspend_time = ktime_get_boottime();
+
 	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
 		return cros_ec_sensorhub_ring_fifo_enable(sensorhub, false);
 	return 0;
@@ -237,8 +239,41 @@ static int cros_ec_sensorhub_resume(struct device *dev)
 	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
-	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
+	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO)) {
+		/*
+		 * The EC's 32-bit hardware timestamp natively rolls over every
+		 * 71.5 minutes. When the AP goes into deep sleep, the EC
+		 * physically continues executing and silently wraps its 32-bit
+		 * timestamp counter one or more times.
+		 *
+		 * Because Linux natively advances ktime_get_boottime() across
+		 * suspend, the AP clock leaps forward, but the incoming 32-bit
+		 * EC timestamp appears massively historically delayed due to
+		 * the lost silent overflows.
+		 *
+		 * Calculate how many 71.5 minute epochs were swallowed during
+		 * sleep by dividing the AP's recorded sleep duration against
+		 * the overflow period. By injecting these missed wraps directly
+		 * into the running EC offset tracker, the EC timeline snaps
+		 * forward instantly and achieves active parity with the AP
+		 * boottime, avoiding fatal negative delta time-skew
+		 * calculations.
+		 *
+		 * Lastly, massive suspend gaps (>500ms) inherently trigger the
+		 * TS_HISTORY_BORED_US fallback during the first post-resume
+		 * sensor event, scrubbing the poisoned clock drift data.
+		 */
+		u64 sleep_duration = ktime_to_us(ktime_sub(
+					ktime_get_boottime(),
+					sensorhub->suspend_time));
+		u64 missed_overflows = div64_u64(sleep_duration, 1ULL << 32);
+
+		sensorhub->overflow_a.offset += missed_overflows * (1ULL << 32);
+		sensorhub->overflow_b.offset += missed_overflows * (1ULL << 32);
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
2.56.0.385.gd3acb90ef8-goog

