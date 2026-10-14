Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52247492199
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963813; cv=none; b=c2c184MXQes29nqW938CtVWxz4lsJlrIzu9aVu7ogEIMYarrHn8cOTkZWjkgSbVTca7kFANB1/afCh8JtENTZ6mfKpNMj+1v3UofgXYE3W0dmI0mHwP0frr/JJT0Ob2oT/JEb/s88ASFOie2n4xlZSy4RA2aExd+Z7LBz1Mv3Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963813; c=relaxed/simple;
	bh=zyjkF5/Ad5t7CvGI5FdYL+hX0iTuykURhhzBTr3tqM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jOMl1iOq0UW7n6ji6CwWr+cM/r9O+CsSLjHz0deWFlNlOCKxjdUnzgB72BsswHjV0Gt4lzxuNzssW2Y6XIQ7Lk/NpNfDIZukrHSTpKcWalcgD3vXxPmgSjDhKaIjJlJvfBlQKXwbYwiM3Dcrhs9hWSut8YokcdjVD45vyA83UKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cPOXp2eq; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cPOXp2eq"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so3351389a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963802; x=1792568602; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIVt9BVi0XguXmpf1bgGCA61KaaAxHBBXKE+OEWvgQo=;
        b=cPOXp2eqJOeV6vi+on5r3z/bLNyRL+Rme/ORUKyQP4goOCdtCr+pk73JavMfkCGzwn
         povqJYxCr2xvsIkFzkumbdT2PZVPqSrAA7Z3wUWhNDsn/KeFd2gzJKBf8ehyExsIXF+S
         Gp+VWJ+XR3eZYSe25tldyZFv6U8s+hht01rqh/wDyV1FjRGtpRv0GHHXis4gpYCkB7Mw
         widzAsF2Bj5hGn127m0a2kS2f+gFHwOSaYsjDCeotXilibkKr9DMfeasBCh2mwaFr3u9
         akEqLk6i1XD1+V4yftblJibJgb8KfFH6STTj9l8DU62jl2v4XcWtMVURrkFQvyjQ+gZI
         Trxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963802; x=1792568602;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIVt9BVi0XguXmpf1bgGCA61KaaAxHBBXKE+OEWvgQo=;
        b=IDIc0tQU7wMCoJnLYN+9TwSJigSg6KacFKX6eNm/0c4+LMZ3CRQ+FI9Bm3XmGuSY8d
         V5WWyRvFqKca2SlKo7BWZtgqVzSIyfFzsmbmHMjfW94Nzcj2TWnw3AM7cUtnmCRRi+tb
         04MOm/O6xLPxW4heoAZwYtZtOJB4uM1c7FuBHOpFbLruyC5yjW5HZcf3MyFp3cCNdck1
         vnwLy83UOoGoKG/A/9sxssb/NdVUJHUHf44E0zCy/CdgjIMXcfhwxqBSAfsa3WgNw1sW
         1a4SxegFt7CRTDRGKOojG41JtlbpRwTPQoB1wXFFSYvmUEe400vmZpR9tLzmaTsbpfOZ
         qBXA==
X-Forwarded-Encrypted: i=1; AKwUvByVqmYB3sfbh8pk1y8+btcNOo6bhtPkGgUZFMPmCDRTGy7kcXJ8Rse0ED0/X/d9Bt6Hingp5PrfRqsFXCUNRYk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIBV7zd/WS8c0H9w8VUMbntJabuqRpdSC8LG1erhn6gio96Afym
	DZdGPwmXrmPaDxFrWrK9geXi+zEMVAj563Ntwc45LmOVNAPEISHo7i1gNuMz8Tvef6oB5XWFzpu
	iLNKcBTTEZnSJLw==
X-Received: from pgct3.prod.google.com ([2002:a05:6a02:5283:b0:cc7:e894:d737])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:329c:b0:3de:6172:e340 with SMTP id adf61e73a8af0-3e1650179efmr10226180637.38.1791963801984;
 Wed, 14 Oct 2026 00:43:21 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:03 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-4-sgsatyam@google.com>
Subject: [PATCH v5 3/6] platform/chrome: cros_ec_sensorhub: Clamp clock drift
 slope to MAX_DRIFT_PPM
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Temporary interrupt jitter spikes during sensor batching can produce
extreme instantaneous drift slopes (exceeding 20,000 Parts Per Million
(PPM)) that corrupt the timestamp median filter history and cause Out Of
Order (OOO) sensor events.

Clamp the calculated drift slope m within +/- MAX_DRIFT_PPM (5000 PPM)
so the filter can track expected clock frequency drift across both
Integrated Sensor Hub (ISH) and standalone Embedded Controller (EC)
configurations (which can drift by ~2,500 PPM when running on an
independent crystal/PLL), while rejecting large interrupt jitter spikes.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 6975592c6b05..ea70847c8792 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -22,6 +22,8 @@
 
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
+#define MAX_DRIFT_PPM 5000LL
+#define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000000))
 
 /* Only activate the filter once we have at least this many elements. */
 #define TS_HISTORY_THRESHOLD 8
@@ -271,6 +273,12 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		return; /* we already have this irq in the history */
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
+	/*
+	 * Clamp the calculated slope to a realistic range (+/- 5000 ppm).
+	 * Temporary large jitter spikes can produce huge slopes (e.g. +/- 20000 ppm)
+	 * that would otherwise corrupt the median filter history.
+	 */
+	m = clamp(m, -MAX_M, MAX_M);
 
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
-- 
2.56.0.385.gd3acb90ef8-goog

