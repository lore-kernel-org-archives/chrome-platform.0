Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266154;
	b=Y9AxqGy9nTsG6luP3B8zzSNS1YEAm3IJi4zetexhP4T5nXpIoBtnu/w7uTneKfpxC6bK
	 ttH1P0fIEonMHjOHXtbT4W8GqPg0jz1oEigndlrfeuCmhi+6gSeDkAjdSxlXW8WlN+y1v
	 Lh7x+KfjWKtR3E1Qk/WJ2Dh72AGAjxy8SdB5nEkP/rjrmonD0UFmt2EFPvwOFzU2ybUAI
	 Vd+PZykdpLdMqvpN/zBMHAtCVPdEwA3gc0NfOcb585tNyPXg+Bm1EfJbHwGcrYFURk38H
	 n7FExGDy2fO4myFpNVbAmI5on4bMW2W+j7Hq8TLJfJFI/8nBR8RFwijVFMaz9muwxBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=todkOwyfVIhQ069n5dpYrblRp+El6QG9QdYJZ7QqQQ8=;
	b=Rc/oe0KVyTq+UYa6ZeWDfehC1MumVAOdXmKFzYkS6YCp9f/tbuDloxH4psWGdx4/rMQQ
	 r2VXBMcWvJrSEo9uYn7nusKoudwR7lUsD8eIOT8upKTgyxrh8RCj6nSssUw9lXB+rft9P
	 L8AUqZnjqzdiLYA9cLGD7wbNwEcnAT4EK4Buug3XC/VRoAJji/Xji3Sppai68AJzEsD1y
	 8rNfzfd00dfL8gm1vkpQUcHl+FwlQFbI1/iYrShyFR/h+4NOGooHI9l+IMX5JQnA46Zef
	 ev/K2XVPBjfS5FwfVx53dlfAzyPOU2S7N9L4QjqPucratCcEGhit19iFhmviJ+VDeOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SJe6COeY;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F4606A325
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71F4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SJe6COeY
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so7820498eec.1
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266153; x=1793870953; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=todkOwyfVIhQ069n5dpYrblRp+El6QG9QdYJZ7QqQQ8=;
        b=SJe6COeYEPbQs4pOC8WHL7Fz6tmeVTlYs/etMIQELnMNvhJQCdxq3OaNHmIjSQUHE+
         RxBBBunZ9m1PCl+hP6XXgMKd9pzZI6b6NwfFikYU2Uu+ZQaaO4TJwEQ1SNcWCLjj2/07
         zi7edLkhSHYf43S6UOchEdEnah8QRp4MERi8EC7kG/v3EKeM3us8zvUqmjdwturgXkPi
         WOGpcv/e/ZIpkYxbpbCaOU1Th8YazMlp631RzgEe8uyO7b8JlGyM+w/9z0K3B11TUN1O
         2TgFCKkV3uYGRpzWg4yLMz87IMctYFAYlZz4jpbrDKL6LPnbfcFKeGhdDR+T0hxZffcu
         LT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266153; x=1793870953;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=todkOwyfVIhQ069n5dpYrblRp+El6QG9QdYJZ7QqQQ8=;
        b=Ye7x/cBOGRBZDXvK1lwucj9xTIPxI0uMGkFuzaNnT7amGHbeQRZOc0LjWzjaAwaFz6
         MN7DurTnaq+REDgOlsdkHUzdBNiRh3d6dbVOCIqr8cLvgG07QeFMaXcfoFt8sZwuAoXW
         GKDjcSK+v0pFq7qvu+AfcKJwdIQ4UM+P6C/8Y8ZTkfjcyJyV6ZSQv+Husgx3Ok+1WROR
         ZvsypDMDpG0P1VItCQ2xDx1rP19GdP8zzMW9H41it+/VT+obGglPci4IFh/lTPpdmkit
         YnZKWBc/IkalF0wCzL09cPmRTQKz9WqZ4bVsSUA9MbUyOvD1NuOOOtw/kl2ylaOn29OW
         R6Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxP83BSbIz5gGRnoe+ehSQWAHhggWfTnSjWdqLVLbfBViChfMeN237t8zOOV+kNtXSy14wY0/lQokfseAkC4JY=@lists.linux.dev
X-Gm-Message-State: AFq9FYL265FbK2vHyCJq3T9LMNhyml1/5pa6s4dT5XiEcfw5KkTpMk2E
	Z1SeHgefGF74PYWHW1tNMFs3lWRWHenWFXVLWbCCqYiB7No9hvqKQvnwqpP4texSk8qFA5c3nGW
	Uqk0Gg+OieUXZbQ==
X-Received: from dlaj3.prod.google.com ([2002:a05:701b:2803:b0:1a8:2945:774e])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:d01:b0:16c:4eef:a526 with SMTP id a92af1059eb24-1a6cbe7e09bmr7413687c88.15.1793266152510;
 Thu, 29 Oct 2026 02:29:12 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:46 +0000
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
Message-ID: <20261029092846.1567475-8-sgsatyam@google.com>
Subject: [PATCH v6 7/7] platform/chrome: cros_ec_sensorhub: Drop sensor
 samples with past timestamps
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When a sample timestamp is earlier than the newest timestamp seen for
that sensor, the sample is clamped to the last batch timestamp so that
the batch spreading logic re-times it. This makes the spreading logic
treat it as part of the previous batch, which produces stale timestamps
downstream.

Drop such Out Of Order (OOO) samples instead. The previous batch length
then no longer covers the interval up to the next batch, so reset it to
prevent the next batch from computing its sample period across the gap.

Rename cros_ec_sensor_ring_check_for_past_timestamp() to
cros_ec_sensor_ring_is_past_timestamp() and make it return true for past
timestamps.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 43 +++++++++++++------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index ef20aac..bc3f120 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -440,23 +440,29 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
 	state->last = *ts;
 }
 
-static void
-cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
-					     *sensorhub,
-					     struct cros_ec_sensors_ring_sample
-					     *sample)
+static bool
+cros_ec_sensor_ring_is_past_timestamp(struct cros_ec_sensorhub *sensorhub,
+				      struct cros_ec_sensors_ring_sample *sample)
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
 	    sample->timestamp)
-		/* mark it for spreading. */
-		sample->timestamp =
-			sensorhub->batch_state[sensor_id].last_ts;
-	else
-		sensorhub->batch_state[sensor_id].newest_sensor_event =
-			sample->timestamp;
+		return true;
+
+	sensorhub->batch_state[sensor_id].newest_sensor_event =
+		sample->timestamp;
+	return false;
 }
 
 /**
@@ -608,8 +614,17 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	for (axis = 0; axis < 3; axis++)
 		out->vector[axis] = in->data[axis];
 
-	if (sensorhub->tight_timestamps)
-		cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out);
+	if (sensorhub->tight_timestamps &&
+	    cros_ec_sensor_ring_is_past_timestamp(sensorhub, out)) {
+		/*
+		 * Drop the sample. The previous batch length no longer
+		 * covers the interval up to the next batch, so reset it to
+		 * prevent the next batch from computing its sample period
+		 * across the gap.
+		 */
+		sensorhub->batch_state[out->sensor_id].last_len = 0;
+		return false;
+	}
 	return true;
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

