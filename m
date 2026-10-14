Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41284A2A61
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963822; cv=none; b=bIBkpnHv5pnycnkCFQewJhqAaveL5JbV3ZPX/oJZ3IcTXP1wy3J5BepRAmugv4f8yJx2I1jf1rQf8qlYRw+gOB27+gOUu/nXkWWGahCI/S0FHfNGVhaZNtXRdN4M1mo4U29iGmMLHO7XRjvbrcMt82IkP4a9I1rBTBMCdWsO0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963822; c=relaxed/simple;
	bh=Rq0m96C/XzfFghdstrpkMwk8HDoxdqOBwjSvjkXGvhc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q3gGkTu9AXQshN7JD6MGZR1JKrrBAbtH1eE+bynzTu+2/frXTDRXkU578Asdsen25jeXIyTYFn+t//2wmKuRCeRN+Vtcb8Wf+tHfnd/Wa0OxqsyMKxFQgH/xeID1vECK7pa4o0+PO/huvEzlVAl7zB+5ENaN57AAwHNFP7V2DYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkrNsLnw; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkrNsLnw"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c768885b0so2897755b3a.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963810; x=1792568610; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8ejrhR9Sm9D3IdeJlZMaktlAsgw6di4XLWK+TX1KPs=;
        b=jkrNsLnwWfpPw1jJAU7UO8DW/+tLCThBo6cMCwGtS+u2jbKlF0xlVKN/Ti2COelj7D
         dkt9j4ie2DNEQQWpNCqbJnrIJPYXFd4TArQ5MT6MKHQwb0tNgy0eCR3g08T3BuQxssrc
         s/xRp85c9gOJg/l9eWy/zzJO56AkJqFmC1BD+Gi2MtTpQP03qFhOOotLl1B5LiStDA49
         zu1drbql1dVMmvL+FLfXXnPHyLpOnIUQaaHiQSyuYeXvfsnEeFiUQggSgbHa84IC4AIW
         wAJV0+J2n60iLF5ZOjEmH+LstnCgr85BE9wZubVFTQuyO5kFuj30+G2T7YA0Al2A4DP/
         XBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963810; x=1792568610;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8ejrhR9Sm9D3IdeJlZMaktlAsgw6di4XLWK+TX1KPs=;
        b=e26wyyUd53NS6+Z4bC7pN6fh69ZFwclyc6dp+Tklc2rrWy5Kq+fumgxFDiIU28r684
         2isVy9Eqy5yJU5ucTUYKFV3YDflE8hAKTOe96kfPBqUL8/xnWNPgxJWEpBKVCWH71iKb
         l2Kg1Up1JaXpE9F24zBcKCrkkrC4DO/y7GsJEoM09S/1xmd3ChMbAKHFxTRyGIJ9h2y5
         OaKRbdSkUQKdRdFEIhIrlceQkqwj/cZvRJA2QgkmOvXmApuCvFDq6VSo/H0seclhQNYZ
         aFVqeUrsAE/TNXyxwgc2MPAz/73hC8rUyydf9V0B3UJdwCrICnDDZB7tLWgmKSFDNZJy
         gffw==
X-Forwarded-Encrypted: i=1; AKwUvBzFU3bhY48q8S/3DQkYvbsIVzVz4hJ/7oUzg8CbKph1HvML5VU7aU/oH8RyJWI01GPS0vIJsB9tpw6lgMe5E7I=@lists.linux.dev
X-Gm-Message-State: AFq9FYLAY6OyrGzDXF+T2KYlDFdDJaog4UkPp98eMkF7BotrscDcsps+
	puQUmQfN3w/jKIKK0iETaw/GrCVqgXlpph+fagrXjuXKfWnvSCYVWrmhazusPCYCHJcft1j8V3I
	SBcmf/FD1QqbKyw==
X-Received: from pgbcs1.prod.google.com ([2002:a05:6a02:4181:b0:cc7:d128:5a50])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6f89:b0:3e1:d43e:3675 with SMTP id adf61e73a8af0-3e1d43e3a3bmr2158178637.2.1791963809541;
 Wed, 14 Oct 2026 00:43:29 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:06 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-7-sgsatyam@google.com>
Subject: [PATCH v5 6/6] platform/chrome: cros_ec_sensorhub: Drop sensor
 samples with past timestamps
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When a sensor event timestamp is strictly earlier than the newest
timestamp previously seen for that sensor, drop the Out Of Order (OOO)
sample instead of clamping its timestamp to last_ts. Clamping past
samples to last_ts previously caused downstream batch spreading logic
(cros_ec_sensor_ring_spread_add()) to treat stale events as a batch of
identical timestamps.

Rename cros_ec_sensor_ring_check_for_past_timestamp() to
cros_ec_sensor_ring_is_past_timestamp() returning true when the sample
timestamp is in the past.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 7740bb42b1df..a5215955470f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -427,23 +427,29 @@ cros_ec_sensor_ring_fix_overflow(s64 *ts,
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
@@ -576,8 +582,10 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	for (axis = 0; axis < 3; axis++)
 		out->vector[axis] = in->data[axis];
 
-	if (sensorhub->tight_timestamps)
-		cros_ec_sensor_ring_check_for_past_timestamp(sensorhub, out);
+	if (sensorhub->tight_timestamps) {
+		if (cros_ec_sensor_ring_is_past_timestamp(sensorhub, out))
+			return false;
+	}
 	return true;
 }
 
-- 
2.56.0.385.gd3acb90ef8-goog

