Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA641214812
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373200; cv=none; b=ipXZiHaaYQEuhNCTJufb4spSp6DfrjpcSN5Fa/JBNCD9zxi8qhRA4GG+kFT9CinvAgc46n65NcqC68zxGVCWQqAHdqeKEwVisETTYp7+CYccESO0EsXlmPxQtldqx6XOsd3FAZYZAeUTWNxhQDyYKl/NZjTvKes/B6IMM9jpoC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373200; c=relaxed/simple;
	bh=YoyNQMP7teRExL3XYmcW53Y8w7L/CUIdboJxnflI660=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nwC4Z8vzBXG9fyp2ty/rYRBYIs09PrcgOhc5Y5JmNwAiiWwiDcH9beSfFM5GOidnGDrcRZ3zCHH9v2L6MbYLctOPdetpnO0+wxVwh727LLplJsuTw226dDeFWpBJY/U4OIr6XITKXlbgZlCKfOGqnZTK+VXlELWwiwFKjByTHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0PNCATD; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0PNCATD"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2485854a12.3
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 17:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785373198; x=1785977998; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ5hs0UGC3Kv3QYto2BZMRug9diLQBGeSy+1KyP+DT8=;
        b=P0PNCATDtID2jNxYRKqhZPPC/38ytmwKznKvZMvdXmc3+JBaiSjL5FJ3CeeaGPU4j5
         nxBOGj2hg+ScR7z7HxuZ7Tpf9+mQJj5dpe5ymfAGqTgtbVaeS2S7UeAgyGUUjg6GNmOM
         ZysD3dEoW4SOCo3ZKJ2MiEdPzcNJR5Ijs4WQ4haquJudBOdKDvngjKQhQa/rI8ECxvmm
         UVtPa9s63shnlkA+hsGVGe2SHCfeOpHun86szpoLT8myXo4SrFt4Z2FYDHqVUWBxK7qQ
         Xg3O5/hLO8oso/g/WXZW+sf3T9iaRZn0pJjDamDA29xh4MGsJl6CdqTFhdu0uslAV558
         Fu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785373198; x=1785977998;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ5hs0UGC3Kv3QYto2BZMRug9diLQBGeSy+1KyP+DT8=;
        b=f+PmO0kzeB9aDuSgbq40KUTAccap83Uwf+dLkwElrOliRVYHzOfKyh2+ss44AzEOGF
         +lkZic9maE8ze473sDa+o6lqLg4qSmmf27dqaJqbRUsLT4um/29957+zoKgfpHHbCvUC
         PnY1A2XCVrH7jAob3+YMOS3N9QuFRRKn5q+lPJEzYw68FnoV/BezssloUwx/gD3+wA8p
         on3hLfw5qaHGeXmTt4InWAAGv7jjTIyy3NfehdDEShUhLqgAwy1BRa1dSdOMHzDFtiRO
         Mqj6zlzpOlDagg9RMltZFnUW+8nNlY/ENsgjANB/jKW5mKhc4Up98zBsZ59cOQp1KxHu
         minw==
X-Gm-Message-State: AOJu0Yz8VIfo6t+BuDAxSErh7P/FRAf98mvhQOx2bt+XBMgfio6hAMZG
	83JIHWhPBx9QiRxpkYlGtrk7+Fsz4JwYovf1M5j6a0S/dNQjV5kZtbBAoJ77HfzYc9tpjqn6SCO
	ulHP/0AbY8w==
X-Received: from dlbuu7.prod.google.com ([2002:a05:7022:7e87:b0:13d:311a:396b])
 (user=asavery job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9189:b0:3c6:61b9:917c
 with SMTP id adf61e73a8af0-3c90045616bmr378191637.11.1785373197870; Wed, 29
 Jul 2026 17:59:57 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:59:56 -0700
In-Reply-To: <20260729221459.1006-1-asavery@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729221459.1006-1-asavery@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730005956.559287-1-asavery@google.com>
Subject: [PATCH v3] platform/chrome: lightbar: Limit payload size to EC packet limit
From: Alexis Savery <asavery@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev, Alexis Savery <asavery@google.com>
Content-Type: text/plain; charset="UTF-8"

The LIGHTBAR_CMD_SET_PROGRAM_EX command encapsulates its payload data
with an 8-bit size field `uint8_t size` and is natively capped by the V3
packet bounds limit array `EC_LPC_HOST_PACKET_SIZE`. However, the driver
currently allows the payload chunk to bypass this protocol limit if the
SPI transmission layer negotiates a larger physical `max_request`.

When this occurs, large payloads (e.g., >255 bytes) integer wrap the
8-bit size variable when assigning `param->set_program_ex.size`, causing
truncation and parse failures downstream in the EC firmware stack.

This change clamps max_size systematically using the `EC_LPC_HOST_PACKET_SIZE`
limit, bringing chunking in sync with EC limits and preventing
`uint8_t` size overflows.

Link: https://lore.kernel.org/r/20260729221459.1006-1-asavery@google.com
Signed-off-by: Alexis Savery <asavery@google.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 02a6c34e68e6..052606cba85f 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -496,9 +496,14 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 		}
 	} else {
+		/*
+		 * The EC limits all version 3 host packets to EC_LPC_HOST_PACKET_SIZE.
+		 */
 		extra_bytes = offsetof(typeof(*param), set_program_ex) +
 			sizeof(param->set_program_ex);
-		max_size = ec->ec_dev->max_request - extra_bytes;
+		max_size = min_t(size_t, ec->ec_dev->max_request,
+				 EC_LPC_HOST_PACKET_SIZE);
+		max_size -= extra_bytes;
 	}
 
 	msg = alloc_lightbar_cmd_msg(ec);
-- 
2.55.0.508.g3f0d502094-goog

