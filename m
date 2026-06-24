Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB34F38C2A0
	for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290377; cv=none; b=VebKS7Ts8DD7uA9YLtz3RGBy1qcseDvKg4PRVW2tH4sNvjmxJ7DDRjrdW61+KJUaG0ToHzUAQfrAXvSppOXD3jLVY0EX43pmkUWtItvtCk6eGt5qHqkrYLxi6HfnaUM+bHlPi5BSAWxd7jyqU1B6pqt5pTCOdXyRjnDttWaJO94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290377; c=relaxed/simple;
	bh=EkA+Oifn9aNCvqJqi6lAwEfj1dV6tuSVEEEosxKDie8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gxLpb0VNUK+YIC51kfzEdHo7pbd6t5Bfz4148G+FlqU4IST2J6gsA/TvO//aUPtN97KZU2baGiBoReV5yhB9PLmUQYdpOQjy8Ih4U5UcOzAH7WWPvgeXLgf3KOic0X1VojToVgHDgCIy7oBTN6TB2s7bSIv21H0F767dm3RYGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnszuxSr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnszuxSr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6c57c5c07so3928495ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290375; x=1782895175; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3/JHiz/wa8RugXMvE46Tu+Cf65I/KDDNxer4eDoJdI=;
        b=HnszuxSr0fiV65u6wAB9GElBYAfeB7jh7VClWTEqpcy1IVF97UOzXAnHKrWmEFOqkk
         PYF6V6oUCUl90s5YnDli0ZSP5dibZYdovE6ZoMqVLyMbsxtGLVf8XQAepYQuLLgTI7hj
         Qzk5MavZYWlHJ1ULp4Bvn2BbDUMuTBgVN1goJLk+TP+lBL3OBOW3eOZgYrfWCoHTp/it
         w8BBFuBpBZBsJJNba3pvu8Vp/IXZOSyFSoeQHT9dTjw+qbWnbl8AIA/pDt8VJE9UFSs8
         BO4cYcsRDRwln62225FOY0kzyEHT1S9waMWsXZNzFoHrbQX4iZ2S+VWmYQZkEIqugu+X
         9EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290375; x=1782895175;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3/JHiz/wa8RugXMvE46Tu+Cf65I/KDDNxer4eDoJdI=;
        b=DihW1MVlIW68Q4LCpdLJfghnORzoah/ZD0pviSMs3Sk9hx8ksYvzvYWsS2klNfQsfM
         7JnmqZtZ4zdDF6BjTdmE2JXHpuUpHKrwkAGDmaD7xDLqD0vNmnSfpoCskYIvVUt1Pt7v
         zRLc5pk9OSxqSOTb/ipLGb1zH0DOvVx4J6NRWza9Zdyt9Rm1ft/fLxKB7xdNKr257LW7
         U6V7gXGAPqnXRD7sfR13QMS6hyjG19c2lsjjbeKSVSmMU8N2bclV6p9CAdPbw3Z41LgR
         r0m8BgpVaLl8tO9q9TKxTpu23aUid3m2lG0yCojZkx6DbuslhpZ4tfI3HWzs+oqVhFkG
         tTQg==
X-Forwarded-Encrypted: i=1; AHgh+RpHMiekxp46xUAB1hObXxl5nX87NGWeAe+GBEdf4EDDBRm7VxlQah3haYXZ6YFR8TwTW3zESJxoWMMV8xexVx8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzIX6BPhjxFi89BMdXl+o0TEBqeQ+pzAuNpF+RH2Vt+vYtEAZq
	6W9K+VPCaJov0olmBUwnHlqp5UjMUvpbU/SzO9hu2puo4t/BngGUx7nh
X-Gm-Gg: AfdE7cmfz+QDsZ8nNoVGR0yDsgw8pUcfH89OhdkU3GDu14jFehYVvG+0wKqDkTN1t46
	wGoEvvicPUEvZLo7Wv3XKDNK+3uVmI5ktLvXZEd9BZRb+ciN/KCFYWm//z2ZA4H4XXwFamaYlGs
	B7u7fJ32dS3hzPKVnyjYIaBViJBIKpY8ODWBp6tRxqG6WGMsjd/QGTpyvNaKSdYjmqrYxajfvRj
	hDKNFUji45ktxkOUPq+wdFZesmzrFK6zXzWp1kZUGjnE6JXX2/2m8XLxnR0/84FgJ6cYaLQC9yh
	zUP8r8MfV3hDv4zc297bdqNSI0DPCuLwZfuRbVQI0aD5yaqUTaIs11Vmixts/OVOWXODeVt7VIg
	sUn62GGmt8bt/tf8/iRAwUrrzUEZ3tStmw4buEXcHUwlC3xgYXZbG4ZT5oZZBMNM1lw/FWXra0H
	xZoJ2mXV1wvbrXA86YdZcP3C5c4iKmQ5/dBz1tww==
X-Received: by 2002:a17:902:da4b:b0:2c6:d39d:3bb8 with SMTP id d9443c01a7336-2c7e151c89dmr27548155ad.26.1782290375007;
        Wed, 24 Jun 2026 01:39:35 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f85a4sm128717035ad.54.2026.06.24.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:39:34 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Jameson Thies <jthies@google.com>, Andrei Kuchynski <akuchynski@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Kaixuan Li <kaixuan.li@ntu.edu.sg>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 [PATCH] platform/chrome: cros_ec_typec: reject out-of-bounds PD cap count
Date: Wed, 24 Jun 2026 16:39:31 +0800
Message-ID: <178229037114.3009621.14045345257767446805@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

cros_typec_register_partner_pdos() copies the partner PDOs from the EC
TYPEC_STATUS response into the fixed caps_desc.pdo[PDO_MAX_OBJECTS] array.

	memcpy(caps_desc.pdo, resp->source_cap_pdos,
	       sizeof(u32) * resp->source_cap_count);
	...
	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
	       sizeof(u32) * resp->sink_cap_count);

PDO_MAX_OBJECTS is 7. source_cap_count and sink_cap_count are u8 fields
from the EC, and the only check is that they are not both zero. If either
is larger than 7, the memcpy writes past the end of the array on the stack.
A count of 255 overflows it by about 1 KB.

The ChromeOS EC firmware caps these counts today, so a compliant setup
does not hit this. The kernel should still validate the values from the EC
rather than trust them.

Validate the counts in cros_typec_handle_status() right after the
EC_CMD_TYPEC_STATUS command returns, and return early if either one is
above PDO_MAX_OBJECTS.

Fixes: 348a2e8c93d3 ("platform/chrome: cros_ec_typec: Register partner PDOs")
Suggested-by: Tzung-Bi Shih <tzungbi@kernel.org>
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..3ae9b35b7d85 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1158,6 +1158,12 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 		return;
 	}
 
+	if (resp.source_cap_count > PDO_MAX_OBJECTS ||
+	    resp.sink_cap_count > PDO_MAX_OBJECTS) {
+		dev_warn(typec->dev, "Invalid PDO count from EC, port: %d\n", port_num);
+		return;
+	}
+
 	/* If we got a hard reset, unregister everything and return. */
 	if (resp.events & PD_STATUS_EVENT_HARD_RESET) {
 		cros_typec_remove_partner(typec, port_num);
