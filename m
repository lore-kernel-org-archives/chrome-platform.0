Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266150;
	b=nUn3mk58u/UzSrPa1/8IOMO+OVT1TXf1rAt8CmmAdQcOkygHhiJHoO0TqGpoZtfgDCTH
	 Cvy84//lRVsZG6B8HOSUUlIcM+U+dMlqGWoPBht+wLNwc/MdItvg44RVBaaQF59C3N1xk
	 Ko/2aFMXk+kvLtwsPVmkQuJiksIe8t1KntGi6mqmZ/Qv9mZUwmzcwigaU83z8tlFmv6Q6
	 C1wUFS0nMqlZ7WqtmZ+B96zWBMvCJHlDvwQuaZRqPnc+YUHhvNimvGHwaC+QrJ6igRUd/
	 UKOeb7wGue5pQ2rom1X1QxlyNBovkf1T6z8C4ctohtlsmOMZtCZr0mPU8S2u+wD3sFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ycqENo9iFn1fB3/PbhnzHQ31SR6DjuNYTFe+/vKTYzI=;
	b=SyFF/Ua+GDTLn4G6NrqAg7ikZl6sj6Ugv3bI5vl6cpeZksotj9b2zLQXg37cY6tb3QJS
	 nSAT5n7FcRam1uNRvrTZJybT6sWl0/V8dXRIJ2czaMpwWOQeWE0ALH4APHVsfPCtQMia9
	 yhffEist9ITyDD97nzJthzF080wDT2sr2F1/L3IOHir5vUZjfq45lB6aYAcrIhMLv5anX
	 BCR4UG4cbfElqtLlKxRVDn4vw5Sj0MEiTJqxRrZqPYbt17iLkMv5e7F9YzfHaG2Hmc7Ti
	 BbeciJ+42DeQBb5k7/R/rwWiZXenld0bAzmeQ/+vVGmnU6Le8geaRBDRKwXIzANdciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NJ1csf0S;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BCF606A322
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88BCF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NJ1csf0S
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so687699a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266150; x=1793870950; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycqENo9iFn1fB3/PbhnzHQ31SR6DjuNYTFe+/vKTYzI=;
        b=NJ1csf0SIlSXS0Li5HujHZNTdo6F6qHguN2bERr5kbWUbxIOi2lg9My+yJT5nJLbRQ
         FjZkAwjTR1+3IvnjPJqxe6/sPxzctHvmolWNtEEbYW9Ridzus5Yzb1wOg7pnmFQYrXEP
         dIXZ2zoBh+GkpIvJ6ikOS9ZSp4qTnXiJt/YWax8JadHhVFleIcsZPxPN40xTo/ZXJdnn
         Ms21Hn+Edq/rYmeJox9ljbKQRodVBVd/u6DyJ6MdZF9Uiao25HE/XOqJhTMq/G/3JMjb
         fcteQXdbyRArN8ar8GtLNnOaehdfU1yHOfurzFvBAIRUKWuWwd1y7VjSGcjehIqhU1ln
         Qx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266150; x=1793870950;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycqENo9iFn1fB3/PbhnzHQ31SR6DjuNYTFe+/vKTYzI=;
        b=MuUVUxx9MLL23vqBdz8qSJNRwQqCezo3CnGqAgExdteLttsWkzkDfmrS3GgxTbkcwg
         XecUp9A0uTtw5iWejEAo0UXWkcqipqW/kJsUy+ljf3TnV2Gi32JB9LGrsNEnoIfibhI6
         S535E2SlVVcaNcn2+ytJfUSH01cJJDXbk0UexT4ntM510MJPt03lrFFz5+MwWUWvo0jd
         aiCOYgORzEo+hidWumA+eBAdKd/0JFJMchP2QSbKxn+dccIjW1HKd+58M5Gj8CLoHzU9
         X5L3eZrpYzD1XrNwDuj2x3q25PNvAb2gbYBEFzUVIWr8R9NwYnATtrvahwN/hkKVPgZY
         m/wA==
X-Forwarded-Encrypted: i=1; AKwUvBxYptXjZMee8yp1SM4Ap8ctKIUDSoONmMkdm1lY1VdWj90qmmX1j/fWa6Fm/h4w8d5tcMruXJZPe4lPjXgdF/Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYKSKWjf8rNoLjZCiiPSOX+8LeB0AtEJykNS89G9kdV3RRfgyHf3
	+xh5FMuzP83+N+25ErQjLXOB5/RICohAzWTFPdbAUhni2NJIj79grkXGChov4PoPy7SIwIlpGj5
	5M8HtD6Nm76lx5A==
X-Received: from pgbx22-n1.prod.google.com ([2002:a05:6a02:63d6:10b0:cd8:5a84:95f])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d2c6:b0:3a4:f75d:d1a3 with SMTP id 98e67ed59e1d1-3ae5809fe31mr3556717a91.32.1793266149676;
 Thu, 29 Oct 2026 02:29:09 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:45 +0000
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
Message-ID: <20261029092846.1567475-7-sgsatyam@google.com>
Subject: [PATCH v6 6/7] platform/chrome: cros_ec_sensorhub: Increase
 TS_HISTORY_BORED_US to 2s
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Increase the TS_HISTORY_BORED_US gap threshold from 0.5 seconds
(500,000 us) to 2.0 seconds (2,000,000 us) to accommodate normal sensor
batching flush intervals (which can be 1 to 2 seconds long) without
repeatedly tearing down the timestamp filter, while still resetting the
filter across actual long idle gaps or suspend.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index cec33a7..ef20aac 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -36,9 +36,13 @@
 
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
+#define TS_HISTORY_BORED_US 2000000
 
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
-- 
2.56.0.307.g5fe7bd680c-goog

