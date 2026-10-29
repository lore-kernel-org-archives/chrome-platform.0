Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266139;
	b=SyUul9r2hdB4eNHpW7bIEne3WGxekIJOwebllxioR005uKcrDbcNc/CJ1IV3j/79HYb+
	 yQ3lhl4jnLaYCjxJNpBx/UV4vXNNBdM1o9AnTdPU2Gu4J6GJGikD31a1bR0F4svXq+VFT
	 IyW/0gAa1i1DSJNRpVliIWmgl8fbzrSG1vnB/oai89TFyCejmPxDQebdIUutBPJDNibuS
	 GyJsWoaJqUDjAJTnrCide07M54VPSy+AkTmejfRpltfK53NF8RUrC01W1g6ZuWjItWley
	 7FIbmWRl/oc2OpoLL204D2X201qOKJ83r4046N28pWqexbqkMjcZBlo2TKFQKvp/47A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DyYlx7RzolSrqUFoSHL9Wz3/RMfVWdxjcPwX2TXBXFE=;
	b=OsYPfdT7R7e83y5F/T/PtkRkMyA0FksYspxSraTn4ciBMMKoFjAEqqCFb2k3N4ne8/D+
	 05x9gabjfhgV5l3zSMLkIiBGlFjO1ShvF8zQIpDp3oMIzoRsNGXNX1fmqg8CFc5iQbO/U
	 1U+/o0Y5fFitwBXYdiszXtt8kb53F5assATxGDpn3jf05pZZfFSkAJ4+J3YW17tV4TW84
	 SZ3f7ysHOpEGQ85w5OT0e9GzNVB+lWva7rKe8UV6nU+71hbvFLZTVwuZ/hXJssWkWNZSE
	 ATosGs9XtXkBk3USQNXngdHwa0/YZcX5i+9u16rMiaW0bC2dLJ1tBn0nV6/xMJ+zHlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZK5lCGVs;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD68606A324
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD68606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZK5lCGVs
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso1404129b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266138; x=1793870938; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyYlx7RzolSrqUFoSHL9Wz3/RMfVWdxjcPwX2TXBXFE=;
        b=ZK5lCGVs9Xk6Nl0v2qdeO809odrqOxYF3AcyfK/gVLm2AlX/SDChCChtyOhhwR0LAU
         40/a4pNj9bqWoJz84CuG6TCaGIF2V9eLqDv7tL1RzjWkDCxm/8f68DnVyFX4LkaOGYvP
         hu2wAbL8KVmVoz0OJe3MlYGVBCQ/dAPK3VZ1g+/mZoG1WLu32ryBRhRlxf9f4kopd1i+
         HpWyBhbINcDB9MeuWrUundoFU5DbpC9cNRaI9fV2zVc2BIoqxcxagjYLcv7nmJopEb3X
         PGBGHj31so31dG6kxI0/H1f6BRZ/ubw126UZKNCFhPqYNjIGNtN5/GXAIblfzfPI5AaM
         pgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266138; x=1793870938;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyYlx7RzolSrqUFoSHL9Wz3/RMfVWdxjcPwX2TXBXFE=;
        b=HdbzCSQqV9IbynVmWDc4jErVSA4rTUhRUSEJFiNctrxZKhSvzqI7tGYQjLB0lQPfiA
         aRrTB8pftQLd4oL9JKfwDofNaZ/vfj4e16RwOE9c4OBoNkyANtnpxwcLmz9sQbLp1UL+
         NG2ms1pyAkrEmoAkBm05kD9N8KLr6X428vM0tH/rZR19tXl+VtJRjaieZ2UMYV9omUug
         S1E717iHOcaTibvrWDVmhq1jQwgyW9gFsxp1AFooXR4xaPnE6zUwuhI25nav/NPrkAgz
         igKSCdScLeQY0amp1nSfismKSwrQZzzz31sBATdfWIvnuYMyDM++eyet/g7qbhlXiTsN
         ssJg==
X-Forwarded-Encrypted: i=1; AKwUvBzTfpYj4dkjYQyQ9FD8oDcNR8jolDB4qayPWxhSh0bZM9wcs9nmSEruEDllcLYEmKss69z9L/oGjjK4uxwkYQA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKKZQEmjpAWOVjza1DaM1tXss363KieezUGujxeqTPtEQe0Iumm
	XOMjvlOP96lrgjhy/RtjFaijmg7CnLfLP0x7Np1Muw36DRGPiT+Y/4b1GFq5i5KNJ64h6If9bDF
	rCaNwzp13N+Wo7A==
X-Received: from pffk11.prod.google.com ([2002:aa7:88cb:0:b0:89e:65fd:e92])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a0d:b0:882:94ab:20ea with SMTP id d2e1a72fcca58-8a6e78cfe1dmr3662107b3a.39.1793266137875;
 Thu, 29 Oct 2026 02:28:57 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:41 +0000
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
Message-ID: <20261029092846.1567475-3-sgsatyam@google.com>
Subject: [PATCH v6 2/7] platform/chrome: cros_ec_sensorhub: Reset TS filter on
 EC/AP time mismatch
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

The timestamp filter history is only emptied when no interrupt happened
for TS_HISTORY_BORED_US of EC time. After a long gap without events, for
instance across suspend, b may be unwrapped to the wrong overflow period
and appear to have advanced very little, while the AP time advanced by
the whole gap. The filter then keeps a history that no longer matches
the offset between the EC and the AP, and predicts timestamps off by up
to an overflow period until that history is replaced.

Also empty the filter when the EC time and the AP time elapsed between
two interrupts differ by more than TS_HISTORY_BORED_US.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 7eb8841..076a65a 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -294,6 +294,14 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
 
+	/*
+	 * Also empty it if the EC and the AP disagree on the elapsed time
+	 * (dy, in ns), for instance when b was unwrapped to the wrong
+	 * overflow period after a long gap without events.
+	 */
+	if (abs(dy) > TS_HISTORY_BORED_US * NSEC_PER_USEC)
+		state->history_len = 0;
+
 	/* Move everything over, also update offset to all absolute coords .*/
 	for (i = state->history_len - 1; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
-- 
2.56.0.307.g5fe7bd680c-goog

