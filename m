Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266140;
	b=DwyFvy0SavrpKwAEt6/KPxjey5JgBgpISbK4Hzo+if5oX/i+/gT3AoNEmfXpdhht+URD
	 zbEVJhZ20keVuBikzO9JRjiZJYnpRt2US2uDJn4u09ntkGpW0eh2Ps0WAQGln8U0AYX1z
	 4qhrrVKcTLr7gRGx6UeCY5IMX/dC3vweq/K3pkYWJzytl38JZqPUZ5dlN8Uupl9cf1o9o
	 l7LRZ6dyHhC7i69DXDxQMsolXpF5cMSjF7ixN9DVk9Q00QbmWWGWKStWOUBVKPi3fEEFp
	 xGl/ZVqoBdGFGXCEnoHhpbJEXCuJS91OOadeWryMdYtizVSSOvVl2zmC0kWrXd7HenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iBnMDmrSuyFYWI0+QvlyVQXU6PwvT3EWSQPtQjEgOoM=;
	b=waZYaJ5UWFVMLvxRUDLOWVs/NHpkMwREXA/70rkE2i0fAdmLHJe5WWm5BPM15ce/itB5
	 DX1Bl88yEuiYS3u7Dk2sSgd1I7CgOwPLQLpc5sYC73aDfK5+Rj+7rOeJWcylfk1ghnWnd
	 VLeos5CRi1ABUG8yQWu/KMn/ityCku2mqNWTOQ0UBy/thuOdvRSvOx2UCN4iW9JzEVsIH
	 Lw5mJYK9M54xYvxiz8ozDQC29/K2agk0R6RWaW4+e+zfTrLOeBTSDpdUk1prPtV5978id
	 EMAOKLo/xgtyKYJkmqV2jC37iBVMqAqaOMF26eJFklNH8NfcJ3nnJqdEMvm4qBftGsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RwscpI0w;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A23606A320
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A23606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RwscpI0w
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adad90c894so2072385a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266140; x=1793870940; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBnMDmrSuyFYWI0+QvlyVQXU6PwvT3EWSQPtQjEgOoM=;
        b=RwscpI0wF4ZxqcyGf7J0xufp/EHYL79c1PWz+q1mzEuDsdJwd/0LNJxqPuYTPiqL68
         Q/qgn6wsQa3ZvExOWTTDVYYmgdKgguHFGbIOZwcYKfM6ryvK9ID1l8GTRSY3G9mqlgsy
         5TTcBvILbaQrQa3morBll2SRro1jg/3rEwu6rFHNo+6xfA5wObHqxND2UHTfFbP3ohP2
         h/jqKII+J8CDVVAMjBR7NsUs7awnxfio37249fIw/Wn154VLPR6q+Wx4S7y9OHu/A4H8
         iqMBE9E1w9pBJwVSRyDpO+cnCkbrS2HigqwNA5o62NsmydU5fihhrM3fdHsZ/U5elxVO
         bcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266140; x=1793870940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBnMDmrSuyFYWI0+QvlyVQXU6PwvT3EWSQPtQjEgOoM=;
        b=FAAQgu+GU0uETmQOOc8kXRTy9T6vCFTxScTY5IMMcTm3zYGosmTQBvM8BnKGk58M2L
         Q0POcPjWRFmW6c2BPUC9ePG2hq2ifFBDRJdwp/D6nvyUPEAwl6E9dyOm9DqqzY1IsAgA
         o6MpdfmpqnKHeSXW5F5C1UfAVd6MdRU0V+dSqASjARz7d3PwmJth52he+mypJ3obPLAw
         bySffXKUFknXnOsb3NxHmqGp0cZtqAGtQ7T6TNHiLmDRg8F4SypJBCYm5PRBQqQsYDhA
         GtjGiXSSLHYGXxAtV/KQkH7pJb4xdjt4Wxw+WlaUCkCwek076sZOxTsEbLKJyTAYDdI7
         xo8g==
X-Forwarded-Encrypted: i=1; AKwUvByJSTgKRq2RvO1YbLi03iCHxihrCXuaiBPcbVtTwBS46525Fgw4cYeb734iJzKwCuPh/dEuPiYgv7EBXEwEYSA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLTsdXhDBU/UgakyPO6B+KinZlLRCbpdTFwGR0fWQecM2qvNIH7
	iuxVq/dQKng5a3K6GD73OvC0maObkAl7BmzbHWzWzdn8EsMi35EvfxWvNMPcfG9RDRfohgFFySL
	Iv8oNSQV57Qy6XA==
X-Received: from pjah8.prod.google.com ([2002:a17:90b:5908:b0:3ad:850b:6f1c])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3810:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3ae5828771dmr4094239a91.36.1793266139516;
 Thu, 29 Oct 2026 02:28:59 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:42 +0000
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
Message-ID: <20261029092846.1567475-4-sgsatyam@google.com>
Subject: [PATCH v6 3/7] platform/chrome: cros_ec_sensorhub: Fix TS filter
 history shift index
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

cros_ec_sensor_ring_ts_filter_update() shifts the history arrays by one
entry before storing the new IRQ timestamp pair at index 0, and then
increments history_len. The shift loop starts at history_len - 1, so the
oldest valid entry is overwritten instead of moved, and the entry that
becomes valid when history_len is incremented holds stale data. For
example, after the second update, x_history[1] does not hold the first
IRQ timestamp.

Start the loop at history_len, bounded by
CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1 so that the oldest entry is
dropped once the arrays are full.

Fixes: 93fe48a58590 ("platform/chrome: cros_ec_sensorhub: Add median filter")
Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 076a65a..c5331d9 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -277,7 +277,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	s64 m; /* stored as *M_PRECISION */
 	s64 *m_history_copy = state->temp_buf;
 	s64 *error = state->temp_buf;
-	int i;
+	int i, start;
 
 	/* we trust b the most, that'll be our independent variable */
 	x = b;
@@ -303,7 +303,9 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		state->history_len = 0;
 
 	/* Move everything over, also update offset to all absolute coords .*/
-	for (i = state->history_len - 1; i >= 1; i--) {
+	start = min_t(int, state->history_len,
+		      CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1);
+	for (i = start; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
 		state->y_history[i] = state->y_history[i - 1] + dy;
 
-- 
2.56.0.307.g5fe7bd680c-goog

