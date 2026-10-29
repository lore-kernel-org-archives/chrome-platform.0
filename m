Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266143;
	b=LYh1tIEEkSsoUnqt/XhFvPuqE73TYEuEloqt1LKrIFhXDTyCpVbFql+3Gn5YueInZMsE
	 Sr9Trs9jRkus2nI2mYYsDA+1gwc6wdktAyUpn0Qd0nY5uVo3parf4IpBhi374H9rTUEY9
	 bqUPp1zEEupD8R6zNhBnLGfloO3uTMur7p1IE9lmac8aBtawCcBmRsk6H7Fci1sUl9vzx
	 QBjkYJYdphCIWrhtNy+reNXrWVu2E6uKJ7wb6MzE9Ci0atDMZY2Cx9ZZqIMGCgwqzVdYq
	 wyP8NxJAmuWR5k8eqHKDon7YTeJVoMVafklEFmgX4pYdoLT5jE6Pk2sfjLHrKT5m6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Jb3EUq4KlbjY0bhSkBco4tRa1Qo54N/IBnyYXHi22sQ=;
	b=SxsQYgAWTPpwkE704iqb2LEGEi7F7CpvECi+Ilj1cQlD0+2va9SH0kFdQVvKbQ/kbBde
	 6t+chQqSNQmHN578Z+R37CVMqYTaW10tXzmBeqpTiy15wGWbHoq4rsSfBWi2twcZzB+NF
	 fNFX6Wiqi268EZU/s4qVcziHG57Xojmxq1YCs/JfFbcGgmt/fmvN+L8VHiKH42dQscOpX
	 2IEoCEhdukhwoLDz5aHsebBGLeLtuumGoGOd0elGxLGtU0ylW2TIAHOF6ot0Nmg5DZRaJ
	 ziF5Aen2BKN7CE5FBDFcM06rwzJyjZOLEs61OYA6gKt/SyMceSEuMzn8MJjWdar9sag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=flWCL6nD;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE54606A31C
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=flWCL6nD
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so2630141b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266143; x=1793870943; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jb3EUq4KlbjY0bhSkBco4tRa1Qo54N/IBnyYXHi22sQ=;
        b=flWCL6nDusozgablTQIZTOkplWo032AiDmq1vPWBFnDwpX/7EDVe49+OpOYQxeHriQ
         eReGoixJCoF3rhH1eloPQ7bXbF/gzHUOu8crgqT90KhZvVdA1OB8S03/62ejEcQoctG1
         +yHlgQQpx1woeHg+42oc4sFVeR5xiC8B8i6/nqZiKHNTVwtAjSw1MLqQVxsWaBphAMZ1
         nI2rLaUiX/CxLkZ5u4CS9zCel6TMhgB/hKmsmoY13pF8kfPVp8YDOo8obC3e7HuOIprR
         MxyGynyJegazeb0jndYNtLbxmxDm679pdTrvF7WWjua/93VmfDvjbyDN3PuVe3qZaphf
         RsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266143; x=1793870943;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb3EUq4KlbjY0bhSkBco4tRa1Qo54N/IBnyYXHi22sQ=;
        b=ISx49Q1Bth55+Re2Khe9j2+Z2JjsMkwzofwQj12pNKE8ABN48QKORLDKFNeu31NKC5
         jwqNlb2QfBFtcO6ICXT8w00kABZGQbEJmJsrp6gxsoYiuwEyoOvXZCAPdFhb5daHVOMG
         LhPDl5qbjDKg4Je1owU9Wro9iNjhkkZb0pyglUOKlRcIDbSKEOs+2jske9xqEssnD/l9
         01mu/J4xujlb+ZYoA2bRYzq1WpAxqeYiTaguzdOfLKOrDm8PQHWbYL3UrWRvGEQ23bsw
         uftrEdM8ex/8+gTn8MNyaPNkNPXVWOrTxzxdrw1dhiEmkUIjfeoRKrVh9VlOfoyBa3vY
         6qpg==
X-Forwarded-Encrypted: i=1; AKwUvBxc5DKPfDXSN1tKdn6D48UD1zh6zM+NnJYHwIbqfBKebJzkKJMU13ZWFylwiinTfuDZ++DbmvCUp8Ud0zT9Cw4=@lists.linux.dev
X-Gm-Message-State: AFq9FYIXFZctybDW8y9huYfV0avpc1mh+E06+y8gq9mOuh17Uwj81o1A
	81F80AMnq9Y0zZRnJfA/Mk/pReU+wAwEAc7O0D+kgUzaJd6s5H5d5LkDC4smzSzu3Nm1ucgP+Oh
	TeKH+EvwJwO3vgw==
X-Received: from pfbbt8.prod.google.com ([2002:a05:6a00:4388:b0:887:5ba8:7334])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4f95:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8a6e7acee1fmr4165007b3a.32.1793266142425;
 Thu, 29 Oct 2026 02:29:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:43 +0000
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
Message-ID: <20261029092846.1567475-5-sgsatyam@google.com>
Subject: [PATCH v6 4/7] platform/chrome: cros_ec_sensorhub: Clamp clock drift
 slope to MAX_DRIFT_PPM
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Interrupt jitter can produce slopes between consecutive IRQ timestamp
pairs that are far larger than any real clock drift between the EC and
the AP. When such outliers dominate the history, they corrupt the median
filter used to convert EC timestamps to the AP timebase and lead to Out
Of Order (OOO) sensor events.

Clamp the slope to +/- MAX_DRIFT_PPM Parts Per Million (PPM). The slope
is computed from a time delta in ns over a time delta in us, so it is
1000 times the unitless drift; take that into account when converting
the limit to fixed point.

Set the limit to 5000 PPM. The drift measured between the AP and the
sensor hub is about 16 PPM on a device with sensors behind the Intel ISH,
but about 2900 PPM on a MediaTek-based device with sensors behind a
standalone EC.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index c5331d9..46f44c6 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -23,6 +23,14 @@
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
 
+/*
+ * Maximum clock drift between the EC and the AP, in Parts Per Million
+ * (PPM). m is computed from a time delta in ns over a time delta in us,
+ * so it is 1000 times the unitless drift: 1 PPM is M_PRECISION / 1000.
+ */
+#define MAX_DRIFT_PPM 5000LL
+#define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000))
+
 /* Only activate the filter once we have at least this many elements. */
 #define TS_HISTORY_THRESHOLD 8
 
@@ -289,6 +297,12 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		return; /* we already have this irq in the history */
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
+	/*
+	 * Clamp the slope to the maximum expected clock drift. Interrupt
+	 * jitter can produce slopes much larger than any real clock drift,
+	 * which would otherwise corrupt the median filter history.
+	 */
+	m = clamp(m, -MAX_M, MAX_M);
 
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
-- 
2.56.0.307.g5fe7bd680c-goog

