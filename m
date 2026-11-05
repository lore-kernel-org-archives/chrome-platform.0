Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864837;
	b=matvgb1vWQrQgGjHYCRh+0KsBaRNGba1Mt6NaXuODoPuPK1x9ecChMh1d1n71qIYSZ7F
	 wRxEBmeup28UcDsL1ezZZ5qurOxpkl030oB/dx7WQ3EVKmaC7hF+hPq3byPGnPdROs0D5
	 b/iuTtvzgZz5NZp7pN7PgiWrfjXa1Zw/lZLjdcofpFDyxeyjsS3+0OrvkIuq7clD4DP7r
	 9hDOOVBGtExD/V56d1ZLushPz9lHWNBtBKirg32NYovTLt6bPfv/qZ1I9dkZjfMPtYapX
	 HavkxFcxWeUbHKpKoXWmLRFPytmfFfLMETu34QYBKgMA4gob0rsWw2Js+BbuxtWMGvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5+ptvV24y3XbQc74dkMGtzcsL/R+SrDapCbwiLFbiJs=;
	b=qDjepL7Dcb2/kLU92uhm9IVyq9R1rxj2fllo4tduIO8zVTpa0hLxH/DeubuD8Mj4rBHk
	 gDRITh/vj205YXJ+Y/LBTucKVnG68sDzQnYJJSshZgnIuqXNyzT0i8QiqeyTc1TozWSET
	 /IX9g5p/Ustz65EVcbtc90qKEbIM7ty/vmYjxgtnsIVRQTohrnjUDOSY78LNfG153EtWw
	 w6nL3X9MdCC9pOn1xGHOkdMbFkKcDFRRuz95ATPpV7/c6L2AJUrhfRHFzuXMEifb5O/H6
	 izKm+DALbIelMoW28aU5m0QcETgslfggXaR4meRqIxd43BVufZxsFzM/qzczkaxw10A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfrJUPcx;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B8606A326
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 07:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfrJUPcx
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1209816b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 04 Nov 2026 23:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793864836; x=1794469636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+ptvV24y3XbQc74dkMGtzcsL/R+SrDapCbwiLFbiJs=;
        b=YfrJUPcxVbzwRGDAW6DDCuAXQEXWAaE1peNfrMa9M5D5fo7BrqJ3RQA5rkD+EpvA4O
         6jylNO/56l8XDDT66L+G846tBTKkg+dd0o5OS5sULru0jdmd/6QTg6bgTc+04SUPz7Tv
         p4i961VUbnTZ9V7dhV6xTf7brIvFKPV3KRNPV3S07PL/gwrvNMah12YEQOroGrcM0XL8
         4s6K4lhXbKiV726LErfWyBvCPlanI4Of+Edz8xllTFPRKV78TUQ5xaJE7KQ8DJqccQKy
         XwffLqF1T/POweQ+AmzgXcmgd3lu7ocxUzWZgpn0uNCHerbOfd1MicfuLmAvIbU+UdjB
         mrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864836; x=1794469636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+ptvV24y3XbQc74dkMGtzcsL/R+SrDapCbwiLFbiJs=;
        b=AlTkHJmcU4AoIhq/mMTsUlX0/JuKe+qWC1b44x+ThZ0P4G81ZpcpQCJbDq+3D1ZSKU
         jhbKxtpizr51TYz7loKsG9UAJFJoLCCtsUI/pxVtmyZLSW+O+KRyUv1ym8SuCLd2XoJo
         5i50H/yJxfNqSXHTkTdqwSw9HJHurlQeqqbXDaMNiVpCeorS9/vXDeK95YDIvnQE3uzc
         3uFWtzA6zzRUNCrtD0AuAaGRibieM70eRFAee7+Q1ykhwdTxAnGzzBAsKCtrimMYnFlE
         rVXcvy0DI2opsbK/AXLzDsA4jPovUHUOxxObytnHr/6ag+eDoJJOrY/UuhvfE9NfpV0I
         6hsg==
X-Gm-Message-State: APuU4Z+cG6OVxAP60OF3osUNf1iahvD7Gk/eUmu9tdavlVlyi6UwT8L9
	AVXjWsrLOGEJ7TF5oJub/Yt5f80y8U/xATWkZ4/qSfjTPM/OIwHiT2HNF7clW1g=
X-Gm-Gg: AYBFou0xOl0mATvnKw7nZIX7XogjqS4+qQb37P/8fH4XL4Q5FM1unSwtr/JhZhtlWoj
	sagCgtU5Vfhp3f+3MBLqhC+EwxQC/XHualhDQNBUkyWRGYnXF+Ap0V7POgx7uJZHqYa6yLy+g6M
	NH2G7UR6K1mo62FrPCNjndV7wruxgNLlAS6ZjQRzAsAjxf+qTZnyTOa8MeOfczkb/NN8aMwmKag
	g3msiEm+s/KNEGPmVENKZjdeFsAQjnRz5QwHY1CrXAE/DeENT5ZYHPHtNk5Zp9vlvcsxxahNPse
	SOyPQpGtsSw3IGE7xlLTAN65iqC8tH9Kp5zpqlGby6oS4yf0N4JrwIn3oO7ONMpGyK8ndO/C8EP
	JM0gwL57ymKj0QBXIrdjJBOodWqIPaeD3OE6jIJCCt43cCDujMjorahA42JjCQLGerrmZvdoOw3
	ASm7ONbgHTFNp3YP4ceAYM9zlgvaTFnzGuGIfxJf01jH3HEGbV8EamxPqq4oZc2adFftVbL73TI
	zUHnGQf7/uj9SCvfmMaUTRcchePS99ZHBYoP2uAESyOq7yuW1ePyWdeBiGJHUvjVsMtxoOySPJ8
	vmXHwCnOuhApdqpUXv7UTvvGyqYj3rJj9Pps2hSGv8I4Y6xSsTIF+DYRstETDQFxANM97Q7TEw=
	=
X-Received: by 2002:a05:6a00:189e:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a9bf3393e9mr16363711b3a.39.1793864835640;
        Wed, 04 Nov 2026 23:47:15 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918d8sm1684628b3a.22.2026.11.04.23.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:47:15 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: chrome-platform@lists.linux.dev
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nick Crews <ncrews@chromium.org>
Subject: [PATCH v2] platform/chrome: wilco_ec: Fix device reference leak on open failure
Date: Thu,  5 Nov 2026 15:47:09 +0800
Message-ID: <20261105074709.55016-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

telem_open() takes a reference to dev_data->dev before allocating
the session. If that allocation fails, it returns -ENOMEM without
dropping the reference. Since release is not called after a failed
open, the device data remains pinned after removal.

Take the device reference only after the session allocation succeeds,
so that a failed open does not leave an unbalanced reference. The
successful open path remains balanced by telem_release().

Fixes: 1210d1e6bad1 ("platform/chrome: wilco_ec: Add telemetry char device interface")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Move get_device() after successful session allocation instead of
  adding put_device() to the allocation failure path, as suggested
  by Tzung-Bi Shih.
- Drop the obsolete Assisted-by trailer and retain the AI disclosure
  below.

v1 Message-ID: <rc-review-20261103-vc-85-d1e3d35e7c31@gmail.com>
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: baseline and v2 arm64 target objects, GCC 14.2.0, W=1.
CONFIG_COMPILE_TEST=y, CONFIG_OF_DYNAMIC=y, CONFIG_WILCO_EC_TELEMETRY=m.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) helped make the patch.

 drivers/platform/chrome/wilco_ec/telemetry.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index 45be318b05f6..b91cb62c4192 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -245,13 +245,13 @@
 	if (atomic_cmpxchg(&dev_data->available, 1, 0) == 0)
 		return -EBUSY;
 
-	get_device(&dev_data->dev);
-
 	sess_data = kzalloc_obj(*sess_data);
 	if (!sess_data) {
 		atomic_set(&dev_data->available, 1);
 		return -ENOMEM;
 	}
+
+	get_device(&dev_data->dev);
 	sess_data->dev_data = dev_data;
 	sess_data->has_msg = false;
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
