Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D5549AA41
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963809; cv=none; b=fnqFMQkU1JDKr1JTBCASqbdJmWCgY4elkBUD4ZJUSnwN6gLf+F8pJcaJX/FCuUvo+HZ2rgNUvsDUTJ5ATeqsYKYWP6VAuzQYwspesM7+IjvUi1nCMLLgy2Hmfd71u3nt8NECc75zE4koufprhA++A7NQJ/Zf4Af3hFlxTPyCTFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963809; c=relaxed/simple;
	bh=q2PL2vePUklEmddiLMgWc/Ln0csc7jhX90wTdyoQybg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q66Kxb5Yf6leXLH6DY3YOoxjk78MotC+ZApinWRLu2TeR1keor5B1z4earsd7GIGpGTYc6LXb39gAN1nqakgPXdKna+exlv+RDn+DPQNMnLpQjJNfL1Z3TCzWEgY/laKaIx8O0l2w9nBXvE08mENnr7EMK1W11KtOUWVscL2o5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WxNoEicU; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WxNoEicU"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2846877a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963799; x=1792568599; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iE803xvF5DCZNZJ4RTJFrJ5qnTrfN/7AQyo9x/BPF/Y=;
        b=WxNoEicUXNTAxUJQBIiYzgkFsCSk/PIFaTUYAoYQPppisW2HtJdIA4bi3nCBAx9L7L
         3GoGg5qsTVlY9/qilGgDhHcArNQAvEqkFDkLm/ECP1L135HylFkir04qhBmwNZropvOs
         EcTtvGK68z8rDmI7/1LxBbrU6mYaeX7t1q0AKTET0S9XAaATyGHLwDvccz5CqO3aJfyS
         4OeZN7pFji/m7cjFRxe3LgGZhaU5JXr2hNJAUH3ROzXkRFcUe+W51XXAHGYXbbSJ7i5x
         wG+YRojw/KBdP14o4xyvPMECPovOOCyVGVBTNFzGktES3F1EdVQCnW6/IwTOmGTErgvv
         5kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963799; x=1792568599;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE803xvF5DCZNZJ4RTJFrJ5qnTrfN/7AQyo9x/BPF/Y=;
        b=oyLlKlcnoLuxGNdq11l4iFg9t2gV62ZJD4p9vL+FJgP+cDYaUhQH3XxO2BFcJQtBnF
         S6Cg23wSqE7IxPfu2cxzjkfKmdJ0trlj1TdST4E+vfJQUST25nwFpLhVSQPmAzWKqjIp
         Bz4isc8uKaF2Pzv7NvW4yyXFQU+8LbIiYm3xkUCXmDDtbZrxrtS+f8WN/0a7WclYIG2Z
         /SCslg0XWqCluhESnFX3JDymRBog57gBuLxsL82/m6as1W9wl89CFuBHSP4Ssq8WokFi
         6G6wlZ4Tk3Hpr+v9i/KRIope7OLm7ytUfV4JrVU/NK0wmqs3vCln+TwsuB8/4cdvMcXm
         BoUg==
X-Forwarded-Encrypted: i=1; AKwUvBy0UiExc6ph1vvlCuRp61NLctkuAAZigHQo+ApEu1bVX/p1lWhnJKhGmGkfCv22mPSeMRudSXxNKasikEhQD3Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYLzE5vNLTUYph5D0oaGQmAqjIA5W9HB/Ri8djSwvubkdOnI72D7
	ROFPZxsH7PhnfgyvlkO3NI29F4v7sZnJZku0DTEWmyq3Wyy1p8Mk773o6/pr93JQUZMWFThgcDh
	rP+YqLtVrJVU9xA==
X-Received: from pfbhx9.prod.google.com ([2002:a05:6a00:8989:b0:888:29d2:ca0d])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7314:b0:3e1:2180:4262 with SMTP id adf61e73a8af0-3e16bfcb62emr12351052637.59.1791963798576;
 Wed, 14 Oct 2026 00:43:18 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:02 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-3-sgsatyam@google.com>
Subject: [PATCH v5 2/6] platform/chrome: cros_ec_sensorhub: Fix TS filter
 history shift index
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When propagating timestamp filter history entries in
cros_ec_sensor_ring_ts_filter_update(), starting the shift loop at
state->history_len - 1 skips shifting x_history[0] into x_history[1]
when history_len < CROS_EC_SENSORHUB_TS_HISTORY_SIZE. Conversely,
starting unconditionally at state->history_len would overrun the array
once the buffer is full.

Bound the loop starting index with min_t(int, state->history_len,
CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1) so new entries shift existing
elements properly while dropping the oldest element when full.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index cc038af59218..6975592c6b05 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -259,7 +259,7 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	s64 m; /* stored as *M_PRECISION */
 	s64 *m_history_copy = state->temp_buf;
 	s64 *error = state->temp_buf;
-	int i;
+	int i, start;
 
 	/* we trust b the most, that'll be our independent variable */
 	x = b;
@@ -277,7 +277,9 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		state->history_len = 0;
 
 	/* Move everything over, also update offset to all absolute coords .*/
-	for (i = state->history_len - 1; i >= 1; i--) {
+	start = min_t(int, state->history_len,
+		      CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1);
+	for (i = start; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
 		state->y_history[i] = state->y_history[i - 1] + dy;
 
-- 
2.56.0.385.gd3acb90ef8-goog

