Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F2275870
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 00:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373148; cv=none; b=dVO2l840sJUvjpr1ZiPIYQ2GKLEHyO3/mffU+m/h081nimp19LZ2iSTLS/1LP02icLqKsDH8An1CO1hLGRlUX3J/HxTiAxxNYPA6bt/DYmT5/ELuO1FKadxHgkCUQp44mvoCiHpqjqDvmbyHbvizW2uu9GyuhF8nydExsYsulg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373148; c=relaxed/simple;
	bh=f8nwlSHD39/NlgcvlFIr6N69nLusEOxPTYlsrEm/5iE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kiICTOWFy6jRMm3FypO0hsnbcJjgkdUEeS9UmdGGkBkNx5P3HAZ0vWZY8CHt2qQEkBSs8koyMCi3rbt1We4ZDve8a9JMkUjUzZRKj5jfyMPjBMTmM//Jf019NVIFmwFBg9BOgvazv1mTqscrxd3pCMKjwNflMpvk3DYubI2L/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CTP1w/Z2; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CTP1w/Z2"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2488471a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 17:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785373146; x=1785977946; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQ3GTkLPfIJk+S08JcX0fya8KImWhdZbYAsmNMihKqk=;
        b=CTP1w/Z2TjEsI1XA2v9NmYqys2Ms8lYNrBF+QmSM2TtPJULUrzbM7SvayrZ8oq478v
         DuijBTUpebDR3dEtGOYIR10z21bRW3YZbyfNHiEbJHqbg4LGzsuErUjWuQXVa3sTBSPC
         9lWyoxlY93o7u4Oyd0kP75Cq5fusfe+Lz9ecQQbmOn2cnvFk3KFAZBs2USiNkhjCHWjo
         KOEUejB940JAQbyyO1NEjPFSZuZvX5jYTFVQnbm83RIQlpbWCJjgBmd5yvywxj3FLnhV
         zP0J24c5q+0SyIse18LUOWzsxPxAqpAHvaSr9IXPZ+OKMhzELzYoEXJRO0qEBj8jlqiU
         lPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785373146; x=1785977946;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQ3GTkLPfIJk+S08JcX0fya8KImWhdZbYAsmNMihKqk=;
        b=Y65kgpwwy5PBPRe/uE+1Kja63UilmEEcX6HaJ+qNNlYIvmIfhapqUaU1SLRMW6TiPs
         ORdvSJhBd4H7dHK2uMfhqpDEXns6tijQ4TjeMS0OTYA2ujJZGjUG0KR/Fddwsw65lxjD
         bx21bsl8/2RWo8tSPZ0tRzjO90W6DdgwQTsEB9B7G7ShWAdXYsYcK4TWH5kx6zjASFCp
         5HRX73jcxGsWfGq+Lv4yysXGlf/IU9jF9fEGuWsLONLk/GlsIZ7LoRQhyvJeahODiF6X
         RnKhaL0A7hIdrAav04N9FNP4yrGfHc30L7FW3OFfM1szWqlK/z4i7qHWPpOxPlqNrsNJ
         zVbA==
X-Gm-Message-State: AOJu0YzfgIbe8useO4DekubXWUdVNGCS6h7QDE/q/hP303NXOD6Lrxxx
	UDkjtRJf6LIshS2yrXf5J4N1C7qvYunYRytySipRxVjBzPjOUsyBSlkIVTmX1cWJDJhJ2vExcoJ
	KWBo82a7P4A==
X-Received: from dybgj38.prod.google.com ([2002:a05:7301:126:b0:314:314:df67])
 (user=asavery job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2785:b0:380:71eb:4014
 with SMTP id 98e67ed59e1d1-38f9bd80dcbmr546928a91.15.1785373146411; Wed, 29
 Jul 2026 17:59:06 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:59:05 -0700
In-Reply-To: <20260729221459.1006-1-asavery@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729221459.1006-1-asavery@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730005905.554665-1-asavery@google.com>
Subject: [PATCH v2] platform/chrome: lightbar: Limit payload size to EC
 bounding macro
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
macro, bringing chunking in sync with EC limits and preventing
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

