Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8564E4C40
	for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889098; cv=none; b=I3TlqXDlwF0dzHIGztcmPN6ZUiVgFygI3CZENLxU3X1dV4wsd0D5S1sRqfHRiNbRnuuRNDwgzsdDa/yGFKHB/XgpYGWYwPrteEUnOnTL2vX3QKwW0cja5iudgeFSN+Q80F7feoMhneHdXwJfMElwo0ZIXA9wS74PpMZy76CVuDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889098; c=relaxed/simple;
	bh=rI+fqKv7600fLiPAe7ew1vwAqhZS+CfnUnyx8zEAd+I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XuBvIW39+rM5WkvVAJMVBfU/6wPMUCS2uT9uMzN2UOyngk8dxKJ6SEfjPB205+Q8yUP8GOfmoStVCFnzFT1me0xOPhAjskXPaI/kRX/5glwKsRYbVDSnLoJzoDxOyCaKBTKCf1x4vVPFWmbmph0SJYBOyPuLybfmVmtRdZ0uqY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Npm6fx92; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Npm6fx92"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c4da716f4so3933569b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791889089; x=1792493889; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRcero9yayxBQi9YH0PofTatbG/JTWtWWnUcUgbPRtc=;
        b=Npm6fx92HxkSAwdybySYBpzoK1INn/1dNVB9CfeuX5tx3GW8f5X2DuBU61VcbSvsZN
         qd7v0S3tYt/xkqmUM99jegPXIbg5kPnbfj16sXQHXjVwIP6GrmNsulCZgIVSYW59JB3J
         bBqV1RnZntZ71IUnJXplSdGWaoUAtbeE64rqrX6AzkaKgfu830wRfiUoOKQmUICcXdv3
         dhP/z9s3xmsya2jTEs4xSr0/2icbdUh1r6kD7amC0YQi9VuooD36laQA9BnjrwnO8ame
         g6BDZuqfW9iBCn6kHYc6hsX3bszO3Ua3GPz3a2orbN2zuYsK4nvh2Z4/5exTzQVyf2VN
         zSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889089; x=1792493889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRcero9yayxBQi9YH0PofTatbG/JTWtWWnUcUgbPRtc=;
        b=KSJRb5DFAf7iXPD1Mq2hQSh++7XF1jMk7vIG6EfoGT+RaiymNs6VaLL3wOG8nIyhtA
         /RtJ5dtNKEU1OKTe5CNh5eL1vjQd3D5zChHy4dW33YhEBywTiQN0YYjlUKcW2cZiND5K
         49es88figFstkyaufsCAKO4MNfqQg4qTDFCnWB9Y5aEwftkCHLBP8MeQhWFPzfbWjFLn
         06OEs49jAlEWFFE5WLtPXC5+7a7q2mHy/8Arl0Xxk43dxFNKqoz/FE1Xw19OthJukLap
         kxKFN49IZJNde7IGIIreV23HFCZxwU7uCRY4czsuRjLcUAYIiC7wY1PQiYoJ6AoFPO5s
         2iCg==
X-Forwarded-Encrypted: i=1; AKwUvBxccuz0uQ9PThiX2HJZFWjAefnIdfLU6e7lxsN2rO9ZCtBivKvZcZPmR07/5+eo4x7W4yY/DX5/8JCek/MsdxM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJdY+Snz0/yFKhusM6CRx7dng5EzoQICpmh8I6ZbLq1oKSFvElx
	psW6Qcz8jDLDgVHuM9YkJ25cZyCC7AQ51Wq7jXIRwsnZkxHu/2+ongg99UfqZUXZSBWIPOHYjAB
	Ivcxvkg0z/NgrcQ==
X-Received: from pfny22.prod.google.com ([2002:aa7:8556:0:b0:899:b329:6c57])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c5:b0:880:cb95:aa7b with SMTP id d2e1a72fcca58-897c7ccb939mr10758768b3a.35.1791889089043;
 Tue, 13 Oct 2026 03:58:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:58:06 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013105806.1371175-1-sgsatyam@google.com>
Subject: [PATCH] platform/chrome: cros_ec_sensorhub: Increase MAX_DRIFT_PPM to 5000LL
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

MAX_DRIFT_PPM was introduced to prevent large swings in frequency drift
estimation (such as batched mode interrupt jitter exceeding 20,000 Parts
Per Million (PPM)) from corrupting the median filter and causing Out Of
Order (OOO) sensor events.

The initial limit of 200 PPM was chosen based on platforms where sensors
are connected to an Integrated Sensor Hub (ISH) running on clocks derived
from the same PLL as the CPU. However, on platforms where sensors are
connected to a standalone Embedded Controller (EC) running on its own
independent crystal/PLL, the actual clock frequency drift between the EC
and AP can be around 2,500 PPM. Clamping at 200 PPM is too strict for
these configurations and causes an accumulating offset error that
triggers sample drops and timestamp synchronization failures.

Increase MAX_DRIFT_PPM from 200LL to 5000LL so the filter can track
expected clock drift across both ISH and standalone EC configurations,
while still rejecting large interrupt jitter spikes and bounding the
worst-case cumulative batch error (~2.1 ms, well within the fastest 5 ms
sample period).

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 20fa47cbee32..a5215955470f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -22,7 +22,7 @@
 
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
-#define MAX_DRIFT_PPM 200LL
+#define MAX_DRIFT_PPM 5000LL
 #define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
 
 /* Only activate the filter once we have at least this many elements. */
@@ -278,7 +278,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
 	/*
-	 * Clamp the calculated slope to a realistic range (+/- 200 ppm).
+	 * Clamp the calculated slope to a realistic range (+/- 5000 ppm).
 	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
 	 * that would otherwise corrupt the median filter history.
 	 */
-- 
2.56.0.385.gd3acb90ef8-goog

