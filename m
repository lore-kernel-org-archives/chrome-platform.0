Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266147;
	b=SJhgEy2tzB02qB9g2ibVzw6XJI6hSa0MVPE9NQMeyty7XNBbaMgbbUB4qW7mAAJScbR0
	 YgcXipxfjFKOjebELo5oFPZv8cdDOLQab+D+8olJmvaKKttLU6eGeC+s9PXrC2qi8fvI3
	 pbehxDX/I5WZ7IHvriz2xeDb3BLQtuWsQE4+QVyDYuy9YHvpI2WXjDtfWV3ow3X/GpnhC
	 I3RAgqi326qptLZe7WkJ3GiKd/OD21Ha+g7IgR8sEx0aoCTE5HBYSBWoREylgnQgs+1h2
	 WL51SYWABOSVElmZJxzvVKk6n9bGrc0JHYa8UrafAV6inm44KhhQ16IL+bEKaf1ZsRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iOvAEsHGi/OKdYCfp96Wu9o3kTx2kIMK84hU6EBJhgI=;
	b=uCGLcmeWelTKCZgenBWSKPT1MXZSJPwJzlzi6EosmRdO9NBmwZAFsNwd08Wrm4c2pnHR
	 iiavy5XHGv/UqbHudBtNBc4znVFLCUUk4jhlNkvKfMU0LJQk8cTzvRihnTs6m8blHly1h
	 TRSbhddbFgPVmQhA+DN1paifpd/mARJiP5bxyvDy4zEfmg9XpDzEQRwG/RUswfjGu1zMW
	 mnLmqGa+X1vT/NHo5RJfxf3VI2LgseqajHxxRC//4WcPwHnnbzgip29bf5mWTLOKGfto3
	 DrwXdBG8gR3TejNcLxlICdLAjkq49inOGqqvnZhLabbRQ62MH3OqU5ZbM2Ay9+t6WVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y6GDYPPi;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A691606A31D
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A691606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y6GDYPPi
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb1f470a57so4067185ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266146; x=1793870946; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOvAEsHGi/OKdYCfp96Wu9o3kTx2kIMK84hU6EBJhgI=;
        b=Y6GDYPPiK2uznMk4hZxkZVv5WLmAn4SneiZGBHljNUnbQm5hJjfrtQoH4nU3N7qwNg
         1C2sqfp8W/vBsb4V9wTG/bvxBd3szrDT+DEPvn4FkrEJjshq8YDfSmHNN7PxNCRb/Dg3
         Oi0sHLqNJ7mS2FVjM2wDZOOhMCKHxtB67syuoJ5NR0jk82YqvfgrgyZk/nDuF9VNdYmN
         JoklRIuEvgU6CJ6wn373/9FjjEIOo5vuENAFo2vTybRKtredrWKCNiYhQX1tNLw7JisH
         sabWLMs31I1lVYYWmmMpz+UJjjpKAbeVe0di9wCi4pI4wcQ6p7dIRH8+hAYfaiIYdw8p
         d0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266146; x=1793870946;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOvAEsHGi/OKdYCfp96Wu9o3kTx2kIMK84hU6EBJhgI=;
        b=pAXrOtdpHvXm/pvKCawg4YOIqlamj3Y+wj5uOEQDvdgqAeIyPTV17DJrUMDzDS0nuC
         WfTHxkQ0G1/noHLsc01COvrv4+gHzrFZePwPBricD1pLsa9OHNQn8574yeLpA37Fsq54
         1NYc4PF/yzkii8zrkApDDx4FIQKYFB/5z2JkTaLQ2OtYXx6x9S5qHd7wxlKR61N1xjOz
         Je6C4gbGIG+YntGeS2meOXNCzn/a6gl+7Onh9Qh7i7Z3RIx6N9hsf8YgFgZgd1aD/lxx
         AVU89w2ERepa+IAHf4UewK5kntf+kGNLnpS406rMXdP6OEYdBazdlzLVO2fkeVmX7vKU
         Q5fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkJ1XFqf7Qc9DMoKsziVWa7kcm+JP0UB5bLiMcLWEQsbb1UF/AMHQU4dY8Ny1Nav7Fc8A7Ba1sq2n6qVgYbxU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLJjI1CCF0pbjSQ7Xyn08C82jXIlvmL/wsmZ6L38oJYNbDHzCaJ
	OanUswH60tqhnjJMXGGGKEOyQQb+XgrcE23MmBd3/pamv4/k862Y8fwV2X6wW1kQC0NRnPIfGtI
	DQjTo7IaUDZLANQ==
X-Received: from plbml16.prod.google.com ([2002:a17:903:34d0:b0:2eb:162b:6e4])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4d1:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2eb003de992mr40153285ad.24.1793266146262;
 Thu, 29 Oct 2026 02:29:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:44 +0000
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
Message-ID: <20261029092846.1567475-6-sgsatyam@google.com>
Subject: [PATCH v6 5/7] platform/chrome: cros_ec_sensorhub: Reset TS filter on
 ODR or mode changes
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When a sensor changes Output Data Rate (ODR), or switches between active
streaming and low-frequency batching, the interval between EC interrupts
changes abruptly. Slopes measured over very different intervals then get
mixed in the same median filter history.

Reset the timestamp filter history when the interval between interrupts
changes by more than 10x compared to the previous interval.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 46f44c6..cec33a7 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -304,6 +304,20 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	 */
 	m = clamp(m, -MAX_M, MAX_M);
 
+	/*
+	 * Detect ODR (Output Data Rate) or mode changes (e.g., transition from
+	 * active streaming to low-frequency batching). If the interval between
+	 * interrupts changes by more than 10x in either direction, reset the
+	 * filter history to avoid mixing slopes measured over very different
+	 * intervals.
+	 */
+	if (state->history_len > 1) {
+		s64 prev_dx = -state->x_history[1];
+
+		if (prev_dx > 0 && (-dx > 10 * prev_dx || prev_dx > 10 * -dx))
+			state->history_len = 0;
+	}
+
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
-- 
2.56.0.307.g5fe7bd680c-goog

