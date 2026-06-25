Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1601E8320
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782392466; cv=none; b=O0uZFHqJmn2BPkLcLzS8WJAOaZhb7u3ANeQkkbGHmECuzkStqJrltCC+s0Obaxp6foj3DmA+9v5wQ7xeHrlW7KTZyjvXfRGXoyMeBjUBMeh6YV0DmUwfpdIjHWWw6hPe9TL7DBCQ2YAGpZX4g4jTAuPwZHHCYWDuWudOU+Zo70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782392466; c=relaxed/simple;
	bh=1DoHU2Y2T/dGE4r5M5PYq6CElw0caXU9dLez6zNboDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D6jdFMdrgiH9IrPCMSV47qz5+zA0mOPLAPVUvDHNdbtmAQSU299NzvmpQDKLlM/nPt0/BUWVvTFVNsmX0rcRDGITErrBC1vjUNJCkgbbJwobNkgMQDagq1BCqZs1RhMVUlgK+NYxDSVJrxzl8hhhBp+Dr4hHay+dgxNKld2cB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge/nKonK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge/nKonK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so1331439a91.2
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782392464; x=1782997264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ81Cocrtw2dDH5NGikw9uURRBGajDc7MNQcdofYB2U=;
        b=Ge/nKonKmQUqU5c44Ra85+UWCtxWV/IedgqtMJ8ln5Wsn8bt/UcHFWOayYVHtsRSMS
         I4dKPIC/TgPJ0HuDeROxiZcyefjZc50utZo392DareVU+Wpt7YLxawtgk2Y7MHocFgkK
         ITy5kFjqcKQ15sQgfYFirOk39BSlTXpZTQypK7lJ7Qu+TAXBtDC3/e3q4K339HzOVH+P
         3kvAeZEbCPyZiZPexVhwX8gez7CnxAoVJijC0tUuBzSEjE6DEQOHHPArn6q8uBRofMqM
         5QcsX37wdlhfBdZN2ca6Q7+AQgQUMdTxTUD8kLZM58KWDRYE/iBHCYkvcZe7KTEtnrBD
         Gstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782392464; x=1782997264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQ81Cocrtw2dDH5NGikw9uURRBGajDc7MNQcdofYB2U=;
        b=sr0zz3E7OHtlsqTTc3yLbpUeUQfPwD0aXQCNnDu7J+QTbhCh1INvTOPFwZ/0YWXwXA
         KsU3Re5e/WDZIm5SJWvoOVPcrwCxbMsBmYbHwXD9hl7zaTGOPt4CzYToC5+lg3BKloS2
         O+TaRHqfxDcoilO9eC310WwoZOKQzElR+6gDGsMk/0HtRxhGvjWcirLSNe9OnejWVSwf
         1wXhDV4A4gIrCg2c63l9JGPRXoCI8pbrbIZnbjkST91Rx41exdMfLzKsfHhtz2POfT6U
         diWXL06ZLmSiR7LGmgqVqmzevKGQCOh+GyVo9bhV4ablBBLn9ELseietC8rG5M2cjo5Z
         A5Vw==
X-Forwarded-Encrypted: i=1; AHgh+RquCExwNQVrsSux7N5jMlNYxzzMpXjeoWsw5srFoOC3/TbYh772LNlv9LIHEZoqyGS2J3OZn0jLvmAuvI0Gi/M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp9sjSmbJQS83YvRn49b3CperWCSolxa5SsmHrO7D7yKWouYHa
	sIqFqQvO2gygOiWXjZ3ANtKEU1mZgGg+vzUxubKfYWE9L9fLY2KB6XbD
X-Gm-Gg: AfdE7ck1yFswZk1Ut5RUXuTVgGBJtoZEHR6Jnox637v8onraRwRhFdlKSRM79hRjR3c
	d1txVleP9h4hMlBlaqalbcG0M5GgJZb3t6LPu0w/DJ2jhKeYjjHIwzBBfxzfPB1oEyEVZoNPQm0
	8/2rs9eRRj1NZkLPxupfKXdIGh9OV/Ugoxo69t2B0PywggF6alXWsA6KjGUNRWTtxW7/uJtfP/e
	n+YkRyuffwYk+NNt0/mdvgrk34BH13SC5QRbaLGGy3no1yltjWhlzo4pG4dTiEG1eHZpLURMcy7
	lvAwJD+EMMm81bmAeErWSQJo8HwBuY2Fzw1fi7WAO7omjRP6LrNaBhoYwi8qpt34s2tXezM5yFk
	pX8+CE2v9yJWioJne0kL/Jm9cklsuvJSif12X+dPo4Tfplo6bF4SCoS+DhPd4HoPEExsGbCg/OJ
	uoedRHjKck+ELsiil3o6k0mmmhs3MjydRKTQ/UDQ1hL1NTM3X7
X-Received: by 2002:a17:90a:d005:b0:37d:f6d8:b50e with SMTP id 98e67ed59e1d1-37df9f5a4f3mr2454393a91.9.1782392463741;
        Thu, 25 Jun 2026 06:01:03 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd556e39sm1654223a12.32.2026.06.25.06.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:01:03 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Maoyi Xie <maoyixie.tju@gmail.com>,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/chrome: cros_ec_typec: reject out-of-bounds PD cap count
Date: Thu, 25 Jun 2026 21:00:56 +0800
Message-Id: <20260625130056.3378097-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_typec_register_partner_pdos() copies the partner PDOs from the EC
TYPEC_STATUS response into the fixed caps_desc.pdo[PDO_MAX_OBJECTS] array.

	memcpy(caps_desc.pdo, resp->source_cap_pdos,
	       sizeof(u32) * resp->source_cap_count);
	...
	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
	       sizeof(u32) * resp->sink_cap_count);

PDO_MAX_OBJECTS is 7. source_cap_count and sink_cap_count are u8 fields
from the EC. The only check is that they are not both zero. If either is
larger than 7, the memcpy writes past the end of the array on the stack.
A count of 255 overflows it by about 1 KB. The EC source arrays are only
seven entries wide. A larger count reads past them too.

The ChromeOS EC firmware caps these counts today, so a compliant setup
does not hit this. The kernel should still validate these values rather
than trust them.

Validate the counts in cros_typec_register_partner_pdos() next to the
memcpy. Skip the PDO registration if either count is above PDO_MAX_OBJECTS.
The rest of cros_typec_handle_status() still runs so events are handled
and cleared.

Fixes: 348a2e8c93d3 ("platform/chrome: cros_ec_typec: Register partner PDOs")
Suggested-by: Tzung-Bi Shih <tzungbi@kernel.org>
Suggested-by: Andrei Kuchynski <akuchynski@chromium.org>
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: Move the check into cros_typec_register_partner_pdos() next to the
    memcpy it guards. v1 put it at the top of cros_typec_handle_status()
    and returned early. That skipped the rest of the status handling and
    left events uncleared.

v1: https://lore.kernel.org/r/178229037114.3009621.14045345257767446805@maoyixie.com

 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..50a68819ceb7 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1119,6 +1119,12 @@ static void cros_typec_register_partner_pdos(struct cros_typec_data *typec,
 	if (!resp->source_cap_count && !resp->sink_cap_count)
 		return;

+	if (resp->source_cap_count > PDO_MAX_OBJECTS ||
+	    resp->sink_cap_count > PDO_MAX_OBJECTS) {
+		dev_warn(typec->dev, "Invalid PDO count from EC, port: %d\n", port_num);
+		return;
+	}
+
 	port->partner_pd = typec_partner_usb_power_delivery_register(port->partner, &desc);
 	if (IS_ERR(port->partner_pd)) {
 		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n", port_num);
