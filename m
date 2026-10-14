Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D084A1DE8
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963820; cv=none; b=ie2ZgnK+95U1bNvRKOfBtGHe4mGMuJrr333CaX0CubdNvsVIPTCyK13575i45tqwjhm8olmiliObJuEUu8pQtObbEyiB+rGsSRVoBXV9AUpPslV6tda/YVm4E2GB+a6jtPW8qnj8moeEhk8tY2ird3ZtUmFOG6XaFFco81YXLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963820; c=relaxed/simple;
	bh=T0n2ouovgv/ANZ+sKOzeqhgDUXUtz1vNRVdwqMlGgV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fyr2ohhCYltGMexoa+tovrjpY1edrmL9vscCMboqufBJCzJV/AwHDiE9lIzI7VqfjxYa0BGDntg4fXxPwitreZ2rEP2Dar+LaGpmM/C+nNO3FtfcxQb7KZD6u3BjdaYBZWJQGDpgpo0515rcn3bka9y1lXKJ10EZy3XcsoZoigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YqPpQdj0; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YqPpQdj0"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8886059d3faso6986999b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963805; x=1792568605; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JzEH+K8H2QFw8M3MXaqtTAIBoB/2ddNSJwxJV/+hC14=;
        b=YqPpQdj0pfjq2RGOLL6mtsnZw+uHM1oamhEUbgs1JlSCeYM4ZVQqnamE2VjaZLXBUq
         g36kR9viuoh4e5pVx5+qroL3iOBFTX19PKKgcglO3Z7Abe6lng2ZY5qASXEgMG4zt5Xs
         AskAHX9xmLJun3XMYf8hYEgDGgDb/ZbkxI7YNhXMiCaeEgtPHtCuDZz01+zguHeX4Uzp
         C1jCA/VorK+xwa07UyO4RbpKRCYP2m5qesTHAZzVaT5DOZyN080tuhb65BHvzENN9KuC
         /Ln1umZ57GNFSddXIJIYRPFDOQXNwbGQQHgccOBzWt9uDTkv1w6EOtNczTyVv3+Xkp8r
         rbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963805; x=1792568605;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzEH+K8H2QFw8M3MXaqtTAIBoB/2ddNSJwxJV/+hC14=;
        b=0KaVEARzw7To4ASWWmcRc4c7+rLcuSITnvZ2fzEJgWj8lgFv0/mKNGf64d5kgj0PSh
         Rqm6b6ojtfy4NgezxKC0vfjR7NraxqxrupLcA+LGvK5aX/0zOs4lKiTkQGraZn1mZglm
         UocSV3UwI4gAGyxZhDIqJJRxqOpfm/cdMrSPyPl9E9SiBGy+qAvWNN2Y9+FNu67kdanh
         Lj6wc4qeBFC8+FG26e63kWuqqfgCQOJtQnKgkN/x7ZlOVb0qC1OO71YYCO8z+ajGk6Uv
         H+b48BFaLzGcCi0R0vudoOQCcZ2tpiPKNJ+lSm0QooGa/vkDTvJMpPXScIUbHdB1kfyO
         YMMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3k4mk3HLWCCEEPnVgRBp/SR0Raj20b1L2reu/qSF3RBPnky+r1yHfLHhVHxEPDxWUXEcRQhbeaj5dp7KCy0c=@lists.linux.dev
X-Gm-Message-State: AFq9FYLINZK7PWgZUYrr5TtmoDrdGv3qz2brCyVq5j+GU6Xl1fRz92sv
	1PW5S/t2Hjv7koLnnp1ihc+At256aQHdCZ8HOKhWO8rJJ1xAljm4ytyXydGsdyJ+x1zR9vFpYjp
	l1VkZ3Rx2ZCqmRA==
X-Received: from pfbic9.prod.google.com ([2002:a05:6a00:8a09:b0:88b:cb5b:e6a3])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:7081:b0:898:b925:f467 with SMTP id d2e1a72fcca58-898b925f78bmr7683758b3a.6.1791963804430;
 Wed, 14 Oct 2026 00:43:24 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:04 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-5-sgsatyam@google.com>
Subject: [PATCH v5 4/6] platform/chrome: cros_ec_sensorhub: Reset TS filter on
 ODR or mode changes
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Detect Output Data Rate (ODR) or mode transitions (such as switching
between active streaming and low-frequency batching) where the time
delta (dx) between consecutive interrupts changes by more than 10x, and
reset the timestamp filter history. This prevents mixing noisy active
streaming samples with larger batched intervals in the median filter.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index ea70847c8792..4d814e2d7297 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -280,6 +280,21 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	 */
 	m = clamp(m, -MAX_M, MAX_M);
 
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
+
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
-- 
2.56.0.385.gd3acb90ef8-goog

